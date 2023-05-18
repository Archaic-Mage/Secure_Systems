use std::{env, collections::HashMap, process::exit};
use sha256::digest;

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
    let mut a = x.abs();
    let b = y.abs();
    let mut result = 0;

    loop {
        if b == 0 {
            println!("Access Restricted!");
            exit(0);
        } else if a < b {
            result-=1;
            break;
        } else {
            a -= b;
            result += 1;
        }
    }
    result += 1;

    if (x>0)^(y>0) {
        if x%y != 0{
            return -result-1
        }
        else {
            return -result;
        }
        
    }
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

fn _salt(password: &str, rounds: i32) -> String {
    let salt = "zbc@@@###usopfa";
    let mut ps: String = password.to_string();
    let mut hash: String;
    for _ in 0..rounds {
        ps = ps + salt;
        hash = digest(ps);
        ps = hash;
    }
    return ps;
}

fn check_password(password: &str) -> bool {
    let part1 = password.split("{").nth(0);
    match part1 {
        Some("sum@cs6570#sse") => true,
        Some("hidden@cs6570#sse") => true,
        _  => false,
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let x = args[1].parse::<i32>().unwrap();
    let y = args[2].parse::<i32>().unwrap();
    let password = args[3].as_str();

    if !check_password(password) {
        println!("Wrong password format, use sum@cs6570#sse{{<key>}} (or) hidden@cs6570#sse{{<key>}}");
        exit(0);
    }

    let hash = _salt(&password, 12);


    // Create a map of function names to function pointers
    let mut func_map = HashMap::new();

    func_map.insert("1fe88df915f1868af74877c084d37d259250486a10ce30af1ca17b099b416adf", sum as fn(i32, i32) -> i32);
    func_map.insert("400dc3c802969e18dcaaa2f791b571d07c72dbb7e5ef457512377314ccdea29b", subtraction as fn(i32, i32) -> i32);
    func_map.insert("478d8f1bd0242d00d1ca5a541723a0dd1d365ad7bd542e6019ba200884b019b6", multiplication as fn(i32, i32) -> i32);
    func_map.insert("61de143a1d13be4c1abfbfb5b91e8f740ebdf3b837c0ea657c691873d88a3eeb", division as fn(i32, i32) -> i32);
    func_map.insert("c1c13863cea833913cb614f2bcec7b2c72b5dcb8d40cda1cbffba8ee691c2373", modulo as fn(i32, i32) -> i32);
    func_map.insert("30ef02aa3ccaff0cb00c7f6ac36c8965de26cf83491ab5ee2a9d65580351532a", xor as fn(i32, i32) -> i32);
    func_map.insert("a8737c877cd0e91fc6d0b3c8230ec7789f9ddf53d2a5bc98ba043539ebd13ea1", or as fn(i32, i32) -> i32);
    func_map.insert("ef84dbb472a0315910178a3c13b11bc773d39f2a4275a670ffea64527cbfc0d4", and as fn(i32, i32) -> i32);
    func_map.insert("edaf129f8a203328e382e9754aa03ccf010051086434c98235cb00fa79188bc9", power as fn(i32, i32) -> i32);
    func_map.insert("315c64aedba8767bb62a7c6906ac6c54c3aa77d08acf1da8fbe1825e6f2793f7", gcd as fn(i32, i32) -> i32);
    func_map.insert("1984f21d1577d57ecb655ff1f64c6ba0ae3a8a2bd9c7dfd83f1d8baeffe49308", lcm as fn(i32, i32) -> i32);
    func_map.insert("214a10cf3d1cb10e3b19bb1c2e1bbf9eb948f2b5b08303e5806af4c4785e1441", ncr as fn(i32, i32) -> i32);
    func_map.insert("697c42e19fb2c69b73156d999af546d0ae3c86f6e60edbc158da4f3dede59ddc", npr as fn(i32, i32) -> i32);
    func_map.insert("c50bd3b996f26daffadb18af1a54ac14c27339f2661f48862df60e47a9de8f07", max as fn(i32, i32) -> i32);
    func_map.insert("b0691b7fec2a41e00a455ab3408d8bb01f153ba0c1b1e8bd5b04fe61cdda18bc", min as fn(i32, i32) -> i32);
    func_map.insert("92ad1d6eee966c561e4cf1a70ecec6d1e37b8803b89158797f821997da08bb10", fibonacci_sum as fn(i32, i32) -> i32);
    func_map.insert("408b83fd0fa84b3f28f4976eafa0aa7154a5db7a17fa89182bb3711fb97deed3", largest_prime as fn(i32, i32) -> i32);

    // Decrypt the function name and find the corresponding function pointer in the map
    if !func_map.contains_key(hash.as_str()) {
        println!("Access Restricted!");
        exit(0);
    } else {

        let func_ptr = func_map.get(hash.as_str()).expect("You don't have access");
        
        // Call the function with the given arguments
        let result = func_ptr(x, y);
    
        // Print the result to the console
        println!("Result = {}",result);
    }

}
