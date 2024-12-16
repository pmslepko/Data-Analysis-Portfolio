import yfinance as yf
import pandas as pd
from openpyxl import Workbook
from pathlib import Path

# Define the list of ticker symbols
tickers = ["AAPL", "MSFT", "GOOGL"]  # Replace with your list of tickers

# Get the script's current folder and determine the parent directory
current_folder = Path(__file__).resolve().parent
parent_folder = current_folder.parent

# Define the output file path in the parent folder
output_file = parent_folder / "tickers_data.xlsx"

# Create an Excel writer object
with pd.ExcelWriter(output_file, engine="openpyxl") as writer:
    for ticker_symbol in tickers:
        # Create a Ticker object
        etf = yf.Ticker(ticker_symbol)

        # Fetch historical market data for the maximum available time frame
        historical_data = etf.history(period="max", auto_adjust=False).reset_index()

        # Remove timezone information from the Date column
        historical_data["Date"] = historical_data["Date"].dt.tz_localize(None)

        # Add Dividends and Stock Splits
        historical_data["Dividends"] = etf.dividends.reindex(historical_data["Date"]).values
        historical_data["Stock Splits"] = etf.splits.reindex(historical_data["Date"]).values

        # Fetch metadata from the `info` dictionary
        info = etf.info

        # Create a DataFrame for metadata
        metadata = {
            "longName": info.get("longName", "N/A"),
            "shortName": info.get("shortName", "N/A"),
            "exchange": info.get("exchange", "N/A"),
            "currency": info.get("currency", "N/A"),
            "sector": info.get("sector", "N/A"),
            "industry": info.get("industry", "N/A"),
            "marketCap": info.get("marketCap", "N/A"),
            "beta": info.get("beta", "N/A"),
            "trailingPE": info.get("trailingPE", "N/A"),
            "forwardPE": info.get("forwardPE", "N/A"),
            "dividendYield": info.get("dividendYield", "N/A"),
            "fiveYearAvgDividendYield": info.get("fiveYearAvgDividendYield", "N/A"),
            "trailingAnnualDividendRate": info.get("trailingAnnualDividendRate", "N/A"),
            "dividendRate": info.get("dividendRate", "N/A"),
            "fundFamily": info.get("fundFamily", "N/A"),
            "category": info.get("category", "N/A"),
            "totalAssets": info.get("totalAssets", "N/A"),
            "yield": info.get("yield", "N/A"),
            "fundInceptionDate": info.get("fundInceptionDate", "N/A"),
            "legalType": info.get("legalType", "N/A"),
            "morningStarOverallRating": info.get("morningStarOverallRating", "N/A"),
            "morningStarRiskRating": info.get("morningStarRiskRating", "N/A"),
            "sustainabilityScore": info.get("sustainabilityScore", "N/A"),
            "navPrice": info.get("navPrice", "N/A"),
            "netExpenseRatio": info.get("netExpenseRatio", "N/A"),
            "annualReportExpenseRatio": info.get("annualReportExpenseRatio", "N/A"),
            "threeYearAverageReturn": info.get("threeYearAverageReturn", "N/A"),
            "fiveYearAverageReturn": info.get("fiveYearAverageReturn", "N/A"),
            "tenYearAverageReturn": info.get("tenYearAverageReturn", "N/A"),
        }

        # Add metadata to the historical data
        for key, value in metadata.items():
            historical_data[key] = value

        # Write the data to a sheet named after the ticker
        historical_data.to_excel(writer, sheet_name=ticker_symbol, index=False)

        # Print a success message for each ticker
        print(f"Data for {ticker_symbol} added to Excel sheet.")

# Final success message
print(f"All tickers' data saved to '{output_file}'.")