import yfinance as yf

ticker = "VWRL.AS"  # Replace with the suspected ticker
try:
    etf = yf.Ticker(ticker)
    info = etf.info
    print(f"Ticker: {ticker}")
    print(f"Name: {info.get('longName', 'N/A')}")
    print(f"Exchange: {info.get('exchange', 'N/A')}")
    print(f"Market Cap: {info.get('marketCap', 'N/A')}")
except Exception as e:
    print(f"Error fetching ticker {ticker}: {e}")