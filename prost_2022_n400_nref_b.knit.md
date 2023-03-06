---
title: "The N400 effect when singular gendered antecedents are co-indexed with (a)  *himself* or *herself*  (b) *themselves* "
author: "Joanna Morris"
date: "2023-02-13"
output: pdf_document
editor_options: 
  chunk_output_type: console
---


## Overview

This document contains the code to reproduce the statistical analyses described in [Prasad and Morris (2019)](https://psyarxiv.com/hwzke). You can download the data and the original .Rmd file [here](https://osf.io/2vjyp/).

This document has two sections:


2.  [Analysis 1: The N400 effect when antecedents are co-indexed with *himself* or *herself*](#gender)
3.  [Analysis 2: The N400 effect when antecedents are co-indexed with *themselves*](#number)






## Define functions, set parameters and load

Define standard error of mean function


```r
sem <- function(x) sd(x)/sqrt(length(x))
```

Before we begin, let's set some general parameters for `ggplot2`. We will set a general theme using the `theme_set()` function. We will use the 'classic' theme which gives us clean white background rather than the default grey with white grid lines. And we will position the legend at the top of the graph rather than at the right side which is the default.






Then we re-order factor levels for *Anteriority* & *Referentiality*


```
## [1] "Frontal"        "FrontoCentral"  "Central"        "CentroParietal"
## [5] "Parietal"
```

```
## [1] "Referential"    "NonReferential"
```

```
## [1] "Frontal"        "FrontoCentral"  "Central"        "CentroParietal"
## [5] "Parietal"
```

```
## [1] "Referential"    "NonReferential"
```
## Analysis 1: The N400 effect when antecedents are co-indexed with *himself* or *herself*


```r
ezANOVA(data = prost_2022_singular
              , dv = diff_score
              , wid = SubjID
              , within = .(Referentiality, Gender_Status, Anteriority)
              , between = Group
              , type = 3
              , return_aov = F
              )
```

```
## $ANOVA
##                                            Effect DFn DFd          F
## 2                                           Group   1  36  0.9374869
## 3                                  Referentiality   1  36 12.2247770
## 5                                   Gender_Status   1  36  1.2733561
## 7                                     Anteriority   4 144  2.0606903
## 4                            Group:Referentiality   1  36  0.6762734
## 6                             Group:Gender_Status   1  36  0.4610781
## 8                               Group:Anteriority   4 144  5.1495811
## 9                    Referentiality:Gender_Status   1  36  0.2476607
## 11                     Referentiality:Anteriority   4 144  1.3854470
## 13                      Gender_Status:Anteriority   4 144  2.3525738
## 10             Group:Referentiality:Gender_Status   1  36  5.7351452
## 12               Group:Referentiality:Anteriority   4 144  0.7584705
## 14                Group:Gender_Status:Anteriority   4 144  0.9712661
## 15       Referentiality:Gender_Status:Anteriority   4 144  0.2095779
## 16 Group:Referentiality:Gender_Status:Anteriority   4 144  1.4910541
##               p p<.05          ges
## 2  0.3393852751       0.0061153894
## 3  0.0012717043     * 0.0725639615
## 5  0.2666022045       0.0060391927
## 7  0.0890226513       0.0029742361
## 4  0.4162867596       0.0043096566
## 6  0.5014630657       0.0021952289
## 8  0.0006605669     * 0.0073995058
## 9  0.6217533918       0.0012878955
## 11 0.2419070474       0.0016448157
## 13 0.0567931874       0.0032557088
## 10 0.0219567998     * 0.0289966816
## 12 0.5539661827       0.0009011341
## 14 0.4252771122       0.0013467020
## 15 0.9327769406       0.0001698395
## 16 0.2079557263       0.0012070793
## 
## $`Mauchly's Test for Sphericity`
##                                            Effect           W            p
## 7                                     Anteriority 0.006548926 2.246469e-32
## 8                               Group:Anteriority 0.006548926 2.246469e-32
## 11                     Referentiality:Anteriority 0.003281484 2.660831e-37
## 12               Group:Referentiality:Anteriority 0.003281484 2.660831e-37
## 13                      Gender_Status:Anteriority 0.004635292 7.771205e-35
## 14                Group:Gender_Status:Anteriority 0.004635292 7.771205e-35
## 15       Referentiality:Gender_Status:Anteriority 0.021467327 5.607135e-24
## 16 Group:Referentiality:Gender_Status:Anteriority 0.021467327 5.607135e-24
##    p<.05
## 7      *
## 8      *
## 11     *
## 12     *
## 13     *
## 14     *
## 15     *
## 16     *
## 
## $`Sphericity Corrections`
##                                            Effect       GGe      p[GG]
## 7                                     Anteriority 0.3117498 0.15462251
## 8                               Group:Anteriority 0.3117498 0.02136772
## 11                     Referentiality:Anteriority 0.3014694 0.25188259
## 12               Group:Referentiality:Anteriority 0.3014694 0.41205819
## 13                      Gender_Status:Anteriority 0.3071411 0.12683261
## 14                Group:Gender_Status:Anteriority 0.3071411 0.34769438
## 15       Referentiality:Gender_Status:Anteriority 0.3635434 0.73986510
## 16 Group:Referentiality:Gender_Status:Anteriority 0.3635434 0.23423883
##    p[GG]<.05       HFe      p[HF] p[HF]<.05
## 7            0.3175191 0.15407353          
## 8          * 0.3175191 0.02074207         *
## 11           0.3062118 0.25222426          
## 12           0.3062118 0.41392595          
## 13           0.3124468 0.12615449          
## 14           0.3124468 0.34904640          
## 15           0.3748964 0.74703892          
## 16           0.3748964 0.23426338
```

### Condition Means for Analysis 1

The N400 effect when antecedents are co-indexed with *himself* or *herself*.  

Significant Effects: **Referentiality; Group X Anteriority; Group x Referentiality x Gender Status**


|Referentiality |  Mean|   SE|   SD|  Max|   Min|
|:--------------|-----:|----:|----:|----:|-----:|
|Referential    | -0.66| 0.10| 1.99| 6.30| -5.21|
|NonReferential |  0.36| 0.09| 1.74| 4.79| -5.06|



|Anteriority    |Group     |  Mean|   SE|   SD|  Max|   Min|
|:--------------|:---------|-----:|----:|----:|----:|-----:|
|Frontal        |Binary    | -0.12| 0.27| 2.43| 6.30| -5.05|
|Frontal        |NonBinary | -0.31| 0.25| 2.15| 3.88| -5.21|
|FrontoCentral  |Binary    | -0.25| 0.23| 2.04| 4.41| -4.97|
|FrontoCentral  |NonBinary | -0.21| 0.22| 1.87| 3.47| -5.13|
|Central        |Binary    | -0.39| 0.21| 1.87| 4.39| -5.12|
|Central        |NonBinary |  0.01| 0.21| 1.77| 4.27| -4.49|
|CentroParietal |Binary    | -0.38| 0.21| 1.84| 3.93| -4.73|
|CentroParietal |NonBinary |  0.15| 0.21| 1.74| 4.44| -4.67|
|Parietal       |Binary    | -0.28| 0.20| 1.79| 4.11| -5.06|
|Parietal       |NonBinary |  0.36| 0.20| 1.72| 3.76| -4.75|



|Referentiality |Gender_Status |Group     |  Mean|   SE|   SD|  Max|   Min|
|:--------------|:-------------|:---------|-----:|----:|----:|----:|-----:|
|Referential    |Gendered      |Binary    | -1.51| 0.19| 1.90| 4.41| -5.12|
|Referential    |Gendered      |NonBinary | -0.20| 0.21| 2.03| 4.44| -5.21|
|Referential    |NonGendered   |Binary    | -0.31| 0.21| 2.11| 6.30| -5.05|
|Referential    |NonGendered   |NonBinary | -0.58| 0.17| 1.63| 3.22| -4.75|
|NonReferential |Gendered      |Binary    |  0.49| 0.16| 1.64| 3.90| -4.58|
|NonReferential |Gendered      |NonBinary |  0.08| 0.18| 1.71| 3.76| -3.19|
|NonReferential |NonGendered   |Binary    |  0.19| 0.17| 1.73| 4.79| -5.06|
|NonReferential |NonGendered   |NonBinary |  0.69| 0.20| 1.85| 3.88| -4.12|

### Post-hoc tests for Analysis 1: Group x Gender Status x Referentiality

The following chunk runs post-hoc tests for the 3-way ***"Group x Gender Status x Referentiality"*** Interaction

#### Binary Group. 

These are the post-hoc tests for the *binary* group.




"*Some woman...himself*" vs. "*Mary...himself*"  Binary


```r
pander(t.test(diff_score ~ Referentiality
       , filter(binary, (Gender_Status == "Gendered"))
       , paired=TRUE))
```


----------------------------------------------------------------------------------
 Test statistic   df       P value       Alternative hypothesis   mean difference 
---------------- ---- ----------------- ------------------------ -----------------
     -7.66        99   1.275e-11 * * *         two.sided              -2.007      
----------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Referentiality`

 "*Someone...himself*" vs. "*The participant...himself*" Binary


```r
pander(t.test(diff_score ~ Referentiality
       , filter(binary, (Gender_Status == "NonGendered"))
       , paired=TRUE))
```


--------------------------------------------------------------------------
 Test statistic   df   P value   Alternative hypothesis   mean difference 
---------------- ---- --------- ------------------------ -----------------
     -1.722       99   0.08825         two.sided              -0.4954     
--------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Referentiality`

"*The participant...himself*" vs. "*Mary...himself*"  Binary


```r
pander(t.test(diff_score ~ Gender_Status
       , filter(binary, (Referentiality == "Referential"))
       , paired=TRUE))
```


----------------------------------------------------------------------------------
 Test statistic   df       P value       Alternative hypothesis   mean difference 
---------------- ---- ----------------- ------------------------ -----------------
     -4.909       99   3.612e-06 * * *         two.sided              -1.208      
----------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`

"*Someone...himself*" vs. "*Some woman...himself*"  Binary


```r
pander(t.test(diff_score ~ Gender_Status
       , filter(binary, (Referentiality == "NonReferential"))
       , paired=TRUE))
```


--------------------------------------------------------------------------
 Test statistic   df   P value   Alternative hypothesis   mean difference 
---------------- ---- --------- ------------------------ -----------------
     1.248        99   0.2148          two.sided              0.3037      
--------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`

"*Someone...himself*" vs. "*Mary...himself*"  Binary


```r
mary_someone <- filter(binary, (Referentiality == "Referential" & Gender_Status == "Gendered") | (Referentiality == "NonReferential" & Gender_Status == "NonGendered"))

pander(t.test(diff_score ~ Gender_Status, mary_someone, paired=TRUE))
```


---------------------------------------------------------------------------------
 Test statistic   df      P value       Alternative hypothesis   mean difference 
---------------- ---- ---------------- ------------------------ -----------------
     -6.88        99   5.47e-10 * * *         two.sided              -1.704      
---------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`

 "*Some woman...himself*" vs. "*the participant...himself*"  Binary

----------------------------------------------------------------------------
 Test statistic   df    P value    Alternative hypothesis   mean difference 
---------------- ---- ----------- ------------------------ -----------------
     2.594        99   0.01094 *         two.sided              0.7992      
----------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`


##### Interaction Plots: Group x Gender Status x Referentiality Binary
&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-13-1.pdf)<!-- --> 

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-14-1.pdf)<!-- --> 


#### NonBinary Group. 

These are the post-hoc tests for the *NonBinary* group.




 "*Some woman...himself*" vs. "*Mary...himself*" NonBinary


```r
pander(t.test(diff_score ~ Referentiality
       ,filter(prost_2022_singular, (Gender_Status == "Gendered" & Group == "NonBinary"))
       ,paired=TRUE))
```


--------------------------------------------------------------------------
 Test statistic   df   P value   Alternative hypothesis   mean difference 
---------------- ---- --------- ------------------------ -----------------
     -1.143       89   0.2562          two.sided              -0.279      
--------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Referentiality`

"*Someone...himself*" vs. "*The participant...himself*" NonBinary


```r
pander(t.test(diff_score ~ Referentiality
       , filter(prost_2022_singular, (Gender_Status == "NonGendered" & Group == "NonBinary"))
       , paired=TRUE))
```


----------------------------------------------------------------------------------
 Test statistic   df       P value       Alternative hypothesis   mean difference 
---------------- ---- ----------------- ------------------------ -----------------
     -5.202       89   1.251e-06 * * *         two.sided              -1.271      
----------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Referentiality`

 "*The participant...himself*" vs. "*Mary...himself*" NonBinary


```r
pander(t.test(diff_score ~ Gender_Status
       , filter(prost_2022_singular, (Referentiality == "Referential" & Group == "NonBinary"))
       , paired=TRUE))
```


--------------------------------------------------------------------------
 Test statistic   df   P value   Alternative hypothesis   mean difference 
---------------- ---- --------- ------------------------ -----------------
     1.354        89   0.1791          two.sided              0.3834      
--------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`

"*Someone...himself*" vs. "*Some woman...himself*"  NonBinary


```r
pander(t.test(diff_score ~ Gender_Status
       , filter(prost_2022_singular, (Referentiality == "NonReferential" & Group == "NonBinary"))
       , paired=TRUE))
```


-------------------------------------------------------------------------------
 Test statistic   df     P value      Alternative hypothesis   mean difference 
---------------- ---- -------------- ------------------------ -----------------
     -2.792       89   0.006407 * *         two.sided              -0.6082     
-------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`


"*Someone...himself*" vs. "*Mary...himself*"  NonBinary


```r
mary_someone <- filter(nonbinary, (Referentiality == "Referential" & Gender_Status == "Gendered") | (Referentiality == "NonReferential" & Gender_Status == "NonGendered"))

pander(t.test(diff_score ~ Gender_Status, mary_someone, paired=TRUE))
```


----------------------------------------------------------------------------------
 Test statistic   df       P value       Alternative hypothesis   mean difference 
---------------- ---- ----------------- ------------------------ -----------------
     -3.549       89   0.0006201 * * *         two.sided              -0.8872     
----------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`

 "*Some woman...himself*" vs. "*the participant...himself*"  NonBinary

-------------------------------------------------------------------------------
 Test statistic   df     P value      Alternative hypothesis   mean difference 
---------------- ---- -------------- ------------------------ -----------------
      2.8         89   0.006269 * *         two.sided              0.6624      
-------------------------------------------------------------------------------

Table: Paired t-test: `diff_score` by `Gender_Status`
##### Interaction Plots: Group x Gender Status x Referentiality NonBinary

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-22-1.pdf)<!-- --> 

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-23-1.pdf)<!-- --> 


### Post-hoc tests for Analysis 1: Group x Anteriority

The following chunk runs post-hoc tests for the 2-way ***"Group x Anteriority"*** Interaction


```r
# Binary vs Non-Binary Frontal

pander(t.test(diff_score ~ Group
       ,dplyr::filter(prost_2022_singular, (Anteriority == "Frontal"))
       ,paired=FALSE))
```


--------------------------------------------------------------------------------
 Test statistic   df    P value   Alternative hypothesis   mean in group Binary 
---------------- ----- --------- ------------------------ ----------------------
     0.5115       150   0.6097          two.sided                 -0.12         
--------------------------------------------------------------------------------

Table: Welch Two Sample t-test: `diff_score` by `Group` (continued below)

 
-------------------------
 mean in group NonBinary 
-------------------------
         -0.3102         
-------------------------

```r
# Binary vs Non-Binary FrontoCentral

pander(t.test(diff_score ~ Group
       ,dplyr::filter(prost_2022_singular, (Anteriority == "FrontoCentral"))
       ,paired=FALSE))
```


-----------------------------------------------------------
 Test statistic    df     P value   Alternative hypothesis 
---------------- ------- --------- ------------------------
    -0.1109       149.9   0.9119          two.sided        
-----------------------------------------------------------

Table: Welch Two Sample t-test: `diff_score` by `Group` (continued below)

 
------------------------------------------------
 mean in group Binary   mean in group NonBinary 
---------------------- -------------------------
       -0.2496                  -0.2145         
------------------------------------------------

```r
# Binary vs Non-Binary Central

pander(t.test(diff_score ~ Group
       ,dplyr::filter(prost_2022_singular, (Anteriority == "Central"))
       ,paired=FALSE))
```


-----------------------------------------------------------
 Test statistic    df     P value   Alternative hypothesis 
---------------- ------- --------- ------------------------
     -1.359       149.7   0.1761          two.sided        
-----------------------------------------------------------

Table: Welch Two Sample t-test: `diff_score` by `Group` (continued below)

 
------------------------------------------------
 mean in group Binary   mean in group NonBinary 
---------------------- -------------------------
       -0.3873                  0.01419         
------------------------------------------------

```r
# Binary vs Non-Binary CentroParietal

pander(t.test(diff_score ~ Group
       ,dplyr::filter(prost_2022_singular, (Anteriority == "CentroParietal"))
       ,paired=FALSE))
```


-----------------------------------------------------------
 Test statistic    df     P value   Alternative hypothesis 
---------------- ------- --------- ------------------------
     -1.853       149.6   0.06587         two.sided        
-----------------------------------------------------------

Table: Welch Two Sample t-test: `diff_score` by `Group` (continued below)

 
------------------------------------------------
 mean in group Binary   mean in group NonBinary 
---------------------- -------------------------
       -0.3836                  0.1546          
------------------------------------------------

```r
# Binary vs Non-Binary Parietal

pander(t.test(diff_score ~ Group
       ,dplyr::filter(prost_2022_singular, (Anteriority == "Parietal"))
       ,paired=FALSE))
```


-------------------------------------------------------------
 Test statistic    df      P value    Alternative hypothesis 
---------------- ------- ----------- ------------------------
     -2.229       149.3   0.02728 *         two.sided        
-------------------------------------------------------------

Table: Welch Two Sample t-test: `diff_score` by `Group` (continued below)

 
------------------------------------------------
 mean in group Binary   mean in group NonBinary 
---------------------- -------------------------
        -0.279                  0.3568          
------------------------------------------------


##### Interaction Plot: Group x Anteriority

&nbsp;

   
![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-25-1.pdf)<!-- --> 



&nbsp;

&nbsp;

&nbsp;



## Analysis 2: The N400 effect when antecedents are co-indexed with *themselves*



```r
ezANOVA(data = prost_2022_plural
              , dv = diff_score
              , wid = SubjID
              , within = .(Referentiality, Gender_Status, Anteriority)
              , between = Group
              , type = 3
              , return_aov = F
              )
```

```
## $ANOVA
##                                            Effect DFn DFd           F         p
## 2                                           Group   1  36 0.238003158 0.6286102
## 3                                  Referentiality   1  36 0.006154688 0.9379031
## 5                                   Gender_Status   1  36 0.097418428 0.7567506
## 7                                     Anteriority   4 144 1.400145919 0.2369032
## 4                            Group:Referentiality   1  36 0.007236331 0.9326798
## 6                             Group:Gender_Status   1  36 0.007002636 0.9337731
## 8                               Group:Anteriority   4 144 0.052760330 0.9947472
## 9                    Referentiality:Gender_Status   1  36 2.379600770 0.1316746
## 11                     Referentiality:Anteriority   4 144 1.192347966 0.3167516
## 13                      Gender_Status:Anteriority   4 144 0.867672469 0.4850282
## 10             Group:Referentiality:Gender_Status   1  36 0.046873525 0.8298179
## 12               Group:Referentiality:Anteriority   4 144 0.043204326 0.9964316
## 14                Group:Gender_Status:Anteriority   4 144 1.904147481 0.1128999
## 15       Referentiality:Gender_Status:Anteriority   4 144 0.632964163 0.6397719
## 16 Group:Referentiality:Gender_Status:Anteriority   4 144 0.102769696 0.9813708
##    p<.05          ges
## 2        1.997832e-03
## 3        3.485373e-05
## 5        4.305791e-04
## 7        9.550056e-04
## 4        4.097878e-05
## 6        3.096328e-05
## 8        3.601964e-05
## 9        1.303825e-02
## 11       1.299619e-03
## 13       8.881270e-04
## 10       2.601535e-04
## 12       4.715031e-05
## 14       1.946970e-03
## 15       5.894000e-04
## 16       9.574378e-05
## 
## $`Mauchly's Test for Sphericity`
##                                            Effect           W            p
## 7                                     Anteriority 0.016789812 1.045004e-25
## 8                               Group:Anteriority 0.016789812 1.045004e-25
## 11                     Referentiality:Anteriority 0.003911051 4.769720e-36
## 12               Group:Referentiality:Anteriority 0.003911051 4.769720e-36
## 13                      Gender_Status:Anteriority 0.003122257 1.173632e-37
## 14                Group:Gender_Status:Anteriority 0.003122257 1.173632e-37
## 15       Referentiality:Gender_Status:Anteriority 0.019213046 9.302422e-25
## 16 Group:Referentiality:Gender_Status:Anteriority 0.019213046 9.302422e-25
##    p<.05
## 7      *
## 8      *
## 11     *
## 12     *
## 13     *
## 14     *
## 15     *
## 16     *
## 
## $`Sphericity Corrections`
##                                            Effect       GGe     p[GG] p[GG]<.05
## 7                                     Anteriority 0.3526937 0.2517930          
## 8                               Group:Anteriority 0.3526937 0.8942407          
## 11                     Referentiality:Anteriority 0.3044471 0.2917829          
## 12               Group:Referentiality:Anteriority 0.3044471 0.8798835          
## 13                      Gender_Status:Anteriority 0.3064638 0.3780187          
## 14                Group:Gender_Status:Anteriority 0.3064638 0.1731027          
## 15       Referentiality:Gender_Status:Anteriority 0.3644889 0.4868838          
## 16 Group:Referentiality:Gender_Status:Anteriority 0.3644889 0.8404737          
##          HFe     p[HF] p[HF]<.05
## 7  0.3628201 0.2521395          
## 8  0.3628201 0.8995014          
## 11 0.3094842 0.2925234          
## 12 0.3094842 0.8832019          
## 13 0.3117017 0.3796759          
## 14 0.3117017 0.1727463          
## 15 0.3759502 0.4914678          
## 16 0.3759502 0.8471746
```

#### Interaction Plots for Analysis 2  Gender Status by Referentiality Interaction 

&nbsp;

##### Binary Group

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-27-1.pdf)<!-- --> 

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-28-1.pdf)<!-- --> 


##### NonBinary Group.  

&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-29-1.pdf)<!-- --> 
&nbsp;

![](prost_2022_n400_nref_b_files/figure-latex/unnamed-chunk-30-1.pdf)<!-- --> 


