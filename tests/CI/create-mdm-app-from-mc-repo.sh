#!/bin/bash

set -e
[[ $debug ]] && set -x

# shellcheck source=../../bin/lib.sh
source ./bin/lib.sh

if ! is_mac; then
  app_name="app-from-repo-test"
  ./bin/dockerize -g https://github.com/PMET-public/magento-cloud.git -b pmet-2.3.5-ref-github -n "$app_name"
  msg_w_newlines "$app_name successfully created."
  # find newly create app
  app_dir="$(find "$HOME/Downloads" -name "$app_name*.app" -type d)"
  app_dir="${app_dir#$HOME/Downloads/}"
  
  # invoke it emulating platypus app method
  run_bundled_app_as_script "$HOME/Downloads/$app_dir/Contents/Resources/script"
  run_bundled_app_as_script "$HOME/Downloads/$app_dir/Contents/Resources/script" install_app
  run_bundled_app_as_script "$HOME/Downloads/$app_dir/Contents/Resources/script" start_mdm_shell
  for (( index=0; index < 15; ((index++)) )); do
    echo "subprocesses: "; pgrep -aP $$
    export_compose_project_name
    export_compose_file
    docker ps
    docker-compose ps
    sleep 60
  done
else
  warning_w_newlines "Test skipped."
fi

exit 0
