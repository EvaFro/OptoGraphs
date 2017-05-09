## OptoCirclesF.R ##

# This funcition creates 36 images that contain six wedged circles. Images are then compiled into a .gif file and can be played as a moving image for optokinetic or optomoter responce assays. This designed to test the optokinetic and optomoter responces of larval fish in 6 well plates.  


# Note you will want to dedicate a specific file for the output of this function.

##############################################
## Author Information ##

# * Author: E.Frolli
# * Orginization: Univeristy of Texas Marine Science Institute
# * Contact: frolli.erin@utexas.edu
# * Date: 08 May 2017

##############################################
## Imputs into the function ##

# * WedgesNum *   : (Integer) This is the number of wedges you would like to see on the plot.
# * ColorSr *     : (String)  This is a small vector with at least 2 colors ColorSr is defalt can change for defalts.
# * Reverse*      : (Boolean) This answers Default is FALSE- meaning the .gif will move in the clockwise deirection TRUE - will have it run in the Counter Clockwise direction

##############################################
## Outputs of the function ##

# *.png * : (36)  *.png photos numbered in order in the ouput folder 


##############################################
## The Code ##

OptoCirclesF <- function(WedgesNum,ColorSr= c("black","White"), Reverse=FALSE)  {
  
  # Make wedges into an even number
  if(WedgesNum %% 2 != 0){WedgesNum = WedgesNum+1}

  # this creates equal siezed wedges
  slices <- rep(25,WedgesNum) 
  frames = 36 # we need a full circle rotation so we need 36 photos
  
  
  if(Reverse == T){
    j = 0 # Start the circle starting at 0 degrees
  
    #Loop to create and print the images
    for(i in 1:frames){ 
      # creating a name for each plot file with leading zeros
      if (i < 10) {name = paste('000',i,'plot.png',sep='')} 
      if (i < 100 && i >= 10) {name = paste('00',i,'plot.png', sep='')}
      if (i >= 100) {name = paste('0', i,'plot.png', sep='')}
      
      # Name and print the image
      png(name,width=3.24, height=4.5,units = "in",res=72)
      # Give it a black background
      op <- par(bg = "black")
      # create a frame that has a 3X2 graph set up
      par(mfrow=c(3,2),
          oma = c(0, 0, 0, 0), # 0 rows of text at the outer left and bottom margin
          mar = c(0, 0, 0, 0), # 0 space for row of text at ticks and to separate plots
          mgp = c(0, 0, 0),    # axis label at 0 rows distance, tick labels at 0 row
          xpd = NA)            # allow content to protrude into outer margin (and beyond))
      pie(slices,labels = NA, col=ColorSr,init.angle = j) # Plot the pie graph - There are 6 of these being the same
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      dev.off()
      
      j = j+10 # changes the angle of the next graph by 10 degrees
    }
    
  }else{
    j = 360 # Start the circle starting at 360 degrees
    #Loop to create and print the images
    for(i in 1:frames){ 
      # creating a name for each plot file with leading zeros
      if (i < 10) {name = paste('000',i,'plot.png',sep='')} 
      if (i < 100 && i >= 10) {name = paste('00',i,'plot.png', sep='')}
      if (i >= 100) {name = paste('0', i,'plot.png', sep='')}
      
      # Name and print the image
      png(name,width=3.24, height=4.5,units = "in",res=72)
      # Give it a black background
      op <- par(bg = "black")
      # create a frame that has a 3X2 graph set up
      par(mfrow=c(3,2),
          oma = c(0, 0, 0, 0), # 0 rows of text at the outer left and bottom margin
          mar = c(0, 0, 0, 0), # 0 space for row of text at ticks and to separate plots
          mgp = c(0, 0, 0),    # axis label at 0 rows distance, tick labels at 0 row
          xpd = NA)            # allow content to protrude into outer margin (and beyond))
      pie(slices,labels = NA, col=ColorSr,init.angle = j) # Plot the pie graph - There are 6 of these being the same
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      par(mar=c(0,0,0,0))
      pie(slices,labels = NA, col=ColorSr,init.angle = j)
      dev.off()
      
      j = j-10 # changes the angle of the next graph by 10 degrees
    }
  }
}
