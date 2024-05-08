local M = {}

M.get = function(colors)
	return {
		-- CMake:
		cmakeCommand                            = { fg = colors.color1 },
		cmakeKWconfigure_package_config_file    = { fg = colors.color4, italic = true },
		cmakeKWwrite_basic_package_version_file = { fg = colors.color4, italic = true },
		cmakeKWExternalProject                  = { fg = colors.color2 },
		cmakeKWadd_compile_definitions          = { fg = colors.color2 },
		cmakeKWadd_compile_options              = { fg = colors.color2 },
		cmakeKWadd_custom_command               = { fg = colors.color2 },
		cmakeKWadd_custom_target                = { fg = colors.color2 },
		cmakeKWadd_definitions                  = { fg = colors.color2 },
		cmakeKWadd_dependencies                 = { fg = colors.color2 },
		cmakeKWadd_executable                   = { fg = colors.color2 },
		cmakeKWadd_library                      = { fg = colors.color2 },
		cmakeKWadd_link_options                 = { fg = colors.color2 },
		cmakeKWadd_subdirectory                 = { fg = colors.color2 },
		cmakeKWadd_test                         = { fg = colors.color2 },
		cmakeKWbuild_command                    = { fg = colors.color2 },
		cmakeKWcmake_host_system_information    = { fg = colors.color2 },
		cmakeKWcmake_minimum_required           = { fg = colors.color2 },
		cmakeKWcmake_parse_arguments            = { fg = colors.color2 },
		cmakeKWcmake_policy                     = { fg = colors.color2 },
		cmakeKWconfigure_file                   = { fg = colors.color2 },
		cmakeKWcreate_test_sourcelist           = { fg = colors.color2 },
		cmakeKWctest_build                      = { fg = colors.color2 },
		cmakeKWctest_configure                  = { fg = colors.color2 },
		cmakeKWctest_coverage                   = { fg = colors.color2 },
		cmakeKWctest_memcheck                   = { fg = colors.color2 },
		cmakeKWctest_run_script                 = { fg = colors.color2 },
		cmakeKWctest_start                      = { fg = colors.color2 },
		cmakeKWctest_submit                     = { fg = colors.color2 },
		cmakeKWctest_test                       = { fg = colors.color2 },
		cmakeKWctest_update                     = { fg = colors.color2 },
		cmakeKWctest_upload                     = { fg = colors.color2 },
		cmakeKWdefine_property                  = { fg = colors.color2 },
		cmakeKWdoxygen_add_docs                 = { fg = colors.color2 },
		cmakeKWenable_language                  = { fg = colors.color2 },
		cmakeKWenable_testing                   = { fg = colors.color2 },
		cmakeKWexec_program                     = { fg = colors.color2 },
		cmakeKWexecute_process                  = { fg = colors.color2 },
		cmakeKWexport                           = { fg = colors.color2 },
		cmakeKWexport_library_dependencies      = { fg = colors.color2 },
		cmakeKWfile                             = { fg = colors.color2 },
		cmakeKWfind_file                        = { fg = colors.color2 },
		cmakeKWfind_library                     = { fg = colors.color2 },
		cmakeKWfind_package                     = { fg = colors.color2 },
		cmakeKWfind_path                        = { fg = colors.color2 },
		cmakeKWfind_program                     = { fg = colors.color2 },
		cmakeKWfltk_wrap_ui                     = { fg = colors.color2 },
		cmakeKWforeach                          = { fg = colors.color2 },
		cmakeKWfunction                         = { fg = colors.color2 },
		cmakeKWget_cmake_property               = { fg = colors.color2 },
		cmakeKWget_directory_property           = { fg = colors.color2 },
		cmakeKWget_filename_component           = { fg = colors.color2 },
		cmakeKWget_property                     = { fg = colors.color2 },
		cmakeKWget_source_file_property         = { fg = colors.color2 },
		cmakeKWget_target_property              = { fg = colors.color2 },
		cmakeKWget_test_property                = { fg = colors.color2 },
		cmakeKWif                               = { fg = colors.colors2 },
		cmakeKWinclude                          = { fg = colors.colors2 },
		cmakeKWinclude_directories              = { fg = colors.colors2 },
		cmakeKWinclude_external_msproject       = { fg = colors.colors2 },
		cmakeKWinclude_guard                    = { fg = colors.colors2 },
		cmakeKWinstall                          = { fg = colors.colors2 },
		cmakeKWinstall_files                    = { fg = colors.colors2 },
		cmakeKWinstall_programs                 = { fg = colors.colors2 },
		cmakeKWinstall_targets                  = { fg = colors.colors2 },
		cmakeKWlink_directories                 = { fg = colors.colors2 },
		cmakeKWlist                             = { fg = colors.colors2 },
		cmakeKWload_cache                       = { fg = colors.colors2 },
		cmakeKWload_command                     = { fg = colors.colors2 },
		cmakeKWmacro                            = { fg = colors.colors2 },
		cmakeKWmark_as_advanced                 = { fg = colors.colors2 },
		cmakeKWmath                             = { fg = colors.colors2 },
		cmakeKWmessage                          = { fg = colors.colors2 },
		cmakeKWoption                           = { fg = colors.colors2 },
		cmakeKWproject                          = { fg = colors.colors2 },
		cmakeKWqt_wrap_cpp                      = { fg = colors.colors2 },
		cmakeKWqt_wrap_ui                       = { fg = colors.colors2 },
		cmakeKWremove                           = { fg = colors.colors2 },
		cmakeKWseparate_arguments               = { fg = colors.colors2 },
		cmakeKWset                              = { fg = colors.colors2 },
		cmakeKWset_directory_properties         = { fg = colors.colors2 },
		cmakeKWset_property                     = { fg = colors.colors2 },
		cmakeKWset_source_files_properties      = { fg = colors.colors2 },
		cmakeKWset_target_properties            = { fg = colors.colors2 },
		cmakeKWset_tests_properties             = { fg = colors.colors2 },
		cmakeKWsource_group                     = { fg = colors.colors2 },
		cmakeKWstring                           = { fg = colors.colors2 },
		cmakeKWsubdirs                          = { fg = colors.colors2 },
		cmakeKWtarget_compile_definitions       = { fg = colors.colors2 },
		cmakeKWtarget_compile_features          = { fg = colors.colors2 },
		cmakeKWtarget_compile_options           = { fg = colors.colors2 },
		cmakeKWtarget_include_directories       = { fg = colors.colors2 },
		cmakeKWtarget_link_directories          = { fg = colors.colors2 },
		cmakeKWtarget_link_libraries            = { fg = colors.colors2 },
		cmakeKWtarget_link_options              = { fg = colors.colors2 },
		cmakeKWtarget_precompile_headers        = { fg = colors.colors2 },
		cmakeKWtarget_sources                   = { fg = colors.colors2 },
		cmakeKWtry_compile                      = { fg = colors.colors2 },
		cmakeKWtry_run                          = { fg = colors.colors2 },
		cmakeKWunset                            = { fg = colors.colors2 },
		cmakeKWuse_mangled_mesa                 = { fg = colors.colors2 },
		cmakeKWvariable_requires                = { fg = colors.colors2 },
		cmakeKWvariable_watch                   = { fg = colors.colors2 },
	}
end

return M