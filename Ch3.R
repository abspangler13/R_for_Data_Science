###Chapter 3

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

###3.2.4

#1
ggplot(data = mpg)
#I see a grey square

#2
dim(mpg)
#234 rows, 11 columns

#3
unique(mpg$drv)
# "f" "4" "r"
# something about the transmission?

#4
ggplot(data = mpg) + geom_point(mapping = aes(x = cyl, y = hwy))

#5
ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = class))
#cuz you're plotting a factor vs a factor? 

###3.2.4

#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

# color = "blue" needs to go outside aes()

#2
?mpg
str(mpg)

#categorical- manufacturuer, model, trans, drv, fl, class
#continuous- displ, year, cyl, cty, hwy

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = year))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, color = displ))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, shape = displ))
#cannot map continuous varable to shapre

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, size = displ))

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, size = displ, color = displ))
#it works

#5
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, color = displ), stroke = 1)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, color = displ), stroke = 1)

#stroke controls the size of the border of the point apparently. 
#https://ggplot2.tidyverse.org/reference/geom_point.html

#6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = hwy, color = displ< 5))

#it colors the points based on whether displ < 5 is true or false

###3.5.1

#1
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = displ)) + 
  facet_grid(.~ hwy)
#you get a separate facet for each number. 

#2
#The empty cells mean there's no datat for rear wheel drive for
# 4 and 5 cylinder cars and there's no 5 cylinder 4 wheel drive car
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
#it means that you don't make column facets, just rows 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
#it means that you don't make row facets, just columns

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#keeps you from having too many data points on a single plot 

#5
?facet_wrap
#nrow sets number of rows. ncol sets number of columns 

p <- ggplot(mpg, aes(displ, cty)) + geom_point()
p + facet_grid(rows = vars(drv))
p + facet_grid(cols = vars(cyl))
p + facet_grid(vars(drv), vars(cyl))


###3.6.1

#1
#geom_line, geom_histogram  geom_boxplot
#https://rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf

#3 
#removes the legend. the plot gets bigger. 

#4
?geom_smooth
#tells ggplot whether or not to display the confidence interval around smooth

#5
#no because all the aesthetic mappings are the same

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))


#6
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 5) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(size = 5) + 
  geom_smooth(mapping = aes(group = drv), se = FALSE)
#OR
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) + 
  geom_point(size = 5) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point(size = 5) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv),size = 5) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv),size = 5) + 
  geom_smooth(se = FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(x = displ, y = hwy, fill = drv),color = "white",size = 5,pch=21, stroke = 4)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(fill = drv),color = "white",size = 5,pch=21, stroke = 4)

###3.7.1

# You can usually use geoms and stats interchangeably because each geome has a default
# stat. 

#1


#geom_pointrange()

ggplot(data = diamonds) + 
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median)+
  ylim(40,80)

ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
# literally copied the answer from the solutions manual and it doesn't work either. 
# to get this to work I think you would have to calculate the SD by hand and plot it

#2
# geom_bar uses the number of cases in each group. geom_col uses the actual values. 
  
#4
?stat_smooth
#computes: y, ymin, ymax, se

#5
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
# the problem is that all the proportions are equal to 1 because they are calculated 
# within the groups instead of across all groups. 


###3.8
# position = jitter adds random noise to the data points they're not sitting on top
# each other

#3.8.1

#1
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point(position = "jitter")

#2
?geom_jitter
#width and height

#3
?geom_count
#geom_count sums the number of value with the same x,y position and makes the size
# of the point according to this count. this way you can see where there are multiple
# data points withough adding noise to the data. 

#4
?geom_boxplot
dodge2

ggplot(data = mpg, mapping = aes(x = drv, y = hwy, colour = class)) + 
  geom_boxplot()

#why doesn't group = class work here?

###3.9

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()

###3.10

# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(
#     mapping = aes(<MAPPINGS>),
#     stat = <STAT>, 
#     position = <POSITION>
#   ) +
#   <COORDINATE_FUNCTION> +
#   <FACET_FUNCTION>


