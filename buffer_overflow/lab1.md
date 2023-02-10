---
title: "SECURE SYSTEMS ENGINEERING"
author: Soham Tripathy (CS20B073), Arunesh J B (CS20B009)
date: "10-02-2023"
subject: "Markdown"
keywords: [Markdown, Example]
subtitle: "Lab Report on Binary Exploitation using buffer overflow"
lang: "en"
titlepage: true,
titlepage-text-color: "FFFFFF"
titlepage-rule-color: "360049"
titlepage-rule-height: 0
titlepage-background: "background.pdf"
page-background: "background1.pdf"
...
\fontfamily{qcr}\selectfont

# CS6570 - LAB 1 Report

## Introduction

In this assignment we will be exploiting certain vulnerabilities in C and using them to run our payload. We will overflow the buffer and write into the stack to change the program flow as per our convenience.

## Lab_1

### Aim

Given source code (**lab1_1.c**) and executable (**lab1_1**). We have to come up with a exploit string such that we are able to execute the *exploit()* function in the program.

### Our Approach

- Generate the *dump* file for the given executable using the command ```objdump -d lab1_1 > dump```.

- Look through the dump file to get the address of the function *exploit()* and the return address(address of instruction just after the call to *welcome()*). The line number 634 indicates the instruction immediately after the call to welcome.

\begin{figure}[ht]
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth]{RA_1.png}
\caption{Return Address = 0x8048927}
\label{fig:figure2}
\end{minipage}
\hspace{0.5cm}
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth,height = 2.6cm]{AddressofExit_1.png}
\caption{Exit function Address = 0x0804e300}
\label{fig:figure1}
\end{minipage}
\end{figure}

- Now we use gdb to look through the stack, registers and value of local variables at different stages of execution using breakpoints. The breakpoints are added just after strcpy to analyse the stack after input, before the welcome function exits, to know the location of return address.
- We run the **list** command to look at the source code and get the value of the canary. This value is converted to hexadecimal ```0x55565758``` and is located on the stack. We must ensure to keep this canary intack while we build out exploit string.
- We give some random input and add a break point after the strcpy() is executed. Here we try to examine the stack content for the location of the canary and return address.
- We use this information to know how many fill-in characters should be given in our exploit string.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{Canary_1.png}
            \captionof{figure}{Canary at 0xffffcfac , Return Address at  0xffffcfbc}
\end{minipage}

- Now we create an exploit string such that the value of the canary isn't changed and the return address is changed to the address of **exploit()** function.

### Expoit String

```bash
#!/bin/bash
python -c 'print("AAAAAAAAAAAAXWVUAAAAAAAAAAAA|\x88\x04\x08\x03\xe3\x04\x08")' > exploit_string
```

### Executing the exploit String

- As we can see in the figure the exploit doesn't change the canary (**canary** = ```0x55565758```) in the stack

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=10cm]{ES_Execution_1.png}
\end{minipage}

- We were also able to change the return address in the stack to the address of exploit() function (at 0xffffcf8c in the stack)

- Note: if we have **0x00** in our hexadecimal value then it cannot be stored in the stack, since it stops reading at **0x00**. Hence, we need to find better methods to implement them.

- The address of exit(), has **0x00** so we analysized the function definition and found that the first instruction can be ignored. Hence, by refering to the **next instruction's** address in the **exit()** function, we were able exit normally.
- Our exploit string thus successfully changed the return address in the **exploit** function stack frame to ```0x0804e303``` (the exit()).
- Now during the return from exploit function as we had pushed the address of exit (next instruction in exit) into the stack. The $esp which is pointing at this address (can be seen in the below figure) is taken to set the value of $eip to ```0x0804e303``` and later is decremented. The $eip on execution performs a **clean exit**.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=12cm]{ebp_exit_1.png}
            \captionof{figure}{This is the stack and register info just before we execute the ret command on the exploit function}
\end{minipage}

### Output

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=\textwidth]{output1.png}
\end{minipage}

## Lab_2

### Aim

Given source code **lab1_2.c** and executable **lab1_2**. We have to come up with the exploit string such that we are able to spawn a shell(the binary calls ```\bin\sh```).

### Our Approach

