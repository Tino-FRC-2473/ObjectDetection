##ADD IMPORTS
import math
import cv2
#import numpy as np
#import os

class GearCalcDistAng:

	def __init__(self):
		#for distance
		self.distance = -1
		self.DIST_CONSTANT = 3234.375 * 11 / 5

		#for angle
		#calc the angle constant
		self.FIELD_OF_VIEW_RAD = 70.42 * math.pi / 180.0 #note: total not just half of the screen
		self.SCREEN_WIDTH = 1280
        self.SCREEN_HEIGHT = 720
        self.ANGLE_CONST = (self.SCREEN_WIDTH / 2.0) / math.tan(self.FIELD_OF_VIEW_RAD / 2.0)
        
        #calc angle
        self.angle = -1
        self.gearCenterX = 0;
        self.gearCenterY = 0;

        #returns the left top and right bottom coordinates

    
    #calculates the distance to the center of the gear
    #+/- about an inch depending on the case
    def calcDist(self, x1, x2): #the length of the rectangle
        #the distance and size is inversely proportional
        #uses formula dist * rectSize = constant
        width = math.fabs(x1-x2)

        if(width > 0):
            return self.DIST_CONSTANT / width;
        return -1;

    #calculates the angle in degrees
    #we need to turn to be centered with the back of the board
    def calcAngleDeg(self, gearCenterX):
        return self.calcAngleRad(gearCenterX) * 180.0 / math.pi

    #calculates the angle in radians
    #we need to turn to be centered with the back of the board
    def calcAngleRad(self, gearCenterX):
        #if the peg is on the right side of the screen, POSITIVE
        #peg on left side of screen, NEGATIVE
        gearDistToCenter = (gearCenterX - self.SCREEN_WIDTH / 2)
        #returns it in radians
        return math.atan(gearDistToCenter / self.ANGLE_CONST)

    #calculates the approximate position of the peg on the screen
    def gearCenterPosition(self, x1, x2):
        x = (x1 + x2) / 2.0
        return (int(x), int(y))

