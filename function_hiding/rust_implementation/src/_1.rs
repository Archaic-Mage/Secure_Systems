use rsa::{PublicKey, RsaPrivateKey, RsaPublicKey, Pkcs1v15Encrypt, pkcs1::{EncodeRsaPrivateKey, EncodeRsaPublicKey, DecodeRsaPrivateKey}};
use base64::{engine::general_purpose, Engine as _};

fn main() {
    let mut rng = rand::thread_rng();

    let bits = 512;
    let private_key = RsaPrivateKey::new(&mut rng, bits).expect("failed to generate a key");
    let public_key = RsaPublicKey::from(&private_key);
    let enc_public_key = EncodeRsaPublicKey::to_pkcs1_pem(&public_key, rsa::pkcs1::LineEnding::CR).expect("failed to generate pem");
    let enc_private_key = EncodeRsaPrivateKey::to_pkcs1_pem(&private_key, rsa::pkcs1::LineEnding::CR).expect("failed to ecnode private key");
    // Encrypt
    let data = b"sum";  
    let enc_data = public_key.encrypt(&mut rng, Pkcs1v15Encrypt, &data[..]).expect("failed to encrypt");
    let dec_data = private_key.decrypt(Pkcs1v15Encrypt, &enc_data).expect("failed to decrypt");
    println!("{:?}", enc_data);

    let string = String::from_utf8(dec_data).unwrap();
    println!("{}", string);
    println!("{:?}", enc_public_key);
    println!("{:?}", enc_private_key.as_str());

    let base64_enc_pri = general_purpose::STANDARD.encode(enc_private_key.as_bytes());
    println!("{}",base64_enc_pri);
}
