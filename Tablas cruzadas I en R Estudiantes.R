#Decisiones bajo incertidumbre en las organizaciones

#Análisis de datos para la toma de una decisión. Uso de tablas cruzadas

#Este ejercicio consiste en analizar los salarios de los empleados del estado de
#Connecticut del año fiscal 2014.

#Paso 1: Importar y cargar las librerías requeridas
library(readr)

#Paso 2: Lectura de datos

#Lea los datos del archivo "Salarios Connecticut" y asígnelos a un objeto
#cuyo nombre sea "payroll"

#Sugerencia: Aunque el archivo esté en formato .txt, es posible usar la función read.csv. Asegurese de remover el signo $ de la columna Revenue y de
#Escriba el argumento header=TRUE para que R reconozca los encabezados del archivo.

payroll <- read_csv("~/github/Tablas-Cruzadas-en-R---I/Salarios Connecticut.txt")
View(payroll)

#Cuente la cantidad de empleados que tiene el archivo de salarios y asígnelos a una
#variable n. Use el comando nrow.

n <- nrow(payroll)

#Encuentre la cantidad de empleados que hay en cada agencia del estado.
#Para ello use el comando table(nombre de la tabla$Columna por la que se filtrar?)
#Asigne el resultado a una variable n_agencia

n_agencia <- table(payroll$AGENCY)

#Organice n_agencia de manera descendente. Use el comando tabla[order(-tabla)]

n_agencia <- n_agencia[order(-n_agencia)]

#Extraiga las 10 agencias con mayor número de empleados. Use el comando head

top_10 <- head(n_agencia,10)

#Calcule el promedio de salario total por departamento. Siga estos pasos:
#1. Extraiga la columna TOTAL_AMT en un objeto que se llame salarios
#2. Extraiga la columna AGENCY_DESCRIPTION en un objeto que se llame agencias
#3. Use la función tapply (variable que se desea calcular, criterio de filtro, mean).
#Asigne los resultados de esta función a un objeto que se llame prom_agn

#### Desarrollo de los pasos indicados ####
#1. Extraiga la columna TOTAL_AMT en un objeto que se llame salarios
salarios <- data.frame(payroll$TOTAL_AMT)
#2. Extraiga la columna AGENCY_DESCRIPTION en un objeto que se llame agencias
agencias <- data.frame(payroll$AGENCY_DESCRIPTION)
#3. Use la función tapply (variable que se desea calcular, criterio de filtro, mean).
prom_agn <- tapply(payroll$TOTAL_AMT, payroll$AGENCY, mean)

#Repita el ejercicio anterior pero calcule la mediana y el máximo salario total por agencia
#Asigne las medianas obtenidas en un objeto med_dept y el máximo salario total a un objeto max_agn
med_agn <- tapply(payroll$TOTAL_AMT, payroll$AGENCY, median)
max_agn <- tapply(payroll$TOTAL_AMT, payroll$AGENCY, max)


#Compare la media y la mediana en 4 agencias. ?
# ¿Qué significan las diferencias?

head(prom_agn,2)
head(med_agn,2)

tail(prom_agn,2)
tail(med_agn,2)

#### Respuesta a la pregunta ¿Qué significan las diferencias? ####
#Para la agencia "AES" 
# Promedio    Mediana
# 53750.25    24080.70
# se puede observar que el promedio ~55% más alto que su mediana, 
# además indica que la mayoría de los salarios estan por debajo de la promedio indicando una asimetría positva
# esto también indica que la mayoria de la personas ganan un salario por debajo de la promedio 

#Para la agencia "APA"
# Promedio    Mediana
# 100557.14   95016.68
#se puede observar que el promedio ~5% más alto que su mediana, 
# esto indica que los datos estan más normalizados, 
# queriendo decir que la mayoria de los salarios de las personas estan en el centro de la distribución

#Para la agencia "UOC"
# Promedio    Mediana
# 33145.69    6325.02
# se puede observar que el promedio ~80% más alto que su mediana, 
# esto indica que casi la totalidad de los salarios estan por debajo de la promedio indicando una asimetría positva

#Para la agencia "UOC"
# Promedio    Mediana
# 96054.38    79981.81
# se puede observar que el promedio ~17% más alto que su mediana,
# además indica que la mayoría de los salarios estan por debajo de la promedio indicando una asimetría positva
# esto también indica que la mayoria de la personas ganan un salario por debajo de la promedio 