- Generate the dump file for the given executable using the command ```objdump -d lab2_2 > dump```. We analyse it to find the return address after the call to get_name(). This is used to identify the location on stack where return address is present.
- To enter the shell, we need to call the **system** function with **\\bin\\sh** as its argument. Hence we find the system function in gdb using the command ```p system```. Similarly, we can also find the address of the **exit** function to implement our clean exit. (The command ```p exit```)
\begin{figure}[ht]
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth, height=0.75cm]{system_2.png}
\caption{System Address = 0x08048340}
\label{fig:figure2}
\end{minipage}
\hspace{0.5cm}
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth, height=0.75cm]{exit_2.png}
\caption{exit address = 0xf7e337c0}
\label{fig:figure1}
\end{minipage}
\end{figure}

- To find the address of the string **\\bin\\sh** (argument to the system call) we use the *find* command, ```find s_addr, e_addr,"\bin\sh"```
- The command "info proc map" gives us the address mapping of processes. From here we get start and end address of libc, which is used as the arguments for the find command. We search for ```\bin\sh``` from ```0xf7e05000``` to ```0xf7fb6000```. We find the address of the string to be ```0xf7f5e12b```.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=10cm]{binsh_2.png}
\end{minipage}

- Now we look at the stack content make our input string such that the return address in stack is changed to address of system() function (which we already found), the arguments of the system function should be the address of the string ```\bin\sh```, and the return address from system function should point to the address of exit.
- We have to remember that after calling a function, the *esp* points to return address and *esp+4* points to the first argument. This is kept in mind while creating the exploit string.

\begin{figure}[ht]
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth]{pic_s_1.jpeg}
\caption{Stack before the ret statement in get\_name function}
\label{fig:Figure}
\end{minipage}
\hspace{0.5cm}
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth, height=6.7cm]{pic_s_2.jpeg}
\caption{Stack after eip has loaded system's address}
\label{fig:Figure}
\end{minipage}
\end{figure}

### Exploit String

```bash
#!/bin/bash
python -c 'print("AAAABBBBCCCCDDDD\x21\x43\x65\x87EEEEFFFFGGGG\x40
\x83\x04\x08\xc0\x37\xe3\xf7\x2b\xe1\xf5\xf7")' > exploit_string
```

### Execution of Exploit String

- We add break points just before and after strcpy function to see that our exploit string changed the return address from get_name to the address of **system** function. We can also see that we pushed the address of ```\bin\sh``` 4 bytes after the $esp (i.e as arguments to system()). At $esp we have the address to exit, that acts as the return address when we return from the system() function.

\begin{figure}[ht]
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth, height=3cm]{b_strcpy.jpeg}
\caption{Stack just before strcpy}
\label{fig:Figure}
\end{minipage}
\hspace{0.5cm}
\begin{minipage}[b]{0.45\linewidth}
\centering
\includegraphics[width=\textwidth, height=3cm]{b_strcpy.jpeg}
\caption{Stack after strcpy}
\label{fig:Figure}
\end{minipage}
\end{figure}

- We break at the ret instruction of the get\_name() function and look at the stack content. We know that the value at the $esp is the return address which points to the address of system() function.

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=13cm]{stack_es2_2.png}
\end{minipage}

### Output

\begin{minipage}{\linewidth}
            \centering
            \includegraphics[width=10cm]{output2.png}
\end{minipage}
\newline
\newline
## Ways to Secure

- One way to secure is to simply **use languages which do not allow such vulnerabilities**. In a language like C, we are given access to stack and memory which makes it more vulnerable to such attacks. We can instead use languages like rust, java, python and .net which are not prone to such vulnerabilities.
- By using **runtime OS protection** (runtime array bounds checking). This ensures that every program run is within the buffer space or memory available and checks every data written into the memory.
- Instead of having a fixed value for the canary we can have a **random canary**. Hence the value of the canary changes on every execution making it more difficult for the attacker to generate an exploit string.
- Another way is to use **ASLR (Address Space Layout Randomization)**. ASLR increases the control flow integrity of a system by randomizing the offsets it uses in memory layouts. Attackers trying to do the return to libc attack must locate the payload first, if aslr is enabled then makes it difficult for the attacker to locate the payload in the memory.
- Another alternative is instead of using functions like strcpy() and strcat() which are prone to buffer overflow attacks we can use their **strn- versions**. These versions only write to maximum size of the target buffer.
    Ex : strncat() , strncopy()