# Image-Identification-using-Neural-Network

This project demonstrates an image classification model using a Convolutional Neural Network (CNN) to identify objects in images. The model is trained on the CIFAR-10 dataset, which includes ten classes of objects.

## Technologies Used

- **Python**: Programming language used for writing the code.
- **TensorFlow**: Deep learning framework used to build and train the neural network model.
- **Keras**: High-level API for TensorFlow used for model creation and training.
- **NumPy**: Library for numerical operations on arrays.
- **Matplotlib**: Library for plotting images and graphs.
- **OpenCV**: Library for image processing.

## Dataset

The model is trained on the CIFAR-10 dataset, which consists of 60,000 32x32 color images in 10 different classes, with 6,000 images per class. The dataset is divided into 50,000 training images and 10,000 testing images.

## Model Architecture

- **Input Layer**: Takes 32x32x3 images as input.
- **Convolutional Layers**: 
  - Conv2D layer with 32 filters and a 3x3 kernel.
  - MaxPooling2D layer with a 2x2 pool size.
  - Conv2D layer with 64 filters and a 3x3 kernel.
  - MaxPooling2D layer with a 2x2 pool size.
  - Conv2D layer with 64 filters and a 3x3 kernel.
- **Flatten Layer**: Flattens the 3D output to 1D.
- **Dense Layers**: 
  - Dense layer with 64 units and ReLU activation.
  - Dense layer with 10 units (one for each class) and softmax activation for classification.

## Training

The model is trained for 10 epochs with the Adam optimizer and sparse categorical crossentropy loss function. It uses accuracy as a metric to evaluate performance.

## Evaluation

The model’s performance is evaluated on the test dataset, and the loss and accuracy are printed.

## Inference

The trained model is used to classify new images. Images are loaded using OpenCV, converted to RGB format, and then passed through the model to get predictions.

## Applications

Image classification with neural networks has numerous applications in real-world scenarios:

- **Autonomous Vehicles**: Identifying and classifying objects on the road, such as vehicles, pedestrians, and traffic signs, to assist in navigation and decision-making.
- **Medical Imaging**: Analyzing medical images to detect and classify diseases or abnormalities, such as tumors in X-rays or MRI scans.
- **Security and Surveillance**: Monitoring and identifying individuals or objects in security footage, enhancing safety and security measures.
- **Retail and E-Commerce**: Automating product categorization and inventory management by classifying images of products.
- **Agriculture**: Identifying and classifying crops, pests, or diseases in agricultural settings to optimize farming practices.
- **Social Media**: Automatically tagging and organizing photos based on the objects or people identified in the images.
- **Assistive Technologies**: Helping visually impaired individuals by providing descriptions of objects or scenes through image classification.

## Usage

1. **Training**: Run the script to train the model on the CIFAR-10 dataset.
2. **Saving and Loading**: The trained model is saved to a file named `image_classifier.keras` and can be loaded later for inference.
3. **Inference**: Load images using OpenCV, preprocess them, and use the model to make predictions. Results are displayed using Matplotlib.

## Files

- `image_classifier.keras`: The saved model file.
- `bird_resize.jpg`, `car_resize.jpg`, `plane_resize.jpg`, `cat_resize.jpg`, `deer_resize.jpg`, `dog_resize.jpg`, `frog_resize.jpg`, `horse_resize.jpg`, `ship_resize.jpg`, `truck_resize.jpg`. Example images for inference.

## Author

Suryanarayan Panda
