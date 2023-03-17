import os
import requests
import zipfile
import re

# Set the URL to download the file from
url = "https://minecraft.net/en-us/download/server/bedrock/"

# Set the headers to use in the request
headers = {
    "Accept-Encoding": "identity",
    "Accept-Language": "en",
    "User-Agent": "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BEDROCK-UPDATER)"
}

# Send the request to the server and get the response
response = requests.get(url, headers=headers)

# Parse the response and get the URL of the bedrock_server file
regex = r'https://minecraft\.azureedge\.net/bin-linux/[^"]*'
download_url = re.search(regex, response.text).group(0)

print(download_url)

# Download the file and save it as bedrock-server.zip
response = requests.get(download_url)
with open("/tmp/bedrock-server.zip", "wb") as f:
    f.write(response.content)

# Extract the contents of the zip file
with zipfile.ZipFile("/tmp/bedrock-server.zip", "r") as zip_ref:
    zip_ref.extractall()

#dir_path = "/tmp/"     
    
# Delete all files except the bedrock_server file
#os.remove("/tmp/bedrock-server.zip")
#for file in os.listdir():
#    if file != "/tmp/bedrock_server":
#        os.remove(os.path.join(dir_path, file))

#os.replace('/tmp/bedrock_server', '/home/minecraft/bedrock_server')
