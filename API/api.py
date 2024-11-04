# Flask Example
from flask import Flask, request, jsonify
# import your_model_module  # Replace with your actual model file

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    print(data)
    prediction = '1'#your_model_module.predict(data)  # Replace with your model’s prediction function
    return jsonify({'prediction': prediction})

if __name__ == '__main__':
    app.run(port=5000)
