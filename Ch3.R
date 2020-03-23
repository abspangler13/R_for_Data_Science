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

