# Play with CTFd API

## Upload challenges

The script [upload_challenges.py](upload_challenges.py) reads recursively all the README.md of a folder and its subfolders, parse their contents and uploads the different challenges to CTFd.

All the README.md must have the same syntax to be read by the parser. If you do not need a category, for example, if your challenge do not have any hints, you can simply remove the category.

```markdown
# h4XOR

### Category

Crypto

### Description

Can you recover the **flag.png** image ?

Format : **Hero{flag}**<br>
Author : **xanhacks**

### Files

- [xor.py](xor.py)
- [flag.png.enc](flag.png.enc)

### Hints

- The **xor** function is from the **pwntools** module.
- Hints number two

### Write up

We know that if **flag ^ key = enc**, then **enc ^ key = flag**. So, we need to recover the key.

...

Let's check the 10 images. Bingo, the last image was valid !

![flag](flag.png)

### Flag

Hero{123_xor_321}
Hero{flag_number_2}
```

### Todos

- Allow multiple flags
- Allow hints
- Files upload
- Prerequisite challenge

## Configure CTFd

### Todos

- Name of the event
- Dates
- Images
- Pages

## Backup

[ctfd_backup.sh](ctfd_backup.sh) is a bash script that allows you to make a backup of your CTFd instance.