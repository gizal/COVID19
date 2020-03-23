# Contents

**dataset folder contains:**

*covid19_de_tuebingen.csv* - data filtered for Tübingen on 22.03.2020

*RKI_COVID19_DE_Cities.csv* - data filtered with the codes shared in *code* folder for each city (i.e. LandKreis) reported (N = 384)

*RKI_COVID19_DE_Tuebingen.csv* - data filtered with the codes shared in *code* folder for Tübingen

*RKI_COVID19_DE.csv* - data filtered with the codes shared in *code* folder for Germany

**code folder contains:**

*import_COVID19DE.m* - MATLAB script to import csv data, called by the following script.

*arrange_COVID19DE.m* - MATLAB script to arrange the dataset and export as csv files (i.e. used to create the files in the dataset folder)

*COVID19_DE_Tuebingen.ipynb* - uses the dataset *covid19_de_tuebingen.csv* to create the figure that is in the output folder. 

**output folder contains:**

*COVID19_DE_Tuebingen.png* - output of the *COVID19_DE_Tuebingen.ipynb*
