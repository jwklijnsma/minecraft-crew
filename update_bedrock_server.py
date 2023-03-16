import os
import requests
import zipfile

# Set the URL to download the file from
url = "https://minecraft.net/en-us/download/server/bedrock/."

# Set the headers to use in the request
headers = {
    "Accept-Encoding": "identity",
    "Accept-Language": "en",
    "User-Agent": "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BEDROCK-UPDATER)"
}

# Send the request to the server and get the response
response = requests.get(url, headers=headers)

# Parse the response and get the URL of the bedrock_server file
download_url = response.text.split("\n")[127].split('"')[3]

# Download the file and save it as bedrock-server.zip
response = requests.get(download_url)
with open("bedrock-server.zip", "wb") as f:
    f.write(response.content)

# Extract the contents of the zip file
with zipfile.ZipFile("bedrock-server.zip", "r") as zip_ref:
    zip_ref.extractall()

# Delete all files except the bedrock_server file
os.remove("bedrock-server.zip")
for file in os.listdir():
    if file != "bedrock_server":
        os.remove(file)

os.replace('bedrock_server', '/home/minecraft/bedrock_server')
