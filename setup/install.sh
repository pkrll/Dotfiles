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
	APP_NAME="${2:-$1}"
	COMMAND=$1
	
	mdfind "kMDItemKind == 'Application'" | grep -i $APP_NAME &> /dev/null
	if [ $? != 0 ]; then
		echo "Installing ${APP_NAME}"
		brew install --cask $COMMAND
	else
		echo "Skipping ${APP_NAME}..."
	fi
}

install_app_brew() {
	APP_NAME=$1
	
	if ! [ -x "$(command -v ${APP_NAME})" ]; then
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

set_up_deta() {
	if ! [ -x "$(command -v deta)" ]; then
		echo "Installing Deta..."
		curl -fsSL https://get.deta.dev/cli.sh | sh
	fi
}

function set_up_mas() {
	if ! [ -x "$(command -v mas)" ]; then
		echo "Installing MAS..."
		brew install mas
	fi	
}

set_up_mas

echo "Installing apps from Mac App Store..."

install_app 803453959 	# Slack
install_app 1532419400  # MeetingBar
install_app 1024640650  # CotEditor
install_app 1114196460  # RocketFuel
install_app 920404675	# Monodraw

echo "Installing apps via Homebrew..."

install_app_brew_cask "firefox"
install_app_brew_cask "zoom"
install_app_brew_cask "figma"
install_app_brew_cask "notion"
install_app_brew_cask "postman"
install_app_brew_cask "sublime-merge"
install_app_brew_cask "proxyman"

install_app_brew "nvm"
install_app_brew "mint"

set_up_nvm

echo "Installing automanually"

set_up_deta