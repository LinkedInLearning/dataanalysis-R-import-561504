# Titel:    Uebersichtlichkeit durch Pipes  %>%
# Datei:    02_08_Pipes.R

# Installieren und Laden von Paketen ################################
#####################################################################
##Dokumentation zu den Paketen: https://cran.r-project.org/web/packages/
## oder https://www.rdocumentation.org/

# Nutze dafuer den Pakete-Manager "pacman" (ist selbst ein Paket):
# https://www.rdocumentation.org/packages/pacman/versions/0.5.1

# Installiere das Paket pacman, falls erforderlich
if (!require("pacman")) install.packages("pacman")

# Mit pacman koennen weitere Pakete unkompliziert geladen werden
pacman::p_load(pacman, tidyverse)

#####################################################
# Importieren und Aufbereiten von Daten
# Speichere Daten als "df" (fuer Dataframe)

# Importieren von csv-Dateien mit dem Paket readr und Funktion read_csv() 
# (readr::read_csv()) von tidyverse
df <- read_csv("Daten/adult.csv")
#Informationen zum Datensatz unter  https://archive.ics.uci.edu/ml/datasets/Census+Income 
#auch als "adult" Dataset bekannt

# Datensatz ansehen
View(df)

#############################################################################
#Bereite Daten auf: 

##1. Ohne Pipe %>%:
df1 <- read_csv("Daten/adult.csv") #Daten importieren
df1[df1 == "?"]<-NA       #Missing Values (NAs) kenntlich machen
df1 <- tibble(df1)       #lege df1 als tibble (Dataframe) ab
df1 <- select(df1,age, 
              occupation, 
              income)    #speichere nur bestimmte Spalten
df1$occupation <- as.factor(df1$occupation)  #wandle Spalte "occupation" in einen factor um
colnames(df1)[colnames(df1) == "income"] <- "y_Variable" #benenne Spalte "income" um
print(df1)

##2. wie 1. nur mit Pipe %>%:
df2 <- read_csv("Daten/adult.csv") %>%
            na_if(., "?") %>%
            as_tibble() %>%
            select(age, 
                occupation, 
                income) %>% 
            mutate(occupation = as.factor(occupation)) %>%  
            rename(y_Variable = income) %>%
        print()


##############################################################
# Environment leeren
rm(list = ls()) 

# Global environment leeren bzw. alle Pakete aus Arbeitsspeicher entfernen
p_unload(all)  #Befehl erfordert Paket "paceman"
detach("package:datasets", unload = TRUE)  # ohne "paceman", nur mit "base"

# Konsole leeren
cat("\014")  # ctrl+L
