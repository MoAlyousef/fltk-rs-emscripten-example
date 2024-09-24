# fltk-rs-emscripten-example

This is a simple repo showing how to build fltk-rs for the web via emscripten.

Demo: https://moalyousef.github.io/fltk-rs-emscripten-example

This requires the emsdk:
https://emscripten.org/docs/getting_started/downloads.html

If you have it installed but the environment variables aren't set, you can do so using:
```bash
source ./emsdk_env.sh
# or on windows
emsdk_env.bat
```

You also need to download the rust target via rustup:
```bash
rustup target add wasm32-unknown-emscripten
```

The project can be built using `cargo build --target=wasm32-unknown-emscripten`.

Emscripten normally generates a shell html file, however for Rust wasm binaries, we'll create our own.
Here we have an index.html with a script tag which just imports the necessary glue code: `<script type="text/javascript" src="./flcalc.js"></script>`.
Ensure that the js filename is correct for your application.
You would have to place the generated binary wasm and js glue in the same directory as the index.html.

There's a script `deploy.sh` which you can check out which just builds then copies the files into the docs directory.

Also note the .cargo/config.toml file. The rustflags are important since they enable certain features of emscripten which are required to run FLTK on the browser.
