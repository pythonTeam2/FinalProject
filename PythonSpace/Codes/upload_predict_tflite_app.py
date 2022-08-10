from crypt import methods
from flask import Flask, request, jsonify # jsonify
from werkzeug.utils import secure_filename
import os
from PIL import Image
import numpy as np
import tensorflow as tf
from collections import Counter

app = Flask(__name__)

@app.route('/uploader', methods=['GET','POST'])
def uploader():
    f = request.files['image'] # file > image
    os.chdir('./images')
    f.save(secure_filename(f.filename))

    # --------------------------------------------

    os.chdir('..')
    interpreter_ps = tf.lite.Interpreter(model_path="./port_still_v3.tflite")
    interpreter_ls = tf.lite.Interpreter(model_path="./land_still_v3.tflite")
    interpreter_lp = tf.lite.Interpreter(model_path="./land_port_v3.tflite")
    interpreter_ps.allocate_tensors()
    interpreter_ls.allocate_tensors()
    interpreter_lp.allocate_tensors()
    input_details_ps = interpreter_ps.get_input_details()
    output_details_ps = interpreter_ps.get_output_details()
    input_details_ls = interpreter_ls.get_input_details()
    output_details_ls = interpreter_ls.get_output_details()
    input_details_lp = interpreter_lp.get_input_details()
    output_details_lp = interpreter_lp.get_output_details()

    os.chdir('./images')
    path = f.filename
    load_img = np.array(Image.open(path).resize((400,600)))

    os.chdir('..')
    input_data = np.array([load_img], dtype=np.float32)
    input_data = input_data / 255 # 정규화

    interpreter_ps.set_tensor(input_details_ps[0]['index'], input_data.reshape(1, 400, 600, 3))
    interpreter_ps.invoke()
    interpreter_ls.set_tensor(input_details_ls[0]['index'], input_data.reshape(1, 400, 600, 3))
    interpreter_ls.invoke()
    interpreter_lp.set_tensor(input_details_lp[0]['index'], input_data.reshape(1, 400, 600, 3))
    interpreter_lp.invoke()

    output_data_ps=interpreter_ps.get_tensor(output_details_ps[0]['index'])
    output_data_ls=interpreter_ls.get_tensor(output_details_ls[0]['index'])
    output_data_lp=interpreter_lp.get_tensor(output_details_lp[0]['index'])

    classes1 = ['portrait', 'stll_life']
    classes2 = ['landscape', 'stll_life']
    classes3 = ['landscape', 'portrait']

    pred = [classes1[np.argmax(output_data_ps)], classes2[np.argmax(output_data_ls)],classes3[np.argmax(output_data_lp)]]
    pred_x = Counter(pred)
    return jsonify({'result' : pred_x.most_common(n=1)[0][0]}) # jsonify

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)