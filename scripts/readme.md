# Scripts to convert and crop images

The python script "scrip_conv_format.py" is to change the format Nubots YAML to the format CSV to train the images in a tensorflow or to crop the images to could be use in a classify.

The images can crop using the python script crop_image


## Dependences

numpy
opencv
pandas


## Convert format Nubots YAML to CSV

The file YAML, should be in the same folder of the script.

Execute the program in terminal.

```
python scrip_conv_format.py
```

## Crop the images using CSV file

The file CSV should be in the same folder of script.
The images should be in a folder call "images" and should be make the folder ball and robot.

```
mkdir ball
mkdir robot
python crop_image.py
```
