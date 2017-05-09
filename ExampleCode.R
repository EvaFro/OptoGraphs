

## OptoExample.R ##

# This is an example script on how to run the OptoCircle.R and OptoStries.R scripts. 

##############################################
## Author Information ##

# * Author: E.Frolli
# * Orginization: Univeristy of Texas Marine Science Institute
# * Contact: frolli.erin@utexas.edu
# * Date: 05 May 2017


##############################################
## The Code ##

##############################################
# 1. Install installr pakage & load it
##############################################

# To instal ImgageMagick need the installr package
install.packages("installr")
require(installr)
# Then install ImageMagick
install.ImageMagick()

# Note if you are having trouble downloading ImageMagick this way, It could be that your computer thinks its a malware. You should turn it off temp to download ImageMagick then turn it back on to protect your computer. Also don't forget to check the box that has (ie convert) on it. We need that .exe file to run the code we have.


##############################################
# 2. OptoGraphs W/o .gif
##############################################

#Set your working directory to the folder you created
# Note set your directory to the folder that you want the images saved too
setwd('C:/Users/Frolli/Desktop/LabProjects/OptoGraphs/')
# Create a destination folder
dir.create("Circ") # Name this folder what ever you like
#Set your working directory to the folder you created
setwd("Circ")


# opens both functions
# Note: make sure your directories are set correctly
source('C:/Desktop/LabProjects/OptoGraphs/OptoCirclesF_Nogif.R') 
source('C:/Desktop/LabProjects/OptoGraphs/OptoStripesF_Nogif.R')


# For the circles
OptoCirclesF(20,Reverse=TRUE) # Counter Clockwise
OptoCirclesF(20) # Clockwise
OptoCirclesF(20,ColorSr= c("black","red")) # Clockwise
OptoCirclesF(20,ColorSr= c("black","red"), Reverse=TRUE) # Counter Clockwise

# For the stripes
OptoStripesF(12) # Forward moving stripes
OptoStripesF(12,ColorSr= c("black","red")) # Forward moving stripes
# For the stripes
OptoStripesF(12,ColorSr= c("black","red"),Reverse= TRUE) # backword moving stripes


##############################################
# 3. OptoGraphs w/ .gif
##############################################

#Set your working directory to the folder you created
# Note set your directory to the folder that you want the images saved too
setwd('C:/Users/Frolli/Desktop/LabProjects/OptoGraphs/')
# Create a destination folder
dir.create("Circ") # Name this folder what ever you like
#Set your working directory to the folder you created
setwd("Circ")


# opens both functions
# Note: make sure your directories are set correctly
source('C:/Desktop/LabProjects/OptoGraphs/OptoCirclesF.R')
source('C:/Desktop/LabProjects/OptoGraphs/OptoStripesF.R')


# For the circles
OptoCirclesF(20,10,Reverse=TRUE) # Counter Clockwise
OptoCirclesF(20,10) # Clockwise
OptoCirclesF(20,5,ColorSr= c("black","red")) # Clockwise
OptoCirclesF(20,5,ColorSr= c("black","red"), Reverse=TRUE) # Counter Clockwise

# For the stripes
OptoStripesF(12,5) # Forward moving stripes
OptoStripesF(12,5,ColorSr= c("black","red")) # Forward moving stripes
# For the stripes
OptoStripesF(12,5,ColorSr= c("black","red"),Reverse= TRUE) # backword moving stripes

