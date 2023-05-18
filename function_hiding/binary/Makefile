all:
	cargo build --release --target x86_64-unknown-linux-musl
	strip target/x86_64-unknown-linux-musl/release/binary


clean:
	rm -rf target

init:
	rustup target add x86_64-unknown-linux-musl