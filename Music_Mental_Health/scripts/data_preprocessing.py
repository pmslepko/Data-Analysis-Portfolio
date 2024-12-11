import pandas as pd
# Specify the path to the data file
data_path = '../data/Music_Mental_Health_Survey.csv'

# Load the dataset into a pandas DataFrame
df = pd.read_csv(data_path)

# Display the first few rows of the dataset to understand its structure
print(df.head())

# Check for missing values in each column
print(df.isnull().sum())

# Drop rows with any missing values
df = df.dropna()

# Confirm that there are no more missing values
print(df.isnull().sum())


# Define a mapping for the frequency categories
frequency_map = {
    'Never': 0,
    'Rarely': 1,
    'Sometimes': 2,
    'Very frequently': 3
}

# Identify columns that contain frequency information
genre_columns = [col for col in df.columns if 'Frequency' in col]

# Apply the mapping to each genre column
for col in genre_columns:
    df[col] = df[col].map(frequency_map)

# Display the first few rows to check the transformation
print(df.head())

# Specify the path for the preprocessed data file
preprocessed_data_path = '../data/Preprocessed_Music_Mental_Health_Survey.csv'

# Save the preprocessed DataFrame to a CSV file
df.to_csv(preprocessed_data_path, index=False)

print("Preprocessed data saved to:", preprocessed_data_path)
