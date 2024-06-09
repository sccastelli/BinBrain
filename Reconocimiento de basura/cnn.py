import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from tensorflow.keras.preprocessing.image import ImageDataGenerator

# Constants
IMAGE_SIZE = (128, 128)
BATCH_SIZE = 32

# Data augmentation and normalization for training
train_datagen = ImageDataGenerator(
    rescale=1./255,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    validation_split=0.2
)

# Only rescaling for validation
val_datagen = ImageDataGenerator(rescale=1./255, validation_split=0.2)

# Flow training images in batches of BATCH_SIZE using train_datagen generator
train_generator = train_datagen.flow_from_directory(
    'data/train',
    target_size=IMAGE_SIZE,
    batch_size=BATCH_SIZE,
    class_mode='binary',
    subset='training'
)

# Flow validation images in batches of BATCH_SIZE using val_datagen generator
validation_generator = val_datagen.flow_from_directory(
    'data/train',
    target_size=IMAGE_SIZE,
    batch_size=BATCH_SIZE,
    class_mode='binary',
    subset='validation'
)

# Define a simple CNN model
model = Sequential([
    Conv2D(16, (3, 3), activation='relu', input_shape=(128, 128, 3)),
    MaxPooling2D((2, 2)),
    Flatten(),
    Dense(16, activation='relu'),
    Dense(1, activation='sigmoid')  # Binary classification
])

model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Train the model
model.fit(
    train_generator,
    validation_data=validation_generator,
    epochs=10
)

# Save the model using the native Keras format
model.save('simple_model.keras')

# Export the model to the SavedModel format
tf.saved_model.save(model, 'saved_model/')

# Convert the SavedModel to TensorFlow Lite format
converter = tf.lite.TFLiteConverter.from_saved_model('saved_model/')

# Enable experimental options
converter.experimental_new_converter = True
converter.target_spec.supported_ops = [
    tf.lite.OpsSet.TFLITE_BUILTINS,  # TensorFlow Lite built-in ops.
    tf.lite.OpsSet.SELECT_TF_OPS  # TensorFlow operations.
]

tflite_model = converter.convert()

# Save the converted model
with open('simple_model.tflite', 'wb') as f:
    f.write(tflite_model)

print("Simple model has been successfully converted to TensorFlow Lite format and saved as simple_model.tflite")
