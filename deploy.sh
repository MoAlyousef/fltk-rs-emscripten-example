cargo build --release --target=wasm32-unknown-emscripten
cp ./target/wasm32-unknown-emscripten/release/flcalc* docs