#Setup Multilib
sudo sed -i -e '/#\[multilib\]/,+1s/^#//' /etc/pacman.conf
pacman -Syu


#Install yay
sudo pacman -S base-devel
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si
rm -R /tmp/yay-bin

#Nvidia shit
sudo pacman -S nvidia-open-dkms nvidia-open nvidia-utils
yay -S all-ways-egpu --answerclean Always --answerdiff None
sudo all-ways-egpu
#TODO automate all-ways-egpu method setup
#force it to pick amd igpu and nvidia egpu? idfk if anyone else is ever gonna use this shithole script who might want something else, fuck I hope not
#Recommended if using Method 1: Attempt to re-enable the iGPU/initially disabled devices after login? [y/N]: y
#Recommended if using Method 2: Attempt to set boot_vga flag at startup? [y/N]: y
#Recommended if using Method 3 on GNOME, KDE or Sway: Attempt to automatically set the specific variables for wlroots, Kwin and Mutter at startup? [y/N]: y

#Gaming and libraries
sudo pacman -S lib32-vulkan-radeon lib32-nvidia-utils steam
yay aur/r2modman
sudo pacman -S prismlauncher piper


#Other shit
sudo pacman -S obsidian vscode
yay -S spotify pinta

#Linux shit
sudo pacman -S linux-headers

#Tailscale
sudo pacman -S tailscale
sudo systemctl enable tailscaled

#Social
#TODO make these sections optional or something
yay -S extra/telegram-desktop
sudo pacman -S discord

#Post-Install
sudo tailscale up
