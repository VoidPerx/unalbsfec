# unalbsfec
# Title of the Project
# Thesis Project: [Project Title]
# Author: [Your Name]
# Date: [Date]

# Logical Framework Documentation
# This script describes the logical framework of the thesis project, including objectives, activities, expected results, and indicators.

# 1. General Objective
GO <- "Describe the general objective of the project here"

# 2. Specific Objectives
SO <- c(
  "Specific Objective 1: Describe here",
  "Specific Objective 2: Describe here",
  "Specific Objective 3: Describe here"
)

# 3. Expected Results
ER <- c(
  "Expected Result 1: Describe here",
  "Expected Result 2: Describe here",
  "Expected Result 3: Describe here"
)

# 4. Activities
ACT <- data.frame(
  Activity = c("Activity 1", "Activity 2", "Activity 3"),
  Description = c("Description of Activity 1", 
                  "Description of Activity 2", 
                  "Description of Activity 3"),
  Responsible = c("Responsible 1", "Responsible 2", "Responsible 3"),
  Start_Date = as.Date(c("2025-05-01", "2025-05-15", "2025-06-01")),
  End_Date = as.Date(c("2025-05-10", "2025-05-25", "2025-06-10"))
)

# 5. Indicators and Means of Verification
IND <- data.frame(
  Indicator = c("Indicator 1", "Indicator 2", "Indicator 3"),
  Means_Verification = c("Means 1", "Means 2", "Means 3"),
  Target = c("Target 1", "Target 2", "Target 3")
)

# 6. Assumptions
ASMP <- c(
  "Assumption 1: Describe here",
  "Assumption 2: Describe here",
  "Assumption 3: Describe here"
)

# Glossary
GLOSSARY <- data.frame(
  Acronym = c("GO", "SO", "ER", "ACT", "IND", "ASMP"),
  Meaning = c(
    "General Objective",
    "Specific Objectives",
    "Expected Results",
    "Activities",
    "Indicators and Means of Verification",
    "Assumptions"
  )
)

# Exporting Logical Framework and Glossary to Excel
library(openxlsx)

# Create a new workbook
wb <- createWorkbook()

# Add worksheets
addWorksheet(wb, "Logical Framework")
addWorksheet(wb, "Glossary")

# Write data to worksheets
writeData(wb, "Logical Framework", x = list(
  "General Objective" = GO,
  "Specific Objectives" = SO,
  "Expected Results" = ER,
  "Activities" = ACT,
  "Indicators" = IND,
  "Assumptions" = ASMP
))

writeData(wb, "Glossary", x = GLOSSARY)

# Save the workbook
saveWorkbook(wb, file = "Logical_Framework.xlsx", overwrite = TRUE)

print("Logical Framework and Glossary have been exported to Logical_Framework.xlsx")
