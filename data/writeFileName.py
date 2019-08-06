import os

with open("train.txt", "w") as a:
	for path, surdirs, files in os.walk(r'/home/rideon/Desktop/Chloe/Yolo_mark/x64/Release/data/img'):
		for filename in files:
			if filename.endswith("jpg"):
				a.write("data/img/" + filename)
				a.write("\n")
