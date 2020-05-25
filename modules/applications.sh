#!/bin/bash

configure_python() {
    echo "Setting up pyenv"
    pyenv init -
    
    echo "Installing python 3.7.3 globally."
    pyenv install 3.7.3
    pyenv global 3.7.3

    echo "Installing poetry"
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

    echo "Install pip packages"
    PIP="pipenv ipython pandas numpy sklearn" 
    pip install --upgrade pip
    pip install $PIP
}

configure_r(){
    R -e 'install.packages(c("parallel","dpyr","ggplot2","data.table","devtools","forecast","caret","shiny","zoo","ISOweek","Rcpp","testthat"), repos="http://cran.rstudio.com")'
}

install_base() {
    echo "Installing: unix sanity"
    SANITY="vim wget curl tree pstree make git openssl telnet"
    brew install $SANITY

    echo "Installing: python"
    PYTHON="python pyenv xz zlib pyenv-virtualenv"
    brew install $PYTHON
    configure_python
    
    echo "Installing: R"
    brew install r
    brew cask install rstudio
    configure_r

    echo "Installing: other languages"
    LANGUAGES="go node ruby octave"
    brew install $LANGUAGES
    brew cask install java
    
    echo "Installing: kubernetes"
    KUBERNETES="kubernetes-cli kubectx kustomize"
    brew install $KUBERNETES

    echo "Installing: dev-helpers"
    DEVHELPERS="httpie yamllint jq parquet-tools gpg"
    brew install $DEVHELPERS

    echo "Installing: azure"
    AZURE="git-crypt azure-cli"
    brew install $AZURE

    echo "Installing: DS tools"
    DSTOOLS="jupyter apache-spark"
    brew cask install homebrew/cask-versions/adoptopenjdk8 #java8 needed for spark
    brew install $DSTOOLS
    pip install jupyter-contrib-nbextensions
}

install_apps() {
    echo "Installing: base apps"
    BASE_APPS="google-chrome spectacle slack visual-studio-code iterm2 evernote"
    brew cask install $BASE_APPS

    echo "Installing: docker edge"
    brew tap homebrew/cask-versions
    brew cask install docker-edge

    echo "Installing: corporate"
    CORPORATE="microsoft-office jetbrains-toolbox keybase microsoft-azure-storage-explorer dbeaver-community"
    brew cask install $CORPORATE
}
