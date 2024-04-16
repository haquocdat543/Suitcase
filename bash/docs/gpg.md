# GPG

### 1. Generate new key
```
gpg --full-generate-key
```
* select what `kind` of key you want:
  * (1) SA and RSA
  * (2) DSA and Elgamal
  * (3) DSA (sign only)
  * (4) RSA (sign only)
  * (9) ECC (sign and encrypt) *default*
  * (10) ECC (sign only)
  * (14) Existing key from card

* Please select which `elliptic curve` you want:
  * (1) Curve 25519 *default*
  * (4) NIST P-384
  * (6) Brainpool P-256 

* Please specify `how long` the key should be valid.
  *    0 = key does not expire
  * <n>  = key expires in n days
  * <n>w = key expires in n weeks
  * <n>m = key expires in n months
  * <n>y = key expires in n years
* Real name: `github name`
* Email address: `Your email associated with github account`
* Comment: `Whatever you want`

### 2. List key
```
gpg --list-secret-keys --keyid-format=long
```

Output
```
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot <hubot@example.com>
ssb   4096R/4BB6D45482678BE3 2016-03-10
```

### 3. Prints the GPG key ID, in ASCII armor format
```
gpg --armor --export 3AA5C34371567BD2
```

Output:
```
-----BEGIN PGP PUBLIC KEY BLOCK-----
-----END PGP PUBLIC KEY BLOCK-----
```

### 4. Add public GPG key to Github account
```
git config --global user.signingkey 3AA5C34371567BD2
```

```
echo "test" | gpg --clearsign
export GPG_TTY=$(tty)
echo "test" | gpg --clearsign
```

List gpg configuration:
```
git config -l | grep gpg
```

### 5. Delete key
key:
```
gpg --delete-key <key_id_or_email>
gpg --delete-key --force <key_id_or_email>
```

Secret key:
```
gpg --delete-secret-key <key_id_or_email>
gpg --delete-secret-key --force <key_id_or_email>
```

### 6. Backup key
```
gpg --export --armor <key_id_or_fingerprint> > public_key.asc

```

```
gpg --export-secret-keys --armor <key_id_or_fingerprint> > private_key.asc
```

### 7. Restore key
Public key:
```
gpg --import public-keys.asc
```

Secret key:
```
gpg --import secret-keys.asc
```
