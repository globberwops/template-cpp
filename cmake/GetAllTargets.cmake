include_guard()

# Function to get all targets in a directory and its subdirectories
function(GET_ALL_TARGETS _result _dir)
  # Initialize the result variable
  set(${_result})

  # Get the targets in the specified directory and its subdirectories
  get_directory_property(_targets DIRECTORY ${_dir} BUILDSYSTEM_TARGETS)
  get_directory_property(_subdirs DIRECTORY ${_dir} SUBDIRECTORIES)

  # Append the targets from the current directory
  list(APPEND ${_result} ${_targets})

  # Iterate over each subdirectory and append their targets
  foreach(_subdir IN LISTS _subdirs)
    get_directory_property(_subdir_targets DIRECTORY ${_subdir} BUILDSYSTEM_TARGETS)
    list(APPEND ${_result} ${_subdir_targets})
  endforeach()

  # Set the result variable in the parent scope
  set(${_result}
      ${${_result}}
      PARENT_SCOPE)
endfunction()
