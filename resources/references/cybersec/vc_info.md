# VERACRYPT INFORMATION

* **INFO:**
  * [arcanecode](https://github.com/arcanecode/VeraCrypt-CommandLine-Examples)
  * [arcanecode GNU/Linux](https://github.com/arcanecode/VeraCrypt-CommandLine-Examples/tree/main/Linux)
  * [arcanecode Windows](https://github.com/arcanecode/VeraCrypt-CommandLine-Examples/tree/main/Windows)
  * [arcanecode MacOS](https://github.com/arcanecode/VeraCrypt-CommandLine-Examples/tree/main/macOS)

## CASCADING ENCRYPTION

* **INFO:** [VeraCrypt](https://veracrypt.io/en/Cascades.html)

```bash
------------------------------------------------------------------------
CASCADE OPTION          | ORDER OF ENCRYPTION             | KEY SIZES   |
------------------------------------------------------------------------|
* AES-Twofish           | Twofish --> AES                 | 256-bit each|
* AES-Twofish-Serpent   | Serpent --> Twofish --> AES     | 256-bit each|
* Serpent-AES           | AES --> Serpent                 | 256-bit each| 
* Serpent-Twofish-AES   | AES --> Twofish --> Serpent     | 256-bit each|
* Twofish-Serpent       | Serpent --> Twofish             | 256-bit each|
* Twofish-AES           | AES --> Twofish                 | 256-bit each|
------------------------------------------------------------------------
```

* Much 'stronger': AES-Twofish-Serpent
* Security over speed: Serpent-Twofish-AES

## ENCRYPT FILE

```bash
 decrypt in GNU/Linux: 'cryptsetup'
veracrypt --text \
    --create vc/vc_bak01.hc \
    --size 500M \
    --encryption AES \
    --hash sha-512 \
    --filesystem exfat \
    --volume-type normal \
    --pim 0 \
    --keyfiles= \
    --random-source randomdata.txt

# --password "hahahahaLOL"
# --encryption AES-Twofish-Serpent
```

## MOUNT VOLUME

* Execute 'sudo mkdir /media/[example_name]

1. sudo veracrypt --text \
    --mount [file].vc /mnt \
    --pim=0 \
    --keyfiles= \
    --verbose \
    --protect-hiddne no (if it's not hidden)

## DISMOUNT VOLUME

1. sudo veracrypt --text --dismount --slot 1
2. sudo veracrypt --text --dismount /mnt
3. sudo veracrypt --text --dismount vctest.vc
4. sudo veracrypt --text --dismount
