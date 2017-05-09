## OptoStripesF.R ##

# This funcition creates several images that contain stripes. Images are then compiled into a .gif file and can be played as a moving image for optokinetic or optomoter responce assays. This designed to test the optokinetic and optomoter responces of larval fish in raceways.  

# This funcition creates several images that contain moving stripes for optokinetic or optomoter responce assays. This designed is for Zhenxin's project where the larval fish are in raceways.  

# Note you will want to dedicate a specific file for the output of this function.

##############################################
## Author Information ##

# * Author: E.Frolli
# * Orginization: Univeristy of Texas Marine Science Institute
# * Contact: frolli.erin@utexas.edu
# * Date: 08 May 2017

##############################################
## Imputs into the function ##

# * BarWidth *   : (Integer) This is the number of thiknes of the bars you would like to see on the plot that are <=50.
# * Speed *      : (Integer) This variable indicates the speed the smaller the number the faster the .gif will play. 
# * ColorSr *    : (String)  This is a small vector with at least 2 colors c("black","white") is defalt can change for defalts.
# * Reverse*     : (Boolean) This answers Default is TRUE - meaning the .gif will move in the right hand deirection FALSE - will have it run in the left hand direction

##############################################
## Outputs of the function ##

# *.png * : (barwidth*4)  *.png photos numbered in order in the ouput folder 


##############################################
## The Code ##

OptoStripesF <- function(BarWidth,ColorSr= c("black","white"), Reverse=FALSE)  {
    
    # This is the sequences to create the rectangle graphs So we need a front half and a back half
    j <- seq(0,100,by=BarWidth) 
    jr = -rev(j[-1])
    j = c(jr,j)
    frames = BarWidth*4
    j2 = j+BarWidth
    q=.5
    
    # Loop that creates plots and saves the .png files
    for(i in 1:frames){
      # creating a name for each plot file with leading zeros
      if (i < 10) {name = paste('000',i,'plot.png',sep='')}
      if (i < 100 && i >= 10) {name = paste('00',i,'plot.png', sep='')}
      if (i >= 100) {name = paste('0', i,'plot.png', sep='')}
      
      # Start the save of the images
      png(name)
      op <- par(bg = "black") # Set the background to black
      plot(c(0, 99), c(300, 450), type = "n", xlab="", ylab="",xaxs = "i", yaxs = "i") # Set the plot perameters
      axis(1, pos=0)
      
      #Draw the rectangels the same width and alternating black and white 
      rect(j, 200, j2, 500, col= ColorSr,border="transparent")
      dev.off() # print the image
      
      # Create the direction of the .gif
      if(Reverse == FALSE){
        j = j+q # change the next graph rectangles shifted by 5 or 1
        j2 = j2+q
      }else{
        j = j-q # change the next graph rectangles shifted by 5 or 1
        j2 = j2-q
      }
      
    }
}
