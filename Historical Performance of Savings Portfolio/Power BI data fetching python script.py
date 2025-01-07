import yfinance as yf
import pandas as pd

# Define tickers and start date
tickers = ['^NDX', '^GSPC', 'VWRL.L', 'VFEM.L']
start_date = '2013-01-02'  # Start date

# Fetch daily data for all tickers
df = yf.download(tickers, start=start_date, interval='1d')

# Keep only the Adjusted Close prices and reset index
adj_close = df['Adj Close'].reset_index()
adj_close.rename(columns={'Date': 'Date'}, inplace=True)

# Melt the data into long format
adj_close_long = adj_close.melt(id_vars=['Date'], var_name='Ticker', value_name='Adjusted Close Price')

# Add a fictional ticker for "Bank Savings"
# Assuming a constant daily growth rate based on an annual interest rate of 2%
annual_interest_rate = 0.02
daily_interest_rate = (1 + annual_interest_rate) ** (1 / 252) - 1  # 252 trading days in a year

# Add monthly contributions and compound them
monthly_contribution = 100  # Set monthly contribution value
initial_investment = 10000  # Initial investment amount

def calculate_bank_savings_with_contributions(dates):
    cumulative_savings = []
    current_savings = initial_investment  # Start with the initial investment
    
    for i, date in enumerate(dates):
        # Apply daily compounding
        current_savings *= (1 + daily_interest_rate)
        
        # Add monthly contribution on the first day of each month
        if i > 0 and date.day == 1:
            current_savings += monthly_contribution
        
        cumulative_savings.append(current_savings)
    
    return cumulative_savings

bank_savings = pd.DataFrame({
    'Date': adj_close['Date'],
    'Ticker': 'Bank Savings',
    'Adjusted Close Price': calculate_bank_savings_with_contributions(adj_close['Date'])
})

# Combine bank data with the original data
adj_close_long = pd.concat([adj_close_long, bank_savings], ignore_index=True)

# Add a fictional ticker for "Money Invested"
def calculate_money_invested(dates):
    total_invested = []
    cumulative_investment = initial_investment
    for i, date in enumerate(dates):
        # Add monthly contributions at the start of each month
        if i > 0 and date.day == 1:
            cumulative_investment += monthly_contribution
        total_invested.append(cumulative_investment)
    return total_invested

money_invested = pd.DataFrame({
    'Date': adj_close['Date'],
    'Ticker': 'Money Invested',
    'Adjusted Close Price': calculate_money_invested(adj_close['Date'])
})

# Combine Money Invested with the original data
adj_close_long = pd.concat([adj_close_long, money_invested], ignore_index=True)

# Calculate Daily Return for each Ticker
adj_close_long['Daily Return'] = adj_close_long.groupby('Ticker')['Adjusted Close Price'].pct_change()

# Fill the first row for Daily Return with 0 for each Ticker
adj_close_long.loc[adj_close_long.groupby('Ticker').head(1).index, 'Daily Return'] = 0

# Calculate Daily Growth Factor (1 + Daily Return)
adj_close_long['Daily Growth Factor'] = 1 + adj_close_long['Daily Return']

# Calculate Cumulative Growth Factor for each Ticker
adj_close_long['Cumulative Growth Factor'] = adj_close_long.groupby('Ticker')['Daily Growth Factor'].cumprod()

# Add Growth Factor with Contributions Column
def calculate_growth_with_contributions(group):
    cumulative_with_contributions = []
    current_value = 1  # Start with a growth factor of 1

    for i, row in group.iterrows():
        # Add contribution at the start of a new month
        if i > 0 and row['Date'].day == 1:  # Check if it's the 1st day of the month
            current_value += (monthly_contribution / initial_investment)  # Normalize contribution to growth factor scale
        
        # Apply daily growth factor
        current_value *= row['Daily Growth Factor']
        cumulative_with_contributions.append(current_value)
    
    return pd.Series(cumulative_with_contributions, index=group.index)

adj_close_long['Growth Factor with Contributions'] = adj_close_long.groupby('Ticker').apply(calculate_growth_with_contributions).reset_index(level=0, drop=True)

# Preview the first few rows
print(adj_close_long.head(10))
