# Install script for directory: /home/otis/Documents/flutter/Protein-Tracker/linux

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/nix/store/q87df3dw0x7r1k9gagir9a5sdi3gmw4a-clang-wrapper-19.1.7/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri"
         RPATH "$ORIGIN/lib")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle" TYPE EXECUTABLE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/intermediates_do_not_run/EzNutri")
  if(EXISTS "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri"
         OLD_RPATH "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/dynamic_color:/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/gtk:/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/url_launcher_linux:/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral:/nix/store/s6sg70v6kkwmgkd6nv0rjr5kr28m9777-gtk+3-3.24.48/lib:/nix/store/hz9k2haspya13z61v5y5566xa1scv9lr-pango-1.56.1/lib:/nix/store/a8105kj1z98ycyq6ki16ccav5fkvjf6f-harfbuzz-10.2.0/lib:/nix/store/3h9a7n84x8nwb0lzfvgqakdcfhhm0ll1-at-spi2-core-2.54.1/lib:/nix/store/gqaawaddz6q8z56w31vq7qr2ywmb40dq-cairo-1.18.2/lib:/nix/store/51l1cplskpyg7zwqmh7f4ha8jcpsqisj-gdk-pixbuf-2.42.12/lib:/nix/store/vi9n40g3814x3f7sqnc3jvmrhr4n3ij9-glib-2.82.5/lib:"
         NEW_RPATH "$ORIGIN/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/nix/store/q87df3dw0x7r1k9gagir9a5sdi3gmw4a-clang-wrapper-19.1.7/bin/strip" "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/EzNutri")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/data/icudtl.dat")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/data" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral/icudtl.dat")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib/libflutter_linux_gtk.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral/libflutter_linux_gtk.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib/libdynamic_color_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/dynamic_color/libdynamic_color_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib/libgtk_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/gtk/libgtk_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib/liburl_launcher_linux_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/url_launcher_linux/liburl_launcher_linux_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/lib" TYPE DIRECTORY FILES "/home/otis/Documents/flutter/Protein-Tracker/build/native_assets/linux/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/data/flutter_assets")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/data/flutter_assets")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/bundle/data" TYPE DIRECTORY FILES "/home/otis/Documents/flutter/Protein-Tracker/build//flutter_assets")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/flutter/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/dynamic_color/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/gtk/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/plugins/url_launcher_linux/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/debug/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
