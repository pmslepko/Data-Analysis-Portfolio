from yahooquery import search

# Define a keyword to search for tickers
query = "VWRL"

# Search for tickers related to the query
result = search(query)

# Extract and print matching tickers
tickers = result.get("quotes", [])
for ticker in tickers:
    print(f"Symbol: {ticker['symbol']}, Name: {ticker['longname']}, Exchange: {ticker['exchange']}")