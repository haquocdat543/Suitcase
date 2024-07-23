# RUST

### 1. Installation
#### 1. From Source
Clone git repository:
```
git clone https://github.com/rust-lang/rust.git
cd rust
```

Configure for host:
```
./configure
```

Build and install [ python ]:
```
./x.py build && ./x.py install
```

Build and install [ Make ]:
```
make && sudo make install
```

#### 2. Error explain
Github error document path:
```
https://github.com/rust-lang/rust/tree/master/compiler/rustc_error_codes/src/error_codes
```

Explain error code with `error code`
```
rustc --explain E0798
```

* Note: At the time I write this, there are 798 error code totally.
