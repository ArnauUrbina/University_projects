# Image Classification for Letter Detection - University Project

## Overview
This project demonstrates the development and evaluation of a deep learning model for classifying images containing single letters. Built as part of a university assignment, this project explores convolutional neural networks (CNNs) to detect letters in images, including lowercase and uppercase variants across various fonts and orientations.

## Dataset
The dataset used consists of:

  - **Training set:** 10,000 color images (128x128 pixels) each containing a single letter in one of 52 classes (26 uppercase and 26 lowercase).
  - **Test set:** 4,000 images generated with the same properties as the training set for performance evaluation.

Each image in the training set has a unique ID (00000 to 09999) and a corresponding label stored in a CSV file with two columns: `id` and `letter`.

## Model Architecture
The primary architecture is based on Convolutional Neural Networks (CNNs), designed to capture spatial hierarchies in images. The model pipeline includes:

  1. **Data Augmentation:** To improve robustness, images undergo random rotations and zoom transformations.
  2. **Convolutional Layers:** Multiple convolutional layers with filters ranging from 32 to 128, depending on the configuration determined via hyperparameter tuning.
  3. **Pooling and Dropout Layers:** MaxPooling layers to reduce dimensionality, followed by dropout layers for regularization.
  4. **Dense Layers:** Fully connected layers of varying sizes, leading to a final output layer with 52 units (for each letter class) and a softmax activation function for multiclass classification.

## Preprocessing
  - **Image Preprocessing:** All images are converted to grayscale by extracting one color channel. The images are normalized (rescaled between 0 and 1).
  - **Label Encoding:** Letters are converted to numeric labels for compatibility with the model.

## Training and Hyperparameter Tuning
  - **Tuner:** `RandomSearch` from `keras_tuner` was used to identify optimal parameters.
  - **Cross-Validation:** K-fold cross-validation (K=4) was applied to evaluate the model's stability.
  - **Final Model:** A Sequential CNN model using Adam optimizer with `sparse_categorical_crossentropy` loss function. The model was trained over 200 epochs with validation split for monitoring performance.

## Evaluation
The model's performance was measured using accuracy on both the training and test sets, with additional metrics including:

  - **Confusion Matrix:** Generated to analyze individual letter performance.
  - **Per-Class Accuracy:** Observed which letters had higher and lower classification accuracy.

## Results
  - **Overall Accuracy:** The model achieved an average accuracy of XX% on the training set and an estimated accuracy of XX% on the test set (estimated based on cross-validation).
  - **Best and Worst Classified Letters:** Results showed the model had higher accuracy for letters like ‘A’, ‘B’, and lower accuracy for letters with similar shapes (e.g., ‘l’ and ‘I’).

## Future Improvements
The following enhancements could improve model performance:

  - **Larger Dataset:** Expanding the dataset could improve letter detection accuracy, particularly for difficult classes.
  - **Hardware Resources:** A more powerful GPU or additional RAM could accelerate training time and allow experimentation with more complex architectures.
  - **Advanced Models:** Investigate ensemble techniques or try other architectures, such as ResNet or Inception-based models.

## Requirements
  - **Python:** 3.8+
  - **TensorFlow:** 2.x
  - **keras_tuner**
  - Other packages: `numpy`, `pandas`, `opencv-python`, `skimage`, `matplotlib`

## Contact us

For any questions or interest in the project, you can contact us through our [LinkedIn profile1](https://www.linkedin.com/in/arnau-urbina-lopez/) and [LinkedIn profile2](https://www.linkedin.com/in/daniel-ca%C3%B1averas-g%C3%B3mez-662771250/).
