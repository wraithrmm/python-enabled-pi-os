FROM balenalib/raspberry-pi-debian:latest

RUN set -x && \
	apt-get update && apt-get upgrade -y --allow-unauthenticated && apt-get dist-upgrade -y --allow-unauthenticated
 
RUN set -x && \	
	apt-get install -y wget libffi-dev libbz2-dev liblzma-dev libsqlite3-dev libncurses5-dev libgdbm-dev zlib1g-dev libreadline-dev libssl-dev tk-dev build-essential libncursesw5-dev libc6-dev openssl python3-toml

RUN set -x && \	
        wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz && \
        tar -xf Python-3.7.0.tgz && \
        cd Python-3.7.0 && \
        ./configure --enable-optimizations

RUN set -x && \	
        cd Python-3.7.0 && \
        make -j -l 4

RUN set -x && \	
        cd Python-3.7.0 && \
        sudo make altinstall

RUN set -x && \
        apt-get install -y curl

RUN set -x && \
        apt-get install -y python3-pip

RUN set -x && \
        curl -O https://bootstrap.pypa.io/get-pip.py && \
        sudo python3.7 get-pip.py

RUN set -x && \
        sudo pip3 install psutil

RUN set -x && \
        sudo pip3 install pyyaml

#RUN set -x && \
#        apt-get install -y apt-transport-https zip unzip mpg123 dirmngr gcc make pkg-config automake libtool libicu-dev libpcre2-dev libasound2-dev portaudio19-dev python3-pyaudio mosquitto mosquitto-clients libxml2-dev libxslt-dev flac libatlas-base-dev gfortran ffmpeg

#RUN set -x && \
#        apt-get install -y dbus gir1.2-glib-2.0 libdbus-glib-1-2 libgirepository-1.0-1 libpython3-dev libpython3.5 libpython3.5-dev python-pip-whl python3-cffi-backend python3-crypto python3-cryptography python3-dbus python3-dev python3-gi python3-idna python3-keyring python3-keyrings.alt python3-pkg-resources python3-pyasn1 python3-secretstorage python3-setuptools python3-six python3-xdg python3.5-dev 

RUN set -x && \
        pip install --upgrade pip

RUN set -x && \
        pip3.7 install virtualenv

RUN set -x && \
        echo "alias python3='python3.7'\nalias pip='pip3.7'" >> ~/.bashrc

