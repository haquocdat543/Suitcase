# RUST

### 1. Installation
#### 1. From Source
Clone git repository:
```sh
git clone https://github.com/rust-lang/rust.git
cd rust
```

Configure for host:
```sh
./configure
```

Build and install [ python ]:
```sh
./x.py build && ./x.py install
```

Build and install [ Make ]:
```sh
make && sudo make install
```

#### 2. Error explain
Github error document path:
```
https://github.com/rust-lang/rust/tree/master/compiler/rustc_error_codes/src/error_codes
```

Explain error code with `error code`
```sh
rustc --explain E0798
```

* Note: At the time I write this, there are 798 error code totally.

### 2. Build
Optimize level on release:
```
RUSTFLAGS='-C opt-level=3' cargo build --release
```

### 4. Macro
#### 1. Procedural macro
Create new library:
```sh
cargo new my_macro --lib
```

Cargo.toml:
```toml
[lib]
proc-macro = true
```

lib.rs:
```rust
extern crate proc_macro;
use proc_macro::TokenStream;
use quote::quote;
use syn;

#[proc_macro]
pub fn my_macro(input: TokenStream) -> TokenStream {
    // Parse the input tokens into a syntax tree
    let ast = syn::parse_macro_input!(input as syn::Expr);

    // Generate new tokens for the macro expansion
    let expanded = quote! {
        println!("Hello from my procedural macro! Input: {:?}", #ast);
    };

    // Convert back to TokenStream
    TokenStream::from(expanded)
}
```

Use macro:
```toml
[dependencies]
my_macro = { path = "../my_macro" }
```

Use macro in rust [ Function ]:
```rust
use my_macro::my_macro;

fn main() {
    my_macro!(42);
}
```

Use macro in rust [ Derive ]:
```rust
#[proc_macro_derive(MyTrait)]
pub fn derive_my_trait(input: TokenStream) -> TokenStream {
    // implementation here
}
```

Use macro in rust [ Attibute ]:
```rust
#[proc_macro_attribute]
pub fn my_attr_macro(attr: TokenStream, item: TokenStream) -> TokenStream {
    // implementation here
}
```


