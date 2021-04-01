#!/bin/zsh

#  generate-docs.sh
#  RangeUISlider
#
#  Created by Fabrizio Duroni on 04.10.17.
#  2020 Fabrizio Duroni.

jazzy \
  --output docs \
  --module TabBarUIAction \
  --build-tool-arguments -project,TabBarUIAction.xcodeproj,-scheme,"TabBarUIAction",-arch,arm64 \
  --author_url https://www.fabrizioduroni.it \
  --github_url https://github.com/chicio/TabBarUIAction \
  --sdk iphoneos \
  --copyright "2021 [Fabrizio Duroni](https://www.fabrizioduroni.it)"
