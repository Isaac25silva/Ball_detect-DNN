#Created by Isaac Jesus da Silva - RoboFEI team - Humanoid Robot League
import os
import numpy as np

#write the name file and path.
name_file = './export_dataSet-Lab_331.yaml'


file = open("tag.csv","w")  #Make a CSV file
file.write("filename,width,height,class,xmin,ymin,xmax,ymax\n")
savename = False
findrobot = False
findball = False
with open (name_file, 'rt') as in_file:  # Open file YAML for reading of data.
    for line in in_file: # Store each line in a string variable "line"
        if savename:
            image_name = line[4:-3]
#            file.write(image_name+",") 
            savename = False

        if not line.find("dimensions: [", 0, 22)==-1:
            pos = line.find("dimensions: [") + 13
            dimensions = image_name+","+line[pos:-3]+","
#            file.write(image_name+","+line[pos:-3]+",")
#            file.write("\n")
#            file.write(image_name+","+"robot ,\n")

        if not line.find("robot")==-1:
            findrobot = True

        if findrobot==True:
            if not line.find("bbox: [")==-1:
                pos = line.find("bbox: [") + 7
                file.write(dimensions)
                file.write("robot,")
                file.write(line[pos:-3])
                file.write("\n")
                findrobot = False

        if not line.find("ball")==-1:
            findball = True

        if findball==True:
            if not line.find("bbox: [")==-1:
                pos = line.find("bbox: [") + 7
                file.write(dimensions)
                file.write("ball,")
                file.write(line[pos:-3])
                file.write("\n")
                findball = False

        print(line) # prints that line
        if not line.strip(): #line without text
            print "Encontrou\n"
            savename = True
