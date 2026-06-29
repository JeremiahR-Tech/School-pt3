Name: Jeremiah Richard
ID: 1001475742
Course: CSE4310 (Computer Vision)
Instructor: Alex Dillhoff
Program: stitch_images.py
Language: Python 3.10.5

Compiles with python "stitch_images.py"
and take advantage of the "campus_000.jpg"
and "campus_001.jpg".

Currently, the program have the correct installation of:
- Keypoint Detection
- Keypoint Matching
- Plotting Keypoints
- Estimate Affine Matrix
- Ransac

What's currently not working or missing:
- square loss & square mean algorithms inside of RANSAC
- Use of the projection matrix

Report:
- Under the use of campus jpeg images the current model of the Ransac
algorithm does not seem to work as intended finding no error better
than the intial best error and thus having a small subset of inliers
if any. After multiple test this result seems to repeat.
