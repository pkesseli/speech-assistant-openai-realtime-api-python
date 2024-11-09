from python:3.13.0
run pip install --upgrade pip
run pip install certbot
run apt-get update
run apt-get install --yes cron
run echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | tee -a /etc/crontab > /dev/null
workdir /app/genai-phone-assistant
copy requirements.txt *.py .
run pip install -r requirements.txt
entrypoint ["python", "main.py"]
