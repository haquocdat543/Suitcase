# MANIM

## Installation
#### 1. MacOS
#### 2. Linux
Cenots and Fedora:
```
sudo dnf install cairo-devel pango-devel -y
sudo dnf install python3-devel -y
sudo dnf install ffmpeg -y
pip3 install manim -y
```

Debian and Ubuntu:
```
sudo apt update -y
sudo apt install build-essential python3-dev libcairo2-dev libpango1.0-dev ffmpeg -y
sudo apt install python3-pip -y
pip3 install manim
```

Debian and Ubuntu:
```
sudo pacman -Syu -y
sudo pacman -S cairo pango ffmpeg -y
sudo pacman -S python-pip -y
pip3 install manim
```
#### 3. Docker
Normal:
```
docker run -it --name my-manim-container -v "/full/path/to/your/directory:/manim" manimcommunity/manim /bin/bash
docker start my-manim-container
docker exec -it my-manim-container manim -qm test_scenes.py CircleToSquare
```

Jupiter Notebook:
```
docker run -it -p 8888:8888 manimcommunity/manim jupyter lab --ip=0.0.0.0
```

