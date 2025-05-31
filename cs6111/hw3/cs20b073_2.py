import pwn
import os
import time
import json
from Crypto.Cipher import AES
# block size
BLOCK_SIZE = 16

# for padding
def pad(s):
  return s + bytes((16 - len(s) % 16) * chr(16 - len(s) % 16), 'ascii')

# for validation of padding
def is_valid_pad(iv, ct):
    try:
        conn = pwn.remote('10.21.236.75', 5055)
        conn.recvuntil('cookie?')
        conn.sendline(iv.hex() + ct.hex())
        s = time.time() 
        conn.recvall()
        e = time.time()
        diff = e - s
        print(diff)
        conn.close()
        return diff
    except Exception as e:
        conn.close()
        return is_valid_pad(iv, ct)

def xor(a, b):
    return bytes([x ^ y for x, y in zip(a, b)])

def single_block_attack(block, oracle):
    zeroing_iv = [1] * BLOCK_SIZE

    for pad_val in range(1, BLOCK_SIZE+1):
        padding_iv = [pad_val ^ b for b in zeroing_iv]
        times = []

        for candidate in range(256):
            print("\rfor (pad_val, candidate): (" + str(pad_val) + ", " + str(candidate) + ")")
            print(zeroing_iv)
            padding_iv[-pad_val] = candidate
            iv = bytes(padding_iv)
            times.append(oracle(iv, block))
            if times[-1] > 1:
                break
        
        candidate = times.index(max(times))

        zeroing_iv[-pad_val] = candidate ^ pad_val

    return zeroing_iv

def full_attack(pt, oracle):

    ptblock = [pt[i:i+BLOCK_SIZE] for i in range(0, len(pt), BLOCK_SIZE)] 
    result = b''

    iv = b'\x00'*16 
    result = iv

    for i in range(len(ptblock)-1, -1, -1):
        ct = iv
        block = single_block_attack(ct, oracle)
        iv = xor(block, ptblock[i]) 
        result = iv + result
    return result


a = {"roll":"CS20B073","is_admin":"true","expires":"2023-12-31"}
b = json.dumps(a)
padb = pad(b.encode())
ciph = full_attack(padb, is_valid_pad)
print(ciph)
print(len(ciph))

conn = pwn.remote('10.21.236.75', 5055)
conn.recvuntil('cookie?')
conn.sendline(ciph.hex())
resp = conn.recvall()
print(resp)
conn.close()
