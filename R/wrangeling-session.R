source(here::here("R/package-loading.R"))

glimpse(NHANES)
str(NHANES)
summary(NHANES)
?NHANES

NHANES %>%
  colnames() %>%
  length()

NHANES %>%
  mutate(Height = Height / 100,
         Testing = "Yes",
         HighlyActive = if_else(
           PhysActiveDays >= 5,
           "yes",
           "no"
         ))

# Calculate average urine volume ------------------------------------------

NHANES_updated <- NHANES %>%
  mutate(UrineVolAverage=(UrineVol1 +
                          UrineVol2)/2
         )


# Modify Pulse variable ---------------------------------------------------

NHANES_updated <- NHANES_updated %>%
  mutate(PulseSec=Pulse / 60
  )



# Create YoungChild variable (True for children <= 6 y) -------------------

NHANES_updated <- NHANES_updated %>%
  mutate(YoungChild = if_else(
           Age <= 6,
           TRUE,
           FALSE
         ))

NHANES %>%
  select(Gender, BMI, Age) %>%
  select(-Age)

NHANES %>%
  select(starts_with("Smoke"),
  contains("Vol"),
  matches("[123]"))
#regular expressions are powerful but complicated

NHANES %>%
  rename(
    #NewName = OldName
    NumberBabies = nBabies,
    Sex = Gender
    )

#Select and rename can be combined in one step
NHANES %>%
  select(Gender, BMI,
    NumberBabies = nBabies,
    Gender
  )

NHANES %>%
  filter(Gender == "female")
NHANES %>%
  filter(Gender != "female")
NHANES %>%
  filter(BMI == 25)
NHANES %>%
  filter(BMI >= 25)
NHANES %>%
  filter(BMI >= 25 & Gender == "female")
NHANES %>%
  filter(BMI >= 25 | Gender == "female")


NHANES %>%
  arrange(Age) %>%
  select(Age)

NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

NHANES %>%
  arrange(desc(Age), Gender) %>%
  select(Age, Gender)


# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == "Yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter((Work == "Working" | HomeOwn == "Rent") & Diabetes == "No") %>%
  select(Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(nBabies, Age)  %>%
  filter(row_number() == 1L)

NHANES %>%
   select(nBabies, Age) %>%
   filter(!is.na(nBabies)) %>%
   filter(nBabies==max(nBabies))

NHANES %>%
  select(nBabies, Age) %>%
  filter(nBabies==max(nBabies, na.rm = TRUE))


NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Work) %>%
  summarise(
    MeanBMI = mean(BMI, na.rm = TRUE),
    MeanAge = mean(Age, na.rm = TRUE)
    )

table4b %>%
  gather(year, population, -country)


nhanes_simple <- NHANES %>%
  select(SurveyYr, Gender, Age,
         Weight, BMI, BPSysAve)

nhanes_long <- nhanes_simple %>%
  gather(Measure, Value,
         -SurveyYr, -Gender)

nhanes_summary <- nhanes_long %>%
  group_by(SurveyYr,Gender, Measure) %>%
  summarise(
    MeanValue = mean(Value,na.rm = TRUE)
  )


nhanes_summary %>%
  spread(SurveyYr, MeanValue)
nhanes_summary %>%
  spread(Gender, MeanValue)




Variables<-c("Age",
  "AgeDiabetesDiagnosis",
  "BMI",
  "BPDiaAve",
  "BPSysAve",
  "DrinksOfAlcoholInDay",
  "MoreThan5DaysActive",
  "NumberOfBabies",
  "Poverty",
  "TotalCholesterol",
  "Gender",
  "SurveyYr")

NHANES %>%
  select(Variables)

NHANES_for_exercise <- NHANES %>%
  rename(
    AgeDiabetesDiagnosis = DiabetesAge,
    NumberOfBabies = nBabies,
    DrinksOfAlcoholInDay = AlcoholDay,
    TotalCholesterol = TotChol
         )

NHANES_for_exercise %>%
  select(Variables)

NHANES_for_exercise <- NHANES_for_exercise %>%
  mutate(
         MoreThan5DaysActive = if_else(
           PhysActiveDays > 5,
           1,
           0
         ))


NHANES_for_exercise_simple <- NHANES_for_exercise %>%
  select(Variables)

NHANES_for_exercise_long <- NHANES_for_exercise_simple %>%
  gather(Measure, Value,
         -SurveyYr, -Gender)

NHANES_for_exercise_summary <- NHANES_for_exercise_long %>%
  filter(Age < 75 & Age > 20) %>%
  group_by(SurveyYr,Gender, Measure) %>%
  summarise(
    MeanValue = mean(Value,na.rm = TRUE)
  )

TABLE_exercise <- NHANES_for_exercise_summary %>%
  spread(SurveyYr, MeanValue)



