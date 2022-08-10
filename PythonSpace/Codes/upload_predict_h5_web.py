from crypt import methods
from flask import Flask, render_template, request
from werkzeug.utils import secure_filename
import os
from PIL import Image
import numpy as np
from tensorflow import keras
from collections import Counter
import cv2

app = Flask(__name__)

@app.route('/upload')
def upload():
    return render_template('upload.html')

@app.route('/uploader', methods=['GET','POST'])
def uploader():
    f = request.files["file"]

    os.chdir('./images')
    f.save(secure_filename(f.filename))

    # --------------------------------------------

    num_of_data = 1
    img_width_size=600
    img_height_size=400

    testImage = np.zeros(num_of_data * img_width_size * img_height_size * 3, dtype=np.int32).reshape(num_of_data, img_height_size, img_width_size, 3)
    img = np.array(Image.open(f.filename), dtype=np.int32)
    testImage = img
    testData = testImage.reshape(1, 400, 600, 3) / 255.0

    os.chdir('..')
    model_port_still = keras.models.load_model('./port_still_v3.h5')
    model_land_still = keras.models.load_model('./land_still_v3.h5')
    model_land_port = keras.models.load_model('./land_port_v3.h5')
    pred_1 = model_port_still(testData)
    pred_2 = model_land_still(testData)
    pred_3 = model_land_port(testData)

    classes1 = ['portrait', 'stll_life']
    classes2 = ['landscape', 'stll_life']
    classes3 = ['landscape', 'portrait']
    pred = [classes1[np.argmax(pred_1)], classes2[np.argmax(pred_2)],classes3[np.argmax(pred_3)]]
    pred_x = Counter(pred)

    return pred_x.most_common(n=1)[0][0]


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)