## README

Esta carpeta contiene los archivos e información necesaria para analizar la estructura y diversidad genética de las poblaciones europeas del murciélago *Eptesicus serotinus*.


**Los datos fueron obtenidos de:**

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Heredity 115(1): 83-92. http://dx.doi.org/10.1038/hdy.2015.20

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Data from: Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Dryad Digital Repository. http://dx.doi.org/10.5061/dryad.665np


**Organización del proyecto**
La carpeta principal "ProyectoFinal_MartínCabrera", contiene las siguientes subcarpetas:

**data**
1. **Genotypes_Eptser.xls**. Base de datos original, descargada del repositorio de Dryad. 
	- Hoja 1. Contiene los genotipos de 10 microsatélites de 699 individuos de *Eptesicus serotinus*, pertenecientes a 36 poblaciones del Reino Unido y Europa continental.
	- Hoja 2. Contiene las coordenadas en grados decimales de los sitios de muestreo, así como el código de localidad, país y tamaño de muestra de cada uno de ellos.
2. **genotepts.csv**. Base de datos ordenada. Contiene los datos de la base original pero ordenados de tal manera que el paquete "poppr" los pueda leer en R.
3. **genotepts.str**. Base de datos ordenada. Contiene los datos de la base original pero ordenados y guardados en formato .str

**bin**
1. **DownloadBase**. Script para descargar la base de datos original del repositorio de Dryad.
2. **FirstAnalysis**. Script para tener un primer acercamiento con los datos. Evalúa la cantidad de datos obtenidos y faltantes. Calcula la diversidad genotípica y las frecuencias alélicas observadas en las poblaciones por loci.
3. **BasicStatistics**. Script que calcula estadísticos genéticos básicos, como heterocigosis, pruebas de equilibrio de Hardy-Weinberg, riqueza genotípica. 
4. *AdvancedAnalysis**. Script que permite hacer cálculos sobre la estructura genética de las poblaciones (Gst, distancias genéticas), desequilibrio de ligamiento y análisis discriminante de componentes principales (DAPC).

**out**
Contiene los resultados obtenidos de los análisis, organizados por etapas en forma de tablas y gráficos.
Por ejemplo, los obtenidos con el script "FirstAnalysis.R": [curva de acumulación de genotipos](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/gaccEptpop.png), [datos faltantes](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/missdEptpop.png), [genotipos multilocus observados](https://raw.githubusercontent.com/MartinCabreraG/ProyectoFinalBioinf2017-II/master/mlgEptpop.png)
