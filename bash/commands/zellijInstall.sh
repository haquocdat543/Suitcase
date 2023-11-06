#!/bin/bash
curl -L -o zellij.tar.gz https://github.com/zellij-org/zellij/releases/download/v0.38.2/zellij-x86_64-unknown-linux-musl.tar.gz
tar xzvf zellij.tar.gz zellij
mv ./zellij /usr/local/bin/zellij
rm zellij.tar.gz
