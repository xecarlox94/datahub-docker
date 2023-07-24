#!/usr/bin/python3


import argparse

from pathlib import Path

from rosbags.highlevel import AnyReader

import numpy as np

import cv2


import os

def _mkdir(d):
    if not os.path.exists(d):
       os.makedirs(d)



base_container_folder = './'

file_name = os.getenv("FILE")

file_name = "test.bag"

file_path = os.path.join(base_container_folder, file_name)

file_base_name = file_name.split('.')[0]



with AnyReader([Path("test.bag")]) as reader:

    connections = reader.connections

    messages = reader.messages(connections=connections)


    for message in messages:

        connection, timestamp, rawdata = message

        deserialised_data = reader.deserialize(rawdata, connection.msgtype)

        if hasattr(deserialised_data, 'data') == False: continue

        image = deserialised_data.data

        shape = deserialised_data.height, deserialised_data.width, 3

        array = np.reshape(image, shape)

        img_file_path = os.path.join(
            base_container_folder,
            ("imgs"),
            f'{timestamp}.jpg'
        )

        folder_name = os.path.join(*img_file_path.split('/')[1:-1])

        _mkdir(folder_name)

        cv2.imwrite(img_file_path, array)
