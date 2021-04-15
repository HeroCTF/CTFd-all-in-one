#!/usr/bin/env python3
from pathlib import Path
from json import loads
from os import getenv
from dotenv import load_dotenv
from requests import post

load_dotenv()
BASE_URL = getenv("CTFD_API_URL")
HEADERS = {"Authorization": "Token " + getenv("CTFD_API_TOKEN")}
COOKIES = {"session": getenv("CTFD_COOKIE_SESSION")}

# https://github.com/CTFd/ctfcli/blob/master/ctfcli/utils/challenge.py
class Challenge:
    def __init__(self, id):
        self.id = id

    def __init__(
        self,
        name,
        category,
        description,
        flags,
        chall_type="standard",
        score=0,
        max_attempts=0,
        hints=None,
    ):
        self.id = 0
        self.name = name
        self.category = category
        self.description = description
        self.flags = flags
        self.chall_type = chall_type
        self.score = score
        self.max_attempts = max_attemps
        self.hints = hints
        self.state = ["hidden", "visible"][1]

    def update(self):
        self.delete_challenge()
        self.create_challenge()

    def create_challenge(self):
        self.add_challenge()
        self.add_flags()
        self.add_hints()
        self.add_tags()

    def delete_challenge(self):
        req_json = loads(delete(BASE_URL + "/challenges/" + self.id, json=data, headers=HEADERS, cookies=COOKIES,).text)
        assert req_json["success"]

    def add_challenge(self):
        print("Adding", self.name, "...")
        data = {
            "name": self.name,
            "category": self.category,
            "description": self.description,
            "type": self.chall_type,
            "value": self.score,
            "state": self.state,
        }

        req_json = loads(post(BASE_URL + "/challenges", json=data, headers=HEADERS, cookies=COOKIES).text)
        assert req_json["success"]

        self.id = req_json["data"]["id"]

    def add_flags(self):
        data = {
            "content": self.flag,
            "type": "static",
            "data": "case_insensitive",
            "challenge": self.id,
        }

        req_json = loads(post(BASE_URL + "/flags", json=data, headers=HEADERS, cookies=COOKIES).text)
        assert req_json["success"]

    def add_hints(self):
        for hint in self.hints:
            data = {"content": hint, "cost": 0, "challenge": self.id}

            req_json = loads(post(BASE_URL + "/hints", json=data, headers=HEADERS, cookies=COOKIES).text)
            assert req_json["success"]

    def add_tags(self):
        for tag in self.tags:
            data = {"challenge": self.id, "value": tag}

            req_json = loads(post(BASE_URL + "/tags", json=data, headers=HEADERS, cookies=COOKIES).text)
            assert req_json["success"]


def find_line(content, search):
    for count, line in enumerate(content):
        if search.upper() in line.upper():
            return count
    return False


def parser(content):
    title = content[0][2:].strip()
    category = content[4].strip()

    next_category = find_line(content, "### Hints")
    if not next_category:
        next_category = find_line(content, "### Files")
    if not next_category:
        next_category = find_line(content, "### Write up")

    description = "".join(content[8 : next_category - 1]).strip()
    flag = content[find_line(content, "### Flag") + 2].replace("`", "").strip()
    return title, category, description, flag


if __name__ == "__main__":
    markdowns_path = list(Path(".").rglob("*/*.md"))

    for md_path in markdowns_path:
        with open(md_path, "r") as markdown:
            title, category, description, flag = parser(markdown.readlines())

            add_challenge(title, category, description, flag)
