import cv2
"""Write code to save video into image frames"""
video=cv2.VideoCapture("testVideoforconversion.MOV")

startimageNumber=0
imageNumber = 0
frameOffset = 5;

while(video.isOpened()):
	_,frame = video.read()

	if(frame is None):
		break
	#print frame is None
	#print type(frame)
	if(imageNumber % frameOffset == 0):
		cv2.imwrite("Gear" + str(startimageNumber + imageNumber / frameOffset) + ".jpg", frame)
	imageNumber=imageNumber+1;
	print imageNumber
	
	cv2.waitKey(1)


video.release()
#video.destroyAllWindows()
