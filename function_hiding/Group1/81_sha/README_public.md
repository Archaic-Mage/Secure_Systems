# Function Hiding

Two functions are hidden in the executable.

`sum`*(common)* and `hidden`*(private)*

---
## Usage

The common and hidden functions have their unique keys for execution.

To use the common function, you can use the following command:

```bash
./binary 0 23 24 69420
```

To use the private function, you can use the following command:

```bash
./binary 1 23 24 <secret_key>
```
If incorrect key is entered, the following output is shown

```bash
Wrong Password
```
---
### NOTES
- Number of Arguments must be 4:
    1. Choice: 0 (sum) or 1 (hidden) 
    2. First number/argument
    3. Second number/argument
    4. Key