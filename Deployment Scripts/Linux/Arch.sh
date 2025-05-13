#Setup Multilib
sudo sed -i -e '/#\[multilib\]/,+1s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm --needed


#Install yay
sudo pacman -S base-devel --noconfirm --needed
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si
rm -R /tmp/yay-bin

#Nvidia shit
sudo pacman -S nvidia-open-dkms nvidia-open nvidia-utils --noconfirm --needed
yay -S all-ways-egpu --answerclean Always --answerdiff None --removemake
#TODO automate all-ways-egpu method setup
#force it to pick amd igpu and nvidia egpu? idfk if anyone else is ever gonna use this shithole script who might want something else, fuck I hope not
#Recommended if using Method 1: Attempt to re-enable the iGPU/initially disabled devices after login? [y/N]: y
#Recommended if using Method 2: Attempt to set boot_vga flag at startup? [y/N]: y
#Recommended if using Method 3 on GNOME, KDE or Sway: Attempt to automatically set the specific variables for wlroots, Kwin and Mutter at startup? [y/N]: y

#Gaming and libraries
sudo pacman -S lib32-vulkan-radeon lib32-nvidia-utils steam --noconfirm --needed
yay -S aur/r2modman --answerclean Always --answerdiff None --removemake
sudo pacman -S prismlauncher piper --noconfirm --needed


#Other shit
sudo pacman -S obsidian vscode --noconfirm --needed
yay -S spotify pinta --answerclean Always --answerdiff None --removemake

#Linux shit
sudo pacman -S linux-headers --noconfirm --needed

#Tailscale
sudo pacman -S tailscale --noconfirm --needed
sudo systemctl enable --now tailscaled

#Social
#TODO make these sections optional or something
yay -S extra/telegram-desktop --answerclean Always --answerdiff None --removemake
sudo pacman -S discord --noconfirm --needed

#Post-Install
sudo tailscale up

echo "Attach egpu and run \`all-ways-egpu\` as root"
