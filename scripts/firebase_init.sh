#!/bin/bash

# cd $PROJECT_PATH

dart pub global activate flutterfire_cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
flutterfire configure