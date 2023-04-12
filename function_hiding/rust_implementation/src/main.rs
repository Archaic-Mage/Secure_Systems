use std::collections::HashMap;
use rsa::{RsaPrivateKey,Pkcs1v15Encrypt, pkcs1::{DecodeRsaPrivateKey}};   
use base64::{engine::general_purpose, Engine as _};  
use std::env;

fn sum(a: i32, b: i32) -> i32 {
    return a + b;
}

fn subtraction(a: i32, b: i32) -> i32 {
    return a - b;
}

fn multiplication(a: i32, b: i32) -> i32 {
    return a * b;
}

fn division(x: i32, y: i32) -> i32 {
    let mut a = x;
    let b = y;
    let mut result = 0;

    loop {
        if b == 0 {
            panic!("");
        } else if a < b {
            result-=1;
            break;
        } else {
            a -= b;
            result += 1;
        }
    }

    result += 1;
    return result;
}


fn modulo(a: i32, b: i32) -> i32 {
    return a % b;
}

fn xor(a: i32, b: i32) -> i32 {
    return a ^ b;
}

fn or(a: i32, b: i32) -> i32 {
    return a | b;
}

fn and(a: i32, b: i32) -> i32 {
    return a & b;
}

fn power(a: i32, b: i32) -> i32 {
    let mut result = 1;
    for _ in 0..b {
        result *= a;
    }
    result += 1;
    return result
}

fn gcd(a: i32, b: i32) -> i32 {
    let mut a = a;
    let mut b = b;
    while b != 0 {
        let t = b;
        b = a % b;
        a = t;
    }
    return a;
}

fn lcm(a: i32, b: i32) -> i32 {
    return (a * b) / gcd(a, b);
}

fn ncr(n: i32, r: i32) -> i32 {
    if r > n - r {
        return ncr(n, n - r);
    }
    let mut ans = 1;
    for i in 0..r {
        ans *= n - i;
        ans /= i + 1;
    }
    return ans;
}

fn npr(n: i32, r: i32) -> i32 {
    let mut ans = 1;
    for i in 0..r {
        ans *= n - i;
    }
    return ans;
}

fn max(a: i32, b: i32) -> i32 {
    if a > b {
        return a;
    } else {
        return b;
    }
}

fn min(a: i32, b: i32) -> i32 {
    if a < b {
        return a;
    } else {
        return b;
    }
}

fn fibonacci(n: i32) -> i32 {
    if n <= 1 {
        return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

fn fibonacci_sum(a: i32, b: i32) -> i32 {
    return fibonacci(a) + fibonacci(b);
}

fn is_prime(n: i32) -> bool {
    if n < 2 {
        return false;
    }
    for i in 2..=(n as f32).sqrt() as i32 {
        if n % i == 0 {
            return false;
        }
    }
    return true;
}

fn largest_prime(a: i32, b: i32) -> i32 {
    let n = a*b;
    let mut largest = 0;
    for i in 2..=n {
        if is_prime(i) && i > largest {
            largest = i;
        }
    }
    return largest;
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let x = args[1].parse::<i32>().unwrap();
    let y = args[2].parse::<i32>().unwrap();
    let b64: &[u8] = args[3].as_bytes();
    let mut some:Vec<u8> = Vec::new();
    for i in 1..b64.len() {
        some.push(b64[i]);
    }
    let my_pem_encoded = String::from_utf8(some).unwrap();

    let bytes = general_purpose::STANDARD.decode(my_pem_encoded.as_str()).expect("error decoding base64");
    let pem = &String::from_utf8(bytes).unwrap();

    let enc_data:Vec<u8>;

    if b64[0] == b'H' {
        enc_data = vec![109, 85, 154, 219, 227, 38, 120, 233, 11, 153, 114, 169, 123, 30, 76, 178, 202, 34, 209, 101, 49, 233, 242, 196, 142, 45, 159, 195, 202, 140, 210, 72, 154, 82, 220, 243, 13, 84, 243, 130, 64, 192, 130, 18, 216, 140, 182, 125, 116, 147, 70, 231, 118, 37, 59, 114, 42, 229, 210, 35, 227, 49, 231, 224];
    } else {
        enc_data = vec![95, 27, 198, 239, 79, 7, 233, 132, 194, 247, 153, 104, 238, 113, 100, 238, 158, 248, 86, 184, 171, 170, 15, 128, 145, 152, 84, 22, 102, 248, 14, 173, 41, 131, 130, 121, 125, 230, 138, 21, 42, 117, 66, 120, 131, 117, 63, 86, 244, 133, 42, 252, 191, 248, 155, 67, 218, 190, 14, 84, 228, 6, 19, 68];
    }
    let private_key = RsaPrivateKey::from_pkcs1_pem(pem).expect("failed to decode");
    let dec_data = private_key.decrypt(Pkcs1v15Encrypt, &enc_data).expect("failed to decrypt");
    let func_name = String::from_utf8(dec_data).unwrap();

    // Create a map of function names to function pointers
    let mut func_map = HashMap::new();

    func_map.insert("sum", sum as fn(i32, i32) -> i32);
    func_map.insert("subtraction", subtraction as fn(i32, i32) -> i32);
    func_map.insert("multiplication", multiplication as fn(i32, i32) -> i32);
    func_map.insert("division", division as fn(i32, i32) -> i32);
    func_map.insert("modulo", modulo as fn(i32, i32) -> i32);
    func_map.insert("xor", xor as fn(i32, i32) -> i32);
    func_map.insert("or", or as fn(i32, i32) -> i32);
    func_map.insert("and", and as fn(i32, i32) -> i32);
    func_map.insert("power", power as fn(i32, i32) -> i32);
    func_map.insert("gcd", gcd as fn(i32, i32) -> i32);
    func_map.insert("lcm", lcm as fn(i32, i32) -> i32);
    func_map.insert("ncr", ncr as fn(i32, i32) -> i32);
    func_map.insert("npr", npr as fn(i32, i32) -> i32);
    func_map.insert("max", max as fn(i32, i32) -> i32);
    func_map.insert("min", min as fn(i32, i32) -> i32);
    func_map.insert("fibonacci_sum", fibonacci_sum as fn(i32, i32) -> i32);
    func_map.insert("largest_prime", largest_prime as fn(i32, i32) -> i32);

    // Decrypt the function name and find the corresponding function pointer in the map
    let func_ptr= func_map.get(func_name.as_str()).expect("You don't have the access");

    // Call the function with the given arguments
    let result = func_ptr(x, y);

    // Print the result to the console
    println!("The result {}",result);
}
