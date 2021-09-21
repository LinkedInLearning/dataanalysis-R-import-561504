# Titel: Datenstrukturen
# Datei: 02_04_Datenstrukturen.R

##############################################
####DATENSTRUKTUREN################
##############################################

## Vektor ==================================================

v1 <- c(1, 2, 3, 4, 5)
v1
is.vector(v1)

v2 <- c("a", "b", "c")
v2
is.vector(v2)

v3 <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
v3
is.vector(v3)

## Matrix ==================================================

m1 <- matrix(c(T, T, F, F, T, F), nrow = 2)
m1

m2 <- matrix(c("a", "b", 
               "c", "d"), 
             nrow = 2,
             byrow = T)
m2

## Array ===================================================

# Erstelle ein Array mit Daten von 1 bis 24 in 4 Zeilen, 3 Spalten und 2 Tabellen  
a1 <- array(c( 1:24), c(4, 3, 2))
a1

## Data Frame ####################################

n   <- c(1, 2, 3)
c <- c("a", "b", "c")
b   <- c(T, F, T)

# Vektoren gleicher Laenge zusammenfuegen; Datentyp ist immer der Schwächste
df1 <- cbind(n, c, b)
df1  
typeof(df1)

#Dataframes erlauben das Zusammenbinden verschiedener Datentypen (wichtig: alle 
# Vektoren muessen gleiche Laenge haben)

df2 <- data.frame(n, c, b)
df2  

## Liste ##############################################

l1 <- list(n, c, b)
l1

l2 <- list(n, c, b, l1)  # Liste in einer Liste
l2

l2[[2]]

l2[[2]][[2]]


###################################
# Environment leeren
rm(list = ls()) 

# Konsole leeren
cat("\014")  # ctrl+L

