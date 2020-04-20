#!/bin/bash
ssh-keygen -t rsa -C "SnarferX@gmail.com"
cd ~/.ssh
ls id_*
mkdir -p key_backup
cp id_rsa* key_backup

