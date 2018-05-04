sudo apt install git curl expect libssl-dev cmake golang vlc powertop tlp tlp-rdw putty vim -y
expect -c "
spawn sh -c \"curl https://sh.rustup.rs | sh\"
expect \"Cancel installation\"
send \"1\n\"
expect \"source $HOME/.cargo/env\"
exit 0
" 
echo "source $HOME/.cargo/env" >> ~/.bashrc

sudo apt remove -y $(apt list | grep libreoffice | grep "\[" | grep -oE "libreoffice-.*/" | tr -d "/")
sudo apt autoremove

git config --global user.name "ryota-sakamoto"
git config --global user.email "sakamo.ryota+github@gmail.com"
git config --global core.editor 'vi -c "set fenc=utf-8"'

LANG=C xdg-user-dirs-update --force
mv $HOME/デスクトップ $HOME/Desktop
mv $HOME/ダウンロード $HOME/Downloads
mv $HOME/テンプレート $HOME/Templates
mv $HOME/公開 $HOME/Share
mv $HOME/ドキュメント $HOME/Documents
mv $HOME/ミュージック $HOME/Music
mv $HOME/ピクチャ $HOME/Pictures
mv $HOME/ビデオ $HOME/Videos

sudo tlp start

curl -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -o /tmp/vscode.deb
dpkg -i /tmp/vscode.deb
rm -rf /tmp/vscode.deb

sudo shutdown -r now
