import os

from random import randint
from time import sleep


dir_videos = ".Videos/"
video_list = os.listdir(dir_videos)
    TIME = 2700

while True:
    video = dir_videos + video_list[randint(0, len(video_list) - 1)]
    sleep(TIME)
    os.system(f'vlc --fullscreen  "{video}"')
    break
