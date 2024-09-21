import requests
import os
import json

token = os.environ.get("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")
reponame = input("Please enter the repo name you want to create : ")

GITHUB_API_URL = "https://github.com/SumitMatte"
headers = {"Authorization": "token {}".format(token)}
data = {"name": "{}".format(reponame)}

r = requests.post(GITHUB_API_URL +"user/repos" + "", data=json.dumps(data), headers=headers)
print(r)
