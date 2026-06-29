"""
Name: Jeremiah Richard
ID: 1001475742
Course: CSE4310 (Computer Vision)
Instructor: Alex Dillhoff
Program: stitch_images.py

"""

import matplotlib.pyplot as plt
from matplotlib.patches import ConnectionPatch
import scipy.ndimage as ndi
import numpy as np
import PIL.Image as Image
from skimage import io
from skimage.transform import AffineTransform
from skimage.transform import resize, ProjectiveTransform, SimilarityTransform, warp
from skimage.measure import ransac
from skimage.color import rgb2gray, rgba2rgb
from skimage.feature import match_descriptors, plot_matches, SIFT
from skimage import measure
from copy import copy
from numpy.random import default_rng
rng = default_rng()


def keypointMatching(descriptors1, descriptors2):

	# Match descriptors between img1 and img2
	matches12 = match_descriptors(descriptors1, descriptors2, cross_check=True, max_ratio=0.8)

	return matches12

def plot_match(matches12, img1, img2, keypoints1, keypoints2):
	# img1_gray = rgb2gray(img1)
	# sift = SIFT()
	# sift.detect_and_extract(img1_gray)
	# keypoints1 = sift.keypoints

	# img2_gray = rgb2gray(img2)
	# sift.detect_and_extract(img2_gray)
	# keypoints2 = sift.keypoints

	# Display matches
	fig, ax = plt.subplots()
	plot_matches(ax, img1, img2, keypoints1, keypoints2, matches12, matches_color='g')
	ax.axis('off')
	plt.show()

def compute_affine_transform(dst, src):
	"""
	The purpose of this code is to take a set of
	points from the source image and match their points
	to a destination image. Then compute an affine transformation
	matrix using normal equations.

	Ultimately we want keypoints1 & keypoints2 to align
	"""

	num_samples = src.shape[0]

	src_affine = np.concatenate((src, np.ones((num_samples,1))), axis=1)
	zero_buffer = np.zeros_like(src_affine)
	r1 = np.concatenate((src_affine, zero_buffer),axis=1)
	r2 = np.concatenate((zero_buffer, src_affine),axis=1)

	A = np.empty((r1.shape[0] + r2.shape[0], r1.shape[1]),dtype=r1.dtype)
	A[0::2] = r1
	A[1::2] = r2  

	b = dst.ravel()


	x = (np.linalg.inv(A.T @ A)) @ A.T @ b

	last_row = (0,0,1)
	x = np.concatenate((x, last_row))
	x = np.reshape(x, (3,3))

	return x

def predict(X, transform_matrix):
	r,_ = X.shape
	X = np.hstack([np.ones((r,2)), X])
	# print("--------")
	# print(transforma_matrix)
	return X @ transform_matrix

def square_error_lost(y_true, y_pred):
	return (y_true - y_pred) ** 2

def mean_square_error(y_true, y_pred):
    return np.sum(square_error_loss(y_true, y_pred)) / y_true.shape[0]

best_error = np.inf
def my_ransac(dst, src, transformation, min_samples, iter, threshold):
	d = 10 # `d`: Number of close data points required to assert model fits well

	best_fit = None
	best_inliers = None
	# x = np.concatenate((src[:,0],dst[:,0]),axis=None).reshape(-1,1)
	# y = np.concatenate((src[:,1],dst[:,1]),axis=None).reshape(-1,1)
	x = src[:,0].reshape(-1,1)
	y = src[:,1].reshape(-1,1)

	for _ in range(iter):
		ids = rng.permutation(x.shape[0])

		maybe_inliers = ids[:min_samples]

		# print("----------src (inlier)---------")
		# print(src[maybe_inliers])
		# print(src[maybe_inliers].shape)
		# print("----------dst (inlier)---------")
		# print(dst[maybe_inliers])
		# print(dst[maybe_inliers].shape)
		
		maybe_model = copy(transformation(dst[maybe_inliers], src[maybe_inliers]))

		# print(maybe_model)
		thresholded = (square_error_lost(y[ids][min_samples:], predict(x[ids][min_samples:],maybe_model)) < threshold)
		new_thresholded = thresholded[:,2]

		inliers_ids = ids[min_samples:][np.flatnonzero(new_thresholded).flatten()]

		if inliers_ids.size > d:
			inliers_points = np.hstack(maybe_inliers, inliers_ids)
			better_model = copy(transformation(dst[inlier_points], src[inlier_points]))

			this_error = mean_square_error( y[inliers_points], predict(x[inlier_points],better_model))

			if this_error < best_error:
				best_error = this_error
				best_fit = maybe_model
				best_inliers = inliers_points

	return best_fit, best_inliers	

def main():
	img1 = "campus_000.jpg"
	img2 = "campus_001.jpg"
	img1 = io.imread(img1)
	img2 = io.imread(img2)

	# Extract keypoints from image using SIFT - DESTINATION IMAGE
	img1_gray = rgb2gray(img1)
	sift = SIFT()
	sift.detect_and_extract(img1_gray)
	keypoints1 = sift.keypoints
	descriptors1 = sift.descriptors

	# Extract keypoints from image using SIFT - SOURCE IMAGE
	img2_gray = rgb2gray(img2)
	sift.detect_and_extract(img2_gray)
	keypoints2 = sift.keypoints # SOURCE IMAGE
	descriptors2 = sift.descriptors 

	# print("Keypoints1")
	# print(keypoints1.shape)
	# print("Keypoints2")
	# print(keypoints2.shape)

	matches12 = keypointMatching(descriptors1, descriptors2)
	plot_match(matches12, img1, img2, keypoints1, keypoints2)
	# print("Matches")
	# print(matches12)
	# print("Match shape")
	# print(matches12.shape)

	dst = keypoints1[matches12[:, 0]]
	src = keypoints2[matches12[:, 1]]

	# print("src")
	# print(src)
	# print("src shape")
	# print(src.shape)

	# print("dst")
	# print(dst)
	# print("dst shape")
	# print(dst.shape)


	# Ransac should take:
	# Keypoints 2 (source)
	# matches of dest (matches12[])
	modle12, inliers12 = my_ransac(dst[:,::-1],src[:,::-1],compute_affine_transform,3,100,2)

	outliers12 = inliers12 == False

	src_best = keypoints2[matches12[inliers12, 1]][:, ::-1]
	dst_best = keypoints1[matches12[inliers12, 0]][:, ::-1]

	plot_match(matches12[inliers12], img1, img2, keypoints1, keypoints2)

if __name__ == "__main__":
	main()
