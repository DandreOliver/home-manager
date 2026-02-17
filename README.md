🟢 Manual Bootstrap Guide — WSL + Nix + Home Manager

Repo: https://github.com/DandreOliver/home-manager

1️⃣ Install WSL + Ubuntu

Open PowerShell as Administrator.

Install WSL + Ubuntu:

wsl --install -d Ubuntu


Reboot if prompted.

Open Ubuntu for the first time and create your WSL username and password.

2️⃣ Install Nix

In the Ubuntu terminal:

sh <(curl -L https://nixos.org/nix/install) --no-daemon


Load Nix in your current shell:

source $HOME/.nix-profile/etc/profile.d/nix.sh


Verify:

nix --version

3️⃣ Install Home Manager (Flakes)

Add Home Manager flake:

nix flake add github:nix-community/home-manager


Update flake inputs (if you ever need to):

nix flake update

4️⃣ Clone your Home Manager repo
git clone https://github.com/DandreOliver/home-manager ~/.config/home-manager


Your repo structure should look like:

home-manager/
├─ bash/
│  ├─ aliases.sh
│  ├─ functions.sh
│  └─ starship.sh
├─ conf/
│  └─ starship.toml
├─ ani-cli.nix
├─ bash.nix
├─ home.nix
├─ flake.nix
├─ programs.nix
├─ ...

5️⃣ Apply your Home Manager configuration

Enter your repo:

cd ~/.config/home-manager


Switch configuration using flakes (auto-detect username):

home-manager switch --flake .#$(whoami)


This applies all your .nix files, configs, and xdg.configFiles.

6️⃣ Source Bash modules

Your bash runtime scripts are in bash/:

BASH_DIR="$HOME/.config/home-manager/bash"
for file in "$BASH_DIR"/*.sh; do
    [ -r "$file" ] && source "$file"
done


This will load:

aliases.sh → aliases

functions.sh → shell functions

starship.sh → Starship prompt initialization

7️⃣ Starship prompt

Home Manager will place your conf/starship.toml automatically using:

xdg.configFile."starship.toml".source = ./conf/starship.toml;


No manual action needed — your prompt should now work automatically.

8️⃣ Updating everything in the future
cd ~/.config/home-manager
nix flake update
home-manager switch --flake .#$(whoami)
source ~/.config/home-manager/bash/*.sh


Keeps your Home Manager, flake inputs, aliases, functions, and prompt fully up to date.
