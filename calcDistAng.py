##ADD IMPORTS
import math
import cv2
#import numpy as np
#import os

class GearDetector:

	def __init__(self):
		#for distance
		self.distance = -1
		self.DIST_CONSTANT = 1

		#for angle
		#calc the angle constant
		self.FIELD_OF_VIEW_RAD = 70.42 * math.pi / 180.0 #note: total not just half of the screen
		self.SCREEN_WIDTH = 0
        self.SCREEN_HEIGHT = 0;
        self.ANGLE_CONST = 0
        
        #calc angle
        self.angle = -1
        self.gearCenterX = 0;
        self.gearCenterY = 0;
        self.pinDistToCenter = 0;

    ###########################################WE HAVE TO EDIT EVERYTHING BELOW THIS!!!!!!!!
     #calculates the distance to the back of the board with the peg on it
    #+/- about an inch depending on the case
    def calcDist(self, length): #the length of the rectangle
        #the distance and size is inversely proportional
        #uses formula dist * rectSize = constant
        if(length > 0):
            return self.DIST_CONSTANT / length;
        return -1;

    #calculates the angle in degrees
    #we need to turn to be centered with the back of the board
    def calcAngleDeg(self, pinX):
        return self.calcAngleRad(pinX) * 180.0 / math.pi

    #calculates the angle in radians
    #we need to turn to be centered with the back of the board
    def calcAngleRad(self, pinX):
        pinDistToCenter = self.calcPinDist(pinX)
        #returns it in radians
        return math.atan(pinDistToCenter / self.ANGLE_CONST)

    #helper method to calculate the horizontal distance
    #between the center of the screen and the peg in pixels
    def calcPinDist(self, pinX):
        #if the peg is on the right side of the screen, POSITIVE
        #peg on left side of screen, NEGATIVE
        return (pinX - self.SCREEN_WIDTH / 2);
        #return math.fabs(pinX - SCREEN_WIDTH / 2);

    #calculates the approximate position of the peg on the screen
    def pinPosition(self, x1, y1, x2, y2, x3, y3, x4, y4):
        x = (x1 + x2 + x3 + x4) / 4.0;
        y = (y1 + y2 + y3 + y4) / 4.0;
        return (int(x), int(y))

    def calcDistAng()