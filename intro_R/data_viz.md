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

### statistical transformation
default for Diamond Dataset: x from dataset, y from counting rows (default)
```
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

# DEFAULT but not 'count', another column is 'prop'
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
```
identity for Diamond Dataset: x from dataset, y from dataset too
```
demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)
ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
```
summ stat, summarises the y values for each unique x value. To draw attention
```
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
```
There are two types of bar charts: geom_bar() and geom_col(). geom_bar() makes the height of the bar proportional to the number of cases in each group. If you want the heights of the bars to represent values in the data, use geom_col() instead.

### position adjustment
colour a barchart, one outerline, one filled
```
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
```
stack the barchart (clarity), alpha for small transparent, and no fill full transparent
```
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity")
```
make the stacked bar chart the same height
```
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
```
make overlapping obj beside one another, so easier to compare indv values
```
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
```
adding randomness to scatterplot, since plot only display 126/234 points in dataset (jitter)
```
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
```

### coordinate system
coord_flip() switches the x and y axes
```
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
```
coord_quickmap() sets the aspect ratio correctly for maps (important)
``` 
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()
```
coord_polar() Polar coordinates reveal an interesting connection between a bar chart and a Coxcomb chart.
```
bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()
```
FINAL: THE TEMPLATE
```
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
     mapping = aes(<MAPPINGS>),
     stat = <STAT>, 
     position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
```