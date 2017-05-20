## README

Esta carpeta contiene los archivos e información necesaria para analizar la estructura y diversidad genética de las poblaciones europeas del murciélago *Eptesicus serotinus*.


**Los datos fueron obtenidos de:**

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Heredity 115(1): 83-92. http://dx.doi.org/10.1038/hdy.2015.20

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Data from: Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Dryad Digital Repository. http://dx.doi.org/10.5061/dryad.665np


**Organización del proyecto**

La carpeta principal "ProyectoFinal-MartínCabrera", contiene las siguientes subcarpetas:

**DATA**
1. **Genotypes_Eptser.xlsx**. Base de datos original, descargada del repositorio de Dryad. Contiene los genotipos de 10 microsatélites de 699 individuos de *Eptesicus serotinus*, pertenecientes a 36 poblaciones del Reino Unido y Europa continental.
2. **Genotipos.csv**. Base de datos ordenada. Contiene los datos de la base original pero ordenados de tal manera que el paquete "poppr" los pueda leer en R.

**BIN**
1. **DownloadBase**. Script para descargar la base de datos original del repositorio de Dryad.
2. **FirstAnalysis**. Script para tener un primer acercamiento con los datos. Evalúa la cantidad de datos obtenidos y faltantes. Calcula la diversidad genotípica y las frecuencias alélicas observadas en las poblaciones por loci.
3. **BasicStatistics**. Script que calcula estadísticos genéticos básicos, como heterocigosis, pruebas de equilibrio de Hardy-Weinberg, polimorfimo, riqueza genotípica. 
4. *AdvancedAnalysis**. Script que permite hacer cálculos sobre la estructura genética de las poblaciones (Gst, distancias genéticas), desequilibrio de ligamiento y análisis discriminante de componentes principales (DAPC).

**OUT**

Contiene los resultados obtenidos de los análisis, organizados por etapas en forma de tablas y gráficos.
Por ejemplo, los obtenidos con el script "FirstAnalysis.R": [curva de acumulación de genotipos](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/gaccEptpop.png), [datos faltantes](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/missdEptpop.png), [genotipos multilocus observados](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/mlgEptpop.png)
