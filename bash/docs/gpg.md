# GPG

### 1. Generate new key
```bash
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
```bash
gpg --list-secret-keys --keyid-format=long
```

Output
```bash
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot <hubot@example.com>
ssb   4096R/4BB6D45482678BE3 2016-03-10
```

### 3. Prints the GPG key ID, in ASCII armor format
```bash
gpg --armor --export 3AA5C34371567BD2
```

Output:
```bash
-----BEGIN PGP PUBLIC KEY BLOCK-----
-----END PGP PUBLIC KEY BLOCK-----
```

### 4. Add public GPG key to Github account
```bash
git config --global user.signingkey 3AA5C34371567BD2
```

```bash
echo "test" | gpg --clearsign
export GPG_TTY=$(tty)
echo "test" | gpg --clearsign
```

List gpg configuration:
```bash
git config -l | grep gpg
```

### 5. Delete key
key:
```bash
gpg --delete-key <key_id_or_email>
gpg --delete-key --force <key_id_or_email>
```

Secret key:
```bash
gpg --delete-secret-key <key_id_or_email>
gpg --delete-secret-key --force <key_id_or_email>
```

### 6. Backup key
Finger print:
```bash
gpg --export --armor <key_id_or_fingerprint> > public_key.asc
```
Email:
```bash
gpg --output public.gpg --armor --export google@gmail.com
```

Finger print:
```bash
gpg --export-secret-keys --armor <key_id_or_fingerprint> > private_key.asc
```
Email:
```bash
gpg --output private.gpg --armor --export-secret-keys google@gmail.com
```

### 7. Restore key
Private:
```bash
gpg --import private.asc
```
```bash
gpg --import private.gpg
```

Public key:
```bash
gpg --import public.asc
```
```bash
gpg --import public.gpg
```

### 8. Trust edit
Edit key:
```bash
gpg --edit-keys google@gmail.com
```

Action on key:
```bash
trust
```

Choose trust level:
```bash
5
```

Choose trust level:
```bash
save
```
