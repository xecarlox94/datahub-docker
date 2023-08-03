import image_dehazer
import cv2

HazeImg = cv2.imread('/home/coena98/olter/images/color_img1663755927289740234.jpg')# read input image -- (**must be a color image**)
HazeCorrectedImg = image_dehazer.remove_haze(HazeImg)# Remove Haze


cv2.imshow('input image', HazeImg);# display the original hazy image
cv2.imshow('enhanced_image', HazeCorrectedImg);# display the result
cv2.waitKey(0)
cv2.destroyAllWindows()
cv2.imwrite(f'/home/coena98/olter/images/color_img1663755888903749289.jpg', HazeCorrectedImg)