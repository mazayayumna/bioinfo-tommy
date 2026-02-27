# Data Viz
## intro
### first step
load DF, DF contains observations collected by the US Environmental Protection Agency on 38 models of car. What does the relationship between engine size and fuel efficiency look like? Is it positive? Negative? Linear? Nonlinear?
```
library(tidyverse)
mpg
?mpg
```
1. displ (X), a car’s engine size, in litres.
2. hwy (Y), a car’s fuel efficiency on the highway, in miles per gallon (mpg). A car with a low fuel efficiency consumes more fuel than a car with a high fuel efficiency.

create ggplot
```
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
nrow(mpg)
ncol(mpg)
```
geom_point() adds a layer of points to your plot, which creates a scatterplot.

a graphing template for ggplot
```
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```