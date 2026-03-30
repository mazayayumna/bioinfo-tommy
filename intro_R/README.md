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

### a e s t h e t i c mapping
visual property of the objects in your plot. Aesthetics include things like the size, the shape, or the color of your points
```
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

### facets
split plot into subplots that each display one subset of the data. Use ~ as formula and followed by a var name.
```
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```
for two variables (grid)
```
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
```

### geometric obj
many type of geom available
point/scatterplot
```
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```
lineplot
```
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
```
map a variable to lineplot
```
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )
```
display multiple geoms; point and line
```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
```
add local mapping to specific geom, which it will overwrite global
```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
```
make line plot to only follow a class (filter)
```
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "minivan"), se = FALSE)
```