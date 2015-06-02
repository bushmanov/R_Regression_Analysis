---
title: "kfigr"
author: "Sergey Bushmanov"
date: "08/22/2014"
output: pdf_document
---

```r
library(kfigr)
library(knitr)
```


<a name="first"></a>

```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
qplot(rnorm(100), geom="histogram")
```

```
## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.
```

![plot of chunk first](figure/first.png) 

Now, I will use the function <a href="#first">1</a>
