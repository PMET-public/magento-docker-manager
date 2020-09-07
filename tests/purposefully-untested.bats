# this is a list of funcs/handlers that are currently intentionally untested
# the funcs may be not worth testing b/c of 
# - their simplicity 
# - they are tested indirectly by other funcs
# - the test would require re-implementing the func in an alt way

included_by_mdm
has_uncleared_jobs_statuses
is_magento_cloud_cli_installed
is_docker_bash_completion_installed
@test is_platypus_installed
@test is_mkcert_installed
@test is_tmate_installed
are_additional_tools_installed
can_optimize_vm_cpus
can_optimize_vm_mem
can_optimize_vm_swap
can_optimize_vm_disk
@test is_mac
@test is_CI
is_docker_compatible
is_docker_installed
is_docker_suboptimal
is_docker_running
is_docker_ready
is_onedrive_linked
is_detached
is_magento_app_installed
is_magento_app_running
is_pwa_module_installed
is_nginx_rev_proxy_running
is_network_state_ok
are_other_magento_apps_running
invoked_mdm_without_args
lib_sourced_for_specific_bundled_app
is_update_available
is_adobe_system
is_advanced_mode
is_existing_cloud_env
launched_from_mac_menu
is_running_as_sudo
is_mkcert_CA_installed
has_valid_composer_auth
seconds_since
get_docker_host_ip
print_containers_hosts_file_entry
print_local_hosts_file_entry
get_pwa_hostname
get_pwa_prev_hostname
export_pwa_hostnames
find_bridged_docker_networks
find_varnish_port_by_network
find_web_service_hostname_by_network
find_mdm_hostnames
find_hostnames_not_resolving_to_local
has_valid_wildcard_domain
read_cert_for_domain
cp_wildcard_mdm_domain_cert_and_key_for_subdomain
run_this_menu_item_handler_in_new_terminal_if_applicable
track_job_status_and_wait_for_exit
@test start_docker_service
stop_docker_service
restart_docker_and_wait
reload_rev_proxy
adjust_compose_project_name_for_docker_compose_version
get_compose_project_name
render_platypus_status_menu
handle_mdm_args
ensure_mdm_log_files_exist
run_bundled_app_as_script
init_app_specific_vars
init_mdm_logging
init_mac_quit_detection
download_mdm_config
self_uninstall
