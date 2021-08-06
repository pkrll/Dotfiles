#!/bin/bash

install_app() {
	APP_ID=$1
	APP_NAME=$(mas info $APP_ID | head -n 1)
	mas list | grep $APP_ID &> /dev/null
	
	if [ $? == 0 ]; then
		echo "Skipping ${APP_NAME}: Already installed."
	else
		if [ "$APP_NAME" = "No results found" ]; then
			echo "Error: Could not find an app with id: ${APP_ID}..."
		else
			mas install $APP_ID
		fi
	fi
}

install_app_brew_cask() {
	APP_NAME=$1
	
	mdfind "kMDItemKind == 'Application'" | grep  -i $APP_NAME &> /dev/null
	if [ $? != 0 ]; then
		echo "Installing ${APP_NAME}"
		brew install --cask $APP_NAME
	else
		echo "Skipping ${APP_NAME}..."
	fi
}

install_app_brew() {
	APP_NAME=$1
	
	if [ ! command -v $APP_NAME &> /dev/null ]; then
		echo "Installing ${APP_NAME}"
		brew install $APP_NAME
	else
		echo "Skipping ${APP_NAME}..."
	fi
}

set_up_nvm() {
	echo "Setting up nvm..."
	mkdir ~/.nvm
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh
	nvm install latest
	npm install -g npm@latest
}

if [ ! command -v mas &> /dev/null ]; then
	echo "Installing MAS..."
	brew install mas
fi

echo "Installing apps from Mac App Store..."

install_app 803453959 	# Slack
install_app 1278508951 	# Trello
install_app 1480068668 	# Messenger
install_app 747648890   # Telegram
install_app 1532419400  # MeetingBar
install_app 1024640650  # CotEditor
install_app 1114196460  # RocketFuel
install_app 920404675	# Monodraw

echo "Installing apps via Homebrew..."

install_app_brew_cask "google-chrome"
install_app_brew_cask "zoom"
install_app_brew_cask "figma"
install_app_brew_cask "nova"
install_app_brew_cask "hyper"

install_app_brew "nvm"
set_up_nvm

echo "Installing automanually"

curl -fsSL https://get.deta.dev/cli.sh | sh