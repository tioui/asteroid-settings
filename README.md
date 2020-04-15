# Asteroid Settings
The settings app for [AsteroidOS](http://asteroidos.org/)

Modified from the original project by Louis Marchand 2020.

Installation
============

To install the language packs:

```bash
source /usr/local/oecore-x86_64/environment-setup-armv7vet2hf-neon-oe-linux-gnueabi
cd i18n
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/lrelease -idbased *.ts
scp *.qm root@192.168.2.15:/usr/share/translations/
```
