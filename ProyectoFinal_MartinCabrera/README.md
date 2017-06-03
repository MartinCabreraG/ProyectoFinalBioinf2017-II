# README

Este repositorio de datos contiene los archivos y la información necesaria para analizar la estructura y diversidad genética de las poblaciones europeas del murciélago *Eptesicus serotinus* a partir de datos microsatelitales.

### Los datos originales fueron obtenidos de:

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Heredity 115(1): 83-92. http://dx.doi.org/10.1038/hdy.2015.20

Moussy C, Atterby H, Griffiths AGF, Allnut TR, Mathews F, Smith GC, Aegerter JN, Bearhop S, Hosken DJ (2015) Data from: Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe and implications for the potential spread of bat rabies (European bat lyssavirus EBLV-1). Dryad Digital Repository. http://dx.doi.org/10.5061/dryad.665np

### Descripción y objetivo

En este proyecto, a partir de la base de datos original de Moussy et al. (2015), se replican algunos de los análisis producidos por los autores. De igual forma se implementan otros análisis no usados por ellos con el fin de abundar en el estudio de la genética de poblaciones de *Eptesicus serotinus*.
Al final, es posible comparar los resultados obtenidos con los publicados y sustentar las observaciones empleando las herramientas computacionales aprendidas en clase y el uso de software especializado.

### Organización del proyecto

Al interior de la carpeta principal "ProyectoFinal_MartínCabrera", se encuentran los archivos README.md y Resumen.md.
El archivo README.md es el que se lee ahora, y el archivo Resumen.md es el que contiene el texto que explica los análisis y resultados obtenidos en este proyecto.
El directorio principal también contiene las siguientes subcarpetas:

**data**
1. **Genotypes_Eptser.xls**. Base de datos original, descargada del repositorio de Dryad. 
	- Hoja 1. Contiene los genotipos de 10 microsatélites de 699 individuos de *Eptesicus serotinus*, pertenecientes a 36 poblaciones del Reino Unido y Europa continental.
	- Hoja 2. Contiene las coordenadas en grados decimales de los sitios de muestreo, así como el código de localidad, país y tamaño de muestra de cada uno de ellos.
2. **genotepts.csv**. Base de datos ordenada. Contiene los datos de la base original pero ordenados de tal manera que el paquete "poppr" los pueda leer en R.
3. **genotepts.str**. Base de datos ordenada. Contiene los datos de la base original pero ordenados y guardados en formato .str

**bin**
1. **FirstAnalysis.R**. Script para tener un primer acercamiento con los datos. Evalúa la cantidad de datos obtenidos y faltantes. Calcula la diversidad genotípica y las frecuencias alélicas observadas en las poblaciones por loci.
2. **BasicStatistics.R**. Script que calcula estadísticos genéticos básicos, como heterocigosis, pruebas de equilibrio de Hardy-Weinberg, riqueza genotípica. 
3. **LDTest.R**. Script que realiza una prueba de Desequilibrio de Ligamiento, tomando en cuenta el índice de asociación y las comparaciones pareadas de r¯d de todos los loci en cada población.
4. **AdvAnalysis.R**. Script que permite hacer análisis un poco más complejos, como DAPC (análisis discriminante de componentes principales), AMOVA, cálculos de Gst y distancia genética.
5. **StructAnalysis.R**. Script para evaluar la estructura genética de las poblaciones y generar gráficos que faciliten su interpretación.
	- Tres archivos y un directorio generados de manera autómatica al correr el último script también se encuentran en esta carpeta. Su formato es .coord, .geno y .snmf

**out**

Contiene los resultados obtenidos de los análisis en forma de tablas y gráficos organizados por directorios.
1. **results1**. Contiene los resultados producidos por el script FirstAnalysis.R
2. **results2**. Contiene los resultados producidos por el script BasicStatistics.R
3. **results3**. Contiene los resultados producidos por el script LDTest.R
4. **results4**. Contiene los resultados producidos por el script AdvAnalysis.R
5. **results6**. Contiene los resultados producidos por el script StructAnalysis.R

### Modo de exploración

- Comienza leyendo el README.
- Todos los scripts están hechos en R, por lo que necesitarás este programa para correrlos.
- Una vez iniciado R, se asume que el directorio de trabajo es **/ProyectoFinal_MartínCabrera/bin/**. Por lo que no hay que olvidar definirlo desde el principio para poder leer los scripts.
- El mejor orden para correr los scripts es el presentado arriba en la descripción del contenido de la carpeta 'bin'. Pueden ser corridos independientemente, pero es un orden recomendado.
- El archivo Resumen.md puede ser abierto y revisado al mismo tiempo que se decida correr los scripts.
- Cuando leas el Resumen, da clic en los enlaces que encuentres para ver algunos gráficos.

Ir al archivo de [Resumen](/Resumen.md)
