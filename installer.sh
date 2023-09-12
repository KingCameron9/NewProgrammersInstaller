#!/bin/zsh

function 1418-utils() {
    if [[ $1 == "install" ]]; then
        if [[ $2 == "base" ]]; then
            cd || exit;
            xcode-select --install
            #install required xcode utils
            #install local homebrew
            mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
            #add to path
            echo export PATH=$PATH:'homebrew/bin'  >> ~/.zshrc; source ~/.zshrc
            #make checks
            brew doctor
        fi

        if [[ $2 == "jekyll" ]]; then
            brew install chruby ruby-install xz
            ruby-install ruby 3.1.3
            echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
            echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
            echo "chruby ruby-3.1.3" >> ~/.zshrc # run 'chruby' to see actual version
            source ~/.zshrc
            gem install jekyll
            gem install bundler
            bundle install
        fi

        if [[ $2 == "vscode"]]; then
            curl -L https://github.com/wpilibsuite/allwpilib/releases/download/v2023.4.3/WPILib_macOS-Arm64-2023.4.3.dmg -o ~/Desktop/WPILib.dmg
            open ~/Desktop/WPILib.dmg
        fi



    fi
}
