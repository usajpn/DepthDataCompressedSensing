#!/usr/bin/python
#-*- coding:utf-8 -*-

import csv, sys, codecs, os

def parse_csv_file(input_file, output_dir, start_frame_num):
	infile = open(input_file, "rb")
	reader = csv.reader(infile)
	os.mkdir(output_dir)

	counter = 0
	row_num = 0
	non_zero_num = 0

	for row in reader:
		outfile = open(output_dir + "/" + str(row_num) + ".csv", "wb")
		writer = csv.writer(outfile, delimiter=";")

		for pixel in row:
			writer.writerow([str(counter), pixel])
			if pixel != "0":
				non_zero_num = non_zero_num + 1
				
			counter = counter + 1

		row_num = row_num + 1
			
	sparsity = float(non_zero_num) / float(480 * 640)
	print "sparsity: " + str(sparsity)


if __name__  == "__main__":
	input_file = "no_movement"
	start_frame_num = 10
	
	output_dir = input_file
	input_file = "/Users/usa/kinect/OpenNI-Bin-Dev-MacOSX-v1.5.4.0/Samples/bin/x64-Release/%s" % input_file
	input_file = input_file + ".csv"
	parse_csv_file(input_file, output_dir, start_frame_num)
