#!/usr/bin/env ./tests/libs/bats/bin/bats

# bats will loop indefinitely with debug mode on (i.e. set -x)
unset debug

load '../../libs/bats-assert/load'
load '../../libs/bats-support/load'
load '../../libs/bats-file/load'

load '../../../bin/lib.sh'
load '../../bats-lib.sh'

# this E2E test can 
# - test MDM itself using a specified magento-cloud project (default: PMET-public/magento-cloud) on a specified branch (default: master)
# - test a magento-cloud repo on its current commit and the specified ref of MDM
# - test a change to a dependency of a magento-cloud project and/or MDM


setup() {
  post_magento_install_setup
  # get the most recently created app dir
  app_dir="$(ls -dtr "$HOME"/Downloads/*.app | tail -1 || :)"
  export apps_resources_dir="$app_dir/Contents/Resources"
  hostname1="34653.some-new.site.dev"
  hostname2="blah.testing.io"
  hostname3="reset.com"
}

@test 'dockerize_app of installed cloud env' {
  skip
  run "./$app_link_name" dockerize_app << RESPONSES
https://demo.magento.cloud/projects/vu7rf5gsjcj3w/environments/240-test
n
RESPONSES
  assert_success
  assert_output "success"
}

@test 'install_app of dockerized cloud env' {
  skip
  mdm_app_dir="$(get_most_recent_mdm_app)"
  run "$mdm_app_dir/Contents/Resources/script" install_app
  assert_success
  assert_output "success"
}

@test 'sync_app_to_remote' {
  skip
  "./$app_link_name" sync_app_to_remote << RESPONSES
https://demo.magento.cloud/projects/vu7rf5gsjcj3w/environments/240-test
n
RESPONSES
  run echo ""
  assert_success
  assert_output ""
}

@test 'sync_remote_to_app' {
  skip
  "./$app_link_name" sync_remote_to_app << RESPONSES
https://demo.magento.cloud/projects/vu7rf5gsjcj3w/environments/240-test
n
RESPONSES
  run echo ""
  assert_success
  assert_output ""
}