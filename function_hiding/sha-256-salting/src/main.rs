use sha256::{digest};
use rand::{distributions::Alphanumeric, Rng};

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

fn main() {

    let s: String = rand::thread_rng()
    .sample_iter(&Alphanumeric)
    .take(20)
    .map(char::from)
    .collect();
    println!("{}", s);

    let password = &s;
    let hash = _salt(password, 12);
    println!("{}", hash);
}
