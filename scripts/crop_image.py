import cv2
import os
import pandas as pd

data = pd.read_csv('tag.csv', sep=",", header=0)
print data.head()

for index, read_row in data.iterrows():
    print read_row
    path_image = read_row["filename"]
    img = cv2.imread("./images/" + path_image)
    crop_img = img[read_row.ymin:read_row.ymax, read_row.xmin:read_row.xmax]
    cv2.imwrite( "./robot_images/"+read_row["class"]+str(index)+".png", crop_img )

