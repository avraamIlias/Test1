# Wrangling----

## Aufgabe 1----
### a----
retail_data <- read.csv("retail_data.csv")
# oder über reader/base

### b----
head(retail_data, 5)

### c----
str(retail_data)
dim(retail_data)


## Aufgabe 2----
### a----
retail_data$Kategorie <- tolower(retail_data$Kategorie)

### b----
retail_data$Umsatz_nach_Rabatt <- retail_data$Umsatz * (1 - retail_data$Rabatt)

### c----
retail_data$Datum <- as.Date(retail_data$Datum, format = "%Y-%m-%d")



## Aufgabe 3----
### a----
library(dplyr)

region_umsatz <- retail_data %>%
  group_by(Region) %>%
  summarise(Durchschnittsumsatz = mean(Umsatz_nach_Rabatt))

### b----
print(region_umsatz)



## Aufgabe 4----
### a----
umsatz_filter <- retail_data %>%
  filter(Umsatz > 3000)
umsatz_filter

### b----
umsatz_filter_b <- retail_data %>%
  filter(Umsatz > 3000) %>%
  select(Datum, Filiale, Umsatz)
umsatz_filter_b



## Aufgabe 5----
### a----
barplot(retail_data$Umsatz, 
        names.arg = retail_data$Produkt)

        
### b----
library(ggplot2)

ggplot(retail_data, aes(x = Kategorie, y = Umsatz, fill = Kategorie)) +
  geom_bar(stat = "identity") +
  labs(title = "Umsatz nach Kategorie", x = "Kategorie", y = "Umsatz")


