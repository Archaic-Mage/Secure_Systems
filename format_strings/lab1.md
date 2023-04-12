---
title: "SECURE SYSTEMS ENGINEERING"
author: Soham Tripathy (CS20B073), Arunesh J B (CS20B009)
date: "10-03-2023"
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "Lab report on Format String Vulnerability"
lang: "en"
titlepage: true,656c736964726f77
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "background.pdf"
page-background: "background1.pdf"
...
\fontfamily{qcr}\selectfont

# CS6570 - LAB 1 Report

## Introduction

In this assignment we will be exploiting certain vulnerabilities in C. We leak the information present in stack, using format string vulnerabilities and using it change contents of a certain memory location.

## Q_1

### Aim

We are given remote executable which contains format string vulnerability. We have to exploit this and guess the password for the user.

### Our Approach

- We connect to the remote server and start interacting with the executable using the 'netcat command'.
  
```bash
ncat 10.21.235.155 1023
```

- Here, we first give normal inputs like my name 'jb' for both username and password.
- We observe the wrong password is getting printed on the output stream which may indicate the presence of a format string vulnerability.
- Now, we give 'jb' as the username and '%p|'  32 times as the password. This leaks the stack contents, which can be seen in the screen shot below.

\begin{minipage}{\linewidth}
    \centering
    \includegraphics[width=\textwidth, height=3cm]{./Q1/p.png}
\end{minipage}

- After carefully observing the contents leaked from the stack, we see that few hexcodes can be converted to readable ascii characters, which might be the password. (Can be seen in the highlighted section of the figure).

\begin{minipage}{\linewidth}
\centering
\includegraphics[width=\textwidth, height=3cm]{./Q1/p_h.png}
\end{minipage}

- After converting that chuck of hexcodes to string (following little endian system), We get 'thispasswordisleakedfromstack'.

\begin{minipage}{\linewidth}
\centering
\includegraphics[width=\textwidth, height=5cm]{./Q1/h_to_s.png}
\end{minipage}

### Result

- With the password above we were successfully able to login.
- This can be seen the following screen shot.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{./Q1/out.png}
\end{minipage}

### Expoit String

We have provided the gen1.py file in the same folder which contains the information to generate the password.

```bash
python gen1.py > exploit_string
```

## Lab_2

### Aim

We are given an executable file 'flag'. We have to use format string vulnerability to write to a certain memory location.

### Our Approach

- First we analyse the executable file to find the address of flag, which is  ```0x0804a02c```. This can be done using gdb, which can seen in the following screen shot.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{./Q2/flag.png}
\end{minipage}

- We now have to identify, what should be written on this memory location. For that we analyse the dump file, generated using the following command.

```bash
objdump -d flag > dump.asm
```

- This dump file reveals that we change the branch when 'eax' is equal to '0x64' which is 100. The eax register holds the value of flag. This can seen in following picture.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{./Q2/flag_s.png}
\end{minipage}

- Thus, now to exploit the 'flag' executable we have to store the value of 100, in the flag variable pointed by the address ```0x0804a02c```, using format strings.

- The format specifer \%<-num->$n is used for this purpose. The 'num' specifies the position w.r.t the $esp in whose location the string length is stored. Thus now we know that the string length input should be 100.

- The position w.r.t $esp which is used as reference address, is found by giving the input as 4 A's followed by 100 %p, and locating ```0x41414141``` on the spilled stack. It is found that this is stored as the 7th argument (can be seen in the figure below).

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{./Q2/location_s.png}
\end{minipage}

### Exploit String

By using the above deductions we generate our format string.

```bash
#!/bin/bash
python -c 'print("\x2c\xa0\x04\x08%96x%7$n")' > exploit_string
```

```\x2c\xa0\x04\x08``` This part contains the address of flag where we want to store 100, which is placed in the 7th position w.r.t $esp when we exploit the vulnerability. 

```%96x``` This is used to add padding of spaces (96 bytes). Since the address is of 4bytes, we now have 100bytes in our string. Hence 100 is stored in the address pointed by the 7th stack location.

### Result

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{./Q2/out.png}
\end{minipage}
