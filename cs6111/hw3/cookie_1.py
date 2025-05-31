#!/usr/bin/env python3
import json
import time
import sys
import os
from Crypto.Cipher import AES

# %%
key = b'5\xec\x80\xac\xd6\xab\x17/\x0f.P3\xdb<8\xd0'

# %%
def pad(s):
  return s + bytes((16 - len(s) % 16) * chr(16 - len(s) % 16), 'ascii')

# %%
def isvalidpad(s):
    value = ord(chr(s[-1]))*s[-1:]==s[-ord(chr(s[-1])):]
    return value

# %%
def unpad(s):
    value = s[:-ord(s[len(s)-1:])]
    return value

# %%
def decrypt(m):
  cipher = AES.new(bytes.fromhex(key.hex()), AES.MODE_CBC, bytes.fromhex(m[0:32]))
  return cipher.decrypt(bytes.fromhex(m[32:]))

# %%
sys.stdout = os.fdopen(sys.stdout.fileno(), 'w')
print("What is your cookie?", end="", flush=True)
cookie2 = sys.stdin.readline()
cookie2decoded = decrypt(cookie2[:-1])

# %%
if isvalidpad(cookie2decoded):
   d=json.loads(unpad(cookie2decoded))
   print("rollnumber: " + d["roll"], flush=True)
   print("Admin? " + d["is_admin"], flush=True)
   exptime=time.strptime(d["expires"],"%Y-%m-%d")
   if exptime > time.localtime():
      print("Cookie is not expired", flush=True)
   else:
      print("Cookie is expired", flush=True)
   if d["is_admin"]=="true" and exptime > time.localtime():
      flag = open("flags/" + str(d["roll"]) + ".txt", "r").read().strip()
      print("The flag is: " + flag, flush=True)
else:
   print("invalid padding", flush=True)