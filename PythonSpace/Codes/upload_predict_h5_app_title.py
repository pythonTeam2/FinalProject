from flask import Flask,request, jsonify
from werkzeug.utils import secure_filename
import os
from PIL import Image
import numpy as np
from tensorflow import keras


app = Flask(__name__)


@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    f = request.files['image']
    os.chdir("./images")
    f.save(secure_filename(f.filename))
    # ----------------
    num_of_data = 61
    img_width_size = 270
    img_height_size = 180

    testImage=np.zeros(num_of_data * img_width_size * img_height_size*3, dtype = np.int32).reshape(num_of_data, img_height_size, img_width_size,3)

    img = np.array(Image.open(f.filename), dtype =np.int32)
    testImage[0,:,:,:] = img  

    dirNames = ['A Sunday on La Grande Jatte',
                'Adoration of the Magi',
                'After the Bath- Seated Woman Drying Herself',
                'Bonaparte Crossing the Grand Saint-Bernard Pass, Jacques Louis David',
                'Cupid complaining to Venus',
                'Dance at Le Moulin de la Galette',
                'Death in the Sickroom',
                'Deer in the Forest',
                'Four Seasons in One Head',
                'Gorge near Amalfi',
                'Horse Frightened by Lightning',
                'Hotel Lobby',
                'In the Alpine High Valley (Landscape with Mt. Wendelstein)',
                'Jean Metzinger',
                'Landscape with a Footbridge',
                'Les Plaisirs du Bal',
                'Madonna and Child with Saints Catherine and Thomas (sacra conversazione)',
                'Madonna and Child with St. John the Baptist',
                'Mill on the Couleuvre at Pontoise',
                'Monk Talking to an Old Woman',
                'Moonrise over the Sea',
                'Morning',
                'Ophelia',
                'Points',
                'Portrait of Pablo Picasso',
                'Portraits of the Duke and Duchess of Urbino',
                'Princes Street with the Commencement of the Building of the Royal Institution',
                'Public Exhibition of a Picture',
                'Red and White',
                'Respect',
                'Saint Francis of Assisi Receiving the Stigmata',
                'Scene Under the Arcades in Thun',
                'Seated Couple',
                'Solitary Tree',
                "St's Peter and Paul",
                'Stonehenge - Twilight',
                'Study of A boat passing a lock',
                'Summer Day',
                'The Battle of Camperdown',
                'The Good Education',
                'The House at Rueil',
                'The Infante Baltasar Carlos on Horseback',
                'The Interior of the Palm House',
                'The Magdalen with the Smoking Flame',
                'The Raising of Lazarus',
                'The Road to Gelmeroda',
                'The Rowers',
                'The Seed of the Areoi',
                'The Triumph of Bacchus',
                'The milkmaid']
                
    os.chdir('..')
    model2 = keras.models.load_model("./art_50.h5")
    preds = model2.predict(testImage[0:1])
    return jsonify({'result' : dirNames[np.argmax(preds[0])]})

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
