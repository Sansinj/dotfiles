# Dotfiles

Basic setup

## Getting Started

You will need:

- Either Bash or Zsh 

## Installation / Setup

### First of all
```sh
sh run.sh
```

### Change iterm font
Set this font in iTerm2 (iTerm → Preferences → Profiles → Text → Font), in the dropdown select the desired Font (suggest Roboto Mono for Powerline).

### GPG key
- Generate a new key pair
```sh
gpg --full-generate-key
```
- Get your recently created GPG key
```sh
gpg --list-secret-keys --keyid-format=long

sec   rsa4096/<your-key-id> 2021-05-10 [SC] [expire : 2025-05-10]
      xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
uid                [ ultime ] Jonathan Chansin <jonathan.chansin@clinia.com>
ssb   rsa4096/xxxxxxxxxxxx 2021-05-10 [E] [expire : 2025-05-10]
```

- Three things to do with your key
1. Config git to use your gpg key
```
git config --global user.signingkey <your-key-id>
```
2. Upload your key to github
```
gpg --armor --export <your-key-id>
```
3. Add gpgkey to keybase
```
keybase pgp select --import --multi
```

### Docker
Docker can be downloaded here: https://hub.docker.com/editions/community/docker-ce-desktop-mac/

### AWS-cli
Create profile
```
aws-vault add <profile_name>

Enter Access Key Id: <acces_key> # Ask for credentials
Enter Secret Key: <secret_key>
```

Setup a role directly in the recently created file ~/.aws/config
```
[default]
region = ca-central-1

[profile jon.smith]
mfa_serial=arn:aws:iam::[account-id]:mfa/[your-iam-username]

[profile search]
source_profile=jon.smith
mfa_serial=arn:aws:iam::[account-id]:mfa/[your-iam-username]
role_arn=<arn:aws:iam::xxxx> # Ask for credentials
```

### Java & Jenv
```
# If .jdk can't be found in ~/Library/Java/JavaVirtualMachines/
sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk

jenv add /Library/Java/JavaVirtualMachines/<jdk_version>/Contents/Home/
```

### Gemfury
echo 'export GEMFURY_TOKEN=<token>' >> ~/.zshrc # Ask token

