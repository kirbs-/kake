#! /bin/bash

pip install jupyter notebook

mkdir /data
mkdir /snapshots

git clone https://github.com/kirbs-/kake.git /data
chmod 777 -R /data
chgrp "CORP\domain users" /data


mkdir /etc/jupyter

mv /data/jupyter_notebook_config.py /etc/jupyter/jupyter_notebook_config.py

mv /data/notebook.service /etc/systemd/system/notebook.service

systemctl daemon-reload

systemctl enable notebook.service
systemctl start notebook.service

rm /data/setup.sh
