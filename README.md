# 🇮🇳 Lok Sabha Election Results Analysis (1951–2024)

An end-to-end data analysis project exploring India's Lok Sabha General Election results from **1951 to 2024** using Python, Jupyter Notebook, Excel, and Microsoft Power BI.

This project focuses on analysing historical election data, understanding party performance, examining electoral competition, identifying voting patterns, and presenting insights through an interactive Power BI dashboard.

## 📌 Project Overview

Indian general elections provide valuable insights into the country's political and electoral history.

This project analyses Lok Sabha election results across multiple decades to explore:

- Election trends over time
- Political party performance and dominance
- Constituency-level election results
- State-wise electoral patterns
- Candidate performance and winning margins
- Close contests and vote distribution
- Voter turnout and electoral participation

The project combines **Python-based exploratory data analysis (EDA)** with an **interactive Power BI dashboard** to make historical election data easier to explore and understand.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data cleaning and analysis |
| Jupyter Notebook | Exploratory data analysis |
| Pandas | Data manipulation |
| NumPy | Numerical operations |
| Matplotlib | Data visualisation |
| Seaborn | Statistical visualisation |
| Microsoft Excel | Historical election dataset |
| Microsoft Power BI | Interactive dashboard |
| DAX | Dashboard calculations and measures |
| Git & GitHub | Version control and project hosting |

## 📂 Project Structure

```text
Lok-Sabha-Election-Analysis/
│
├── README.md
│
├── LOKSABHA 1951-2024.xlsx
│
├── LOK_SABHA_ANALYSIS 1951-2024.ipynb
│
├── Loksabha Election Result Dashboard.pbix
│
└── outputs/
    ├── election_trends/
    ├── party_performance/
    ├── constituency_analysis/
    ├── state_analysis/
    ├── candidate_analysis/
    └── data_validation/
```

*The `outputs/` folders contain generated visualisations where applicable.*

## 📊 Dataset

**Dataset:** `LOKSABHA 1951-2024.xlsx`

The dataset contains historical Lok Sabha election results from 1951 to 2024.

It includes information such as:

- Election year
- State and Union Territory
- Constituency number and name
- Candidate name
- Political party
- Total electors
- Total votes polled
- Candidate votes
- Turnout percentage
- Result position
- Winning margin in votes
- Winning margin percentage

The dataset was compiled from historical election result records, including Election Commission of India (ECI) published results.

## 🔍 Python Data Analysis

The Jupyter Notebook contains multiple analysis sections organised around the following areas.

### 1. Election Overview

- Election-wise overview
- Number of constituencies
- Candidate participation
- Political party participation
- State and Union Territory participation
- Historical election trends

### 2. Political Party Performance

- Party-wise winning margins
- Party dominance across elections
- Party ranking changes over time
- Parties winning seats with low vote share
- Party performance consistency and volatility

### 3. Constituency Analysis

- Constituency-level election patterns
- Winning margins
- Close election contests
- Historical constituency performance

### 4. State and Regional Analysis

- State-wise election performance
- Regional political trends
- State-level party performance
- Electoral patterns across regions

### 5. Candidate and Electoral Competition

- Candidate vote performance
- Candidate winning-margin history
- Runner-up patterns
- Multi-candidate contests
- Vote fragmentation

### 6. Data Validation

- Winner count and official seat count comparison
- Turnout discrepancy checks
- Votes polled versus total electors
- Candidate vote totals versus constituency totals
- Missing and inconsistent election records

## 📈 Power BI Dashboard

**Dashboard file:** `Loksabha Election Result Dashboard.pbix`

An interactive Power BI dashboard has been developed to explore election results using filters and visualisations.

### Dashboard Features

- Election year slicer
- State and Union Territory slicer
- Total Electors
- Total Voted
- Voter Turnout Percentage
- Election result comparisons
- Interactive filtering based on the selected year and state

The dashboard uses DAX measures to calculate constituency-level electoral metrics.

### Key Metric Calculations

**Total Electors**

Calculated by summing the maximum recorded electorate for each distinct constituency within the selected year and state.

**Total Voted**

Calculated by summing the maximum recorded votes polled for each distinct constituency within the selected year and state.

**Voter Turnout Percentage**

Calculated using the average turnout percentage across distinct constituencies within the selected year and state.

These calculations help avoid counting constituency-level totals repeatedly when multiple candidate records exist for the same constituency.

## 🚀 How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/kumarseithigal/Loksabha-Election-Analysis-1951-2024.git
```

### 2. Navigate to the Project Folder

```bash
cd Loksabha-Election-Analysis-1951-2024
```

### 3. Install Required Python Libraries

```bash
pip install pandas numpy matplotlib seaborn openpyxl jupyter
```

### 4. Open Jupyter Notebook

```bash
jupyter notebook
```

### 5. Run the Analysis

Open:

`LOK_SABHA_ANALYSIS_CLEANED.ipynb`

Make sure the Excel dataset is available in the expected working directory, then execute the notebook cells in order.

### 6. Open the Power BI Dashboard

Open:

`Loksabha Election Result Dashboard.pbix`

If Power BI requests the Excel data source, update the source path to the location of `LOKSABHA 1951-2024.xlsx`.

## ⚠️ Data Considerations

Historical election data requires careful interpretation.

- State and Union Territory boundaries have changed over time.
- Constituency names and boundaries may have changed.
- Political parties may have changed names, merged, or split.
- Historical elections may contain multiple-winner result labels.
- Candidate vote share calculations depend on the available recorded candidate votes.
- Missing or inconsistent historical records may affect some comparisons.

Therefore, long-term historical comparisons should be interpreted with these limitations in mind.

## 🎯 Project Objectives

1. Explore India's Lok Sabha election history from 1951 to 2024.
2. Identify political party performance and electoral dominance.
3. Understand constituency-level voting patterns.
4. Analyse candidate competition and winning margins.
5. Examine voter participation and turnout.
6. Build an interactive dashboard for exploring election results.
7. Present historical electoral data through meaningful visualisations.

## 🔮 Future Improvements

- Add more advanced historical election comparisons.
- Develop interactive constituency-level analysis.
- Improve party identity and historical party-name mapping.
- Add geographical election visualisations.
- Integrate additional election datasets.
- Publish an online interactive version of the dashboard.

## 👨‍💻 Author

**Sathis Kumar P**

[🌐 Portfolio Website](https://sathiskumar.com)

Data Analysis | Python | Power BI | Data Visualisation
---

*This project is developed for educational, analytical, and historical exploration of Indian Lok Sabha election results.*