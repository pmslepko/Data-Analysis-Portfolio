# Data-Analysis-Portfolio
This is my place to showcase projects that hopefully will help me show my skills in actions

## Current Project

# Historical Performance of Savings Portfolio

## Overview

This project focuses on historical performance of an example savings portfolio. It includes two indices (S&P 500 and NASDAQ 100), two ETFs (VWRL.L and VFEM.L), a bank savings account with an annual interest rate of 2 percent and an overall 'money invested' index. 

The performance is calculated based on an initial investment of 10 000 and monthly contributions of 100. The starting date of the data is 02 January 2013 and the ending date is 05 January 2025.

### Dashboard Preview
![alt text](https://github.com/pmslepko/Data-Analysis-Portfolio/blob/main/Historical%20Performance%20of%20Savings%20Portfolio/Historical%20Performance%20of%20Savings%20Portfolio%20preview.png)

### Outcomes

The analysis shows which financial instrument (FI) performed better than the others during the twelve years period. 

The best-performing FI was NASDAQ 100 which showed percentage change relative to money invested as high as 237%, beating S&P 500 which changed only 89% with VWRL catching on it's toes at 81%. 

Two worst-performing FIs were bank savings (16% change) and VFEM.L (-5% change!). Even though bank savings are at 16% relative change, it was surely eaten up by inflation and unprofitable.

Please remember this is not a financial advice but an analysis of historical performance.

### Creation Process

There were five main steps in the creation process of this dashboard:

1. Data fetch from yfinance API with initial transformation and calculation using Python
2. Power BI data import and further transformation
3. Creating calculation measures using DAX
4. Creating the visualisations and formatting the charts
5. Refining the dashboard

## Tools Used

Python

yfinance API

Power BI

DAX

## Planned Updates

In the future I want the viewer to be able to input their own initial investment and monthly contribution value.

Another thing I want to add is the ability to change the starting and ending date of the saving process.
