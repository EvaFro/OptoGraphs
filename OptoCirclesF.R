## OptoCirclesF.R ##

# This funcition creates several images that contain six wedged circles. Images are then compiled into a .gif file and can be played as a moving image for optokinetic or optomoter responce assays. This designed to test the optokinetic and optomoter responces of larval fish.  

# Note*: Must first find where ImageMagick is on your computer and change the pathway below on line 79 in order to run this code properly.

##############################################
## Author Information ##

# * Author: E.Frolli
# * Orginization: Univeristy of Texas Marine Science Institute
# * Contact: frolli.erin@utexas.edu
# * Date: 05 May 2017

##############################################
## Imputs into the function ##

# * WedgesNum *   : (Integer) This is the number of wedges you would like to see on the plot.
# * Speed *       : (Integer) This variable indicates the speed the smaller the number the faster the .gif will play. 
# * ColorSr *     : (String)  This is a small vector with at least 2 colors c("black","white") is defalt can change for defalts.
# * Reverse*      : (Boolean) This answers Default is FALSE- meaning the .gif will move in the clockwise deirection TRUE - will have it run in the Counter Clockwise direction

##############################################
## Outputs of the function ##

# *.gif * : (1)  *.png photos numbered in order in the ouput folder 


##############################################
## The Code ##

OptoCirclesF <- function(WedgesNum,Speed,ColorSr= c("black","white"), Reverse=FALSE)  {
  
  # Make wedges into an even number
  if(WedgesNum %% 2 != 0){WedgesNum = WedgesNum+1}

  # this creates equal siezed wedges
  slices <- rep(25,WedgesNum) 

  frames = 36 # we need a full circle rotation so we need 36 photos because we are moving them 10 degrees at a time
  
  
  if(Reverse == FALSE){
    # Note this may be counter intuative but if I start with 0 it will go the wrong direction. Not quite sure why. If you can see what I am missing I would be greatly apprciative.
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
    
  }else{
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
  }
  
  # Create the .gif using ImageMagick
  if(Reverse ==FALSE){
    R = ""
  }else{
    R = "Rev_"
  }
  
  # Note may need to change the pathway to match where ImageMagick is located on your computer. 
  GifPath = paste('"C:/Program Files/ImageMagick-7.0.5-Q16/convert.exe" -delay ',Speed, ' *.png ',R,'Circ',WedgesNum,'_Speed',Speed,'.gif',sep = "")
  system(GifPath)
  # Delete all the .png files so all you are left with is the gif image
  invisible(file.remove(list.files(pattern = ".png")))
  
}
