import tensorflow as tf

# Load the Keras model
model = tf.keras.models.load_model('tin_can_bottle_classifier.keras')

# Convert the model to TensorFlow Lite format
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()

# Save the converted model
with open('model.tflite', 'wb') as f:
    f.write(tflite_model)

print("Model has been successfully converted to TensorFlow Lite format and saved as model.tflite")
