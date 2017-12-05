##ADD IMPORTS
import math
import cv2
import numpy as np
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
	def calcDist(self, x1, x2):#the length of the rectangle
		#the distance and size is inversely proportional
		#uses formula dist * rectSize = constant
		width = math.fabs(x1-x2)

		if(width > 0):
			return self.DIST_CONSTANT / width
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

	def onEdge(self, x1, x2):
		if(x1 == 0 or x1 == self.SCREEN_WIDTH):
			return True
		if(x2 == 0 or x2 == self.SCREEN_WIDTH):
			return True
		return False



	def runCV(self, camera):
		print "run in method"
		_, frame = camera.read()
		
		#convert to hsv
		hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

		# zero_red = np.array([0, 100, 100]);
		# low_red = np.array([10, 255, 255]);
		# high_red = np.array([160, 100, 100]);
		# pi_red = np.array([180, 255, 255]);
		
		#make mask
		# maskLow = cv2.inRange(hsv, zero_red, low_red)
		# maskHigh = cv2.inRange(hsv, high_red, pi_red)
		# mask = maskLow + maskHigh

		yellow = np.array([21.5, 201.25, 155.55])
		low_yellow = np.array([11, 100, 100])
		high_yellow = np.array([32, 255, 255])
		mask = cv2.inRange(hsv, low_yellow, high_yellow)

		cv2.imshow("mask", mask)
		
		#find controus based on mask
		_, contour,_ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)


		#initializes rectangle variables with a dummy value
		max_area = 0
		mx,my,mw,mh = 0, 0, 0, 0 #variables x,y,width,height associated with the biggest rectangle


		#finds the two biggest rectangles
		for cnt in contour:
			#gets the x, y of the top left corner and 
			#width and height of the rectangle
			x,y,w,h = cv2.boundingRect(cnt)
			#cv2.rectangle(frame,(x,y),(x+w,y+h),(0,150,255),thickness=3)

			#gets area of the rectangle
			area = cv2.contourArea(cnt)
			#print str(area)

			#checks if the rectangle is greater than the max_area so far and
			#sets the variables to accommodate the change
			if(area >= max_area):
				#thirdmax_area = secmax_area
				#secmax_area = max_area
				max_area = area

				mx = x
				my = y
				mw = w
				mh = h
			#checks if the rectangle is greater than the secmax_area so far and
			#sets the variables to accommodate the change
		
		if(max_area > 0):
			#draws a green rect on the biggest rectangle found
			cv2.rectangle(frame,(mx,my),(mx+mw,my+mh),(0,255,0),thickness=3)

			x1,x2 = mx,mx+mw
			
			print "Distance: " + str(self.calcDist(x1,x2))
			print "Angle: " + str(self.calcAngleDeg((x1+x2)/2.0))
			print "onEdge: " + str(self.onEdge(x1,x2))

		cv2.waitKey(30)
		cv2.imshow("Frame", frame)

foo = GearCalcDistAng()
camera = cv2.VideoCapture(0)
while True:
	foo.runCV(camera)
	print "run"

