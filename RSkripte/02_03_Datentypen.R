# Titel: Datentypen
# Datei: 02_03_Datentypen.R

##############################################
####DATENTYPEN################
##############################################


###Nummerische Datentypen######################
v1 <- 13     #Variable deklarieren
v1
typeof(v1)   #Datentypen ausgeben lassen


v2 <- 3.3
v2
typeof(v2)

###Character#######################

v3 <- "x"
v3
typeof(v3)

v4 <- "bla bla"
v4
typeof(v4)   


###Boolean########################

v5 <- FALSE   
v5
typeof(v5) 

v6 <- T    
v6
typeof(v6)

###################################
#Datentyp abfragen
is.numeric(v3)

#Datentypen aendern mit as.nummeric
as.numeric(v3) #NAs erzeugt

#besser:
is.numeric(v1)

v1<-as.character(v1)

is.character(v1)

##################################
# Environment leeren
rm(list = ls()) 

# Konsole leeren
cat("\014")  # ctrl+L

