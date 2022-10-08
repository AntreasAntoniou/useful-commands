https://askubuntu.com/questions/13065/how-do-i-fix-the-gpg-error-no-pubkey

Execute the following commands in terminal

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <PUBKEY>
where <PUBKEY> is your missing public key for repository, e.g. 8BAF9A6F.

Then update

sudo apt-get update
ALTERNATE METHOD:

sudo gpg --keyserver pgpkeys.mit.edu --recv-key  <PUBKEY>
sudo gpg -a --export <PUBKEY> | sudo apt-key add -
sudo apt-get update
Note that when you import a key like this using apt-key you are telling the system that you trust the key you're importing to sign software your system will be using. Do not do this unless you're sure the key is really the key of the package distributor.
