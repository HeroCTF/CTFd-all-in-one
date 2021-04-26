#!/usr/bin/env python3
from json import loads, dumps
from os import getenv
from dotenv import load_dotenv
from requests import get

load_dotenv()
CTFD_API_URL = getenv("CTFD_BASE_URL") + "/api/v1/scoreboard"
HEADERS = {"Authorization": "Token " + getenv("CTFD_API_TOKEN")}
COOKIES = {"session": getenv("CTFD_COOKIE_SESSION")}

json_data = loads(get(CTFD_API_URL, headers=HEADERS, cookies=COOKIES).text)
assert json_data["success"]

scoreboard = {
    "standings": []
}

for team in json_data["data"]:
    scoreboard["standings"].append({
        "pos": team["pos"],
        "team": team["name"],
        "score": int(team["score"])
    })

print(dumps(scoreboard))