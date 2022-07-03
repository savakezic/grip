1. Running ansible script
  ansible-playbook playbook.yml -i inv.yml
2. Ansible script is copying necessary files (Dockerfile and Nginx config file) to grip/ directory
3. Ansible scrip is installing Docker, Python3, pip and python docker module
3. Then ansible script is asking weather to run Nginx as classic container or systemd service (true or false should be typed)
4. At the end ansible is testing Nginx server by hitting http://127.0.0.1:8080/basic_status request (the reponse is written as ansible register variable)

Asumpions:
- the thas is executed on Ubuntu 20.04 machine
- ansible script is running on localhost machine for test purposes
- commands.txt file is just helping file used during solving process
