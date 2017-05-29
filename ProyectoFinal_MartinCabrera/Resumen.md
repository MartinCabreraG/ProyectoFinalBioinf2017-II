**Resumen de análisis y resultados**

# Population genetic structure of serotine bats (*Eptesicus serotinus*) across Europe

![data/eptesicus-serotinus.jpg](data/eptesicus-serotinus.jpg)


El conjunto de datos que se usó en este trabajo consiste en los genotipos de 10 microsatélites de 699 individuos de *Eptesicus serotinus*, pertenecientes a 36 poblaciones de Europa: 28 del Reino Unido y ocho de Europa continental.

Lo primero que se realizó fue un análisis sencillo de los datos para observar que no hubiera errores de entrada, grandes cantidades de datos faltantes y asegurarse de que los loci cumplieran con las expectativas de los análisis posteriores.

En este sentido, la [curva de acumulación de genotipos](out/results1/gcca.png) muestra que la asíntota es alcanzada a los 10 loci, lo que indica que el número de genotipos con el que se cuenta es bastante adecuado. Con respecto al número de alelos por locus, existe una amplia variedad, desde sólo dos (B22) hasta 18 (EF15). El locus bialélico B22, aunque tiene bajos parámetros de diversidad, heterocigosidad esperada y uniformidad en la distribución alélica, no es el locus con valores más bajos. El locus EF1, a pesar de tener tres alelos, es el que posee los menores valores. El porcentaje de [datos faltantes](out/results1/missingdata.png) de manera general no es alto, pero hay loci como TT20 y D15 que poseen un porcentaje mayor al 5% de datos faltantes. Finalmente un gráfico sobre el [número de genotipos multilocus](out/results1/mlg.png) indica que no hay ningún individuo en todo el conjunto de datos que posea los mismos genotipos para los loci estudiados, todos los individuos son distintos.

## Estadísticos básicos

Los valores calculados de diversidad, heterocigosidad esperada y observada son relativamente similares a los reportados por Moussy et al. (2015). Por otro lado, fue posible percatarse de que en 10 poblaciones un alelo se encontraba fijo para un locus, el cual podía variar entre B22, Mu4389 y EF1 (justo los tres loci con un menor número de alelos). Algunos autores consideran como no informativos a estos loci y recomiendan quitarlos de los análisis, sin embargo decidí no hacerlo y continuar debido a que comparando su proporción con respecto al total de muestras, aportaban mucho más información con su presencia que con su ausencia.

Las pruebas de Hardy-Weinberg para cada loci de cada población fueron ploteados para su mejor apreciación.

![out/results2/heatmapHWE.jpg](out/results2/heatmapHWE.png)

Los loci mostrados en rosa son aquellos que suponen no estar en equilibrio de H-W (p=< 0.05)

## Desequilibrio de Ligamiento





