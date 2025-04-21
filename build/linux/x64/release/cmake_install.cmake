# Install script for directory: /home/otis/Documents/flutter/Protein-Tracker/linux

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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
  set(CMAKE_OBJDUMP "/nix/store/32jfd5s845ys74nkzlgsh7cnq83y4lri-clang-wrapper-19.1.7/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri"
         RPATH "$ORIGIN/lib")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle" TYPE EXECUTABLE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/intermediates_do_not_run/EzNutri")
  if(EXISTS "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri"
         OLD_RPATH "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/dynamic_color:/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/gtk:/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/url_launcher_linux:/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral:/nix/store/3a9adsqp2manm80f0haaz45p35jmdmw5-gtk+3-3.24.49/lib:/nix/store/nrlr79x6l23d4ihvqxy40mq7785x4bpr-pango-1.56.2/lib:/nix/store/ydai0rg3rznqczwqfz45ax3i95wk6f1z-harfbuzz-10.2.0/lib:/nix/store/vwgglm7zd2qfpkgi03k2pkkgm4brj9lp-at-spi2-core-2.54.1/lib:/nix/store/h7h6ynbrxz9rmmrmqk1vxj8mcga14k2y-cairo-1.18.2/lib:/nix/store/rbhdvb09anyx1y1xrjid8flj8zsqbi8p-gdk-pixbuf-2.42.12/lib:/nix/store/yxyncg0y2b39kjgi4c52w74c4w1za7pg-glib-2.82.5/lib:"
         NEW_RPATH "$ORIGIN/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/nix/store/32jfd5s845ys74nkzlgsh7cnq83y4lri-clang-wrapper-19.1.7/bin/strip" "$ENV{DESTDIR}/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/EzNutri")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/data/icudtl.dat")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/data" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral/icudtl.dat")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/libflutter_linux_gtk.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/linux/flutter/ephemeral/libflutter_linux_gtk.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/libdynamic_color_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/dynamic_color/libdynamic_color_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/libgtk_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/gtk/libgtk_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/liburl_launcher_linux_plugin.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/url_launcher_linux/liburl_launcher_linux_plugin.so")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE DIRECTORY FILES "/home/otis/Documents/flutter/Protein-Tracker/build/native_assets/linux/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  
  file(REMOVE_RECURSE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/data/flutter_assets")
  
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/data/flutter_assets")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/data" TYPE DIRECTORY FILES "/home/otis/Documents/flutter/Protein-Tracker/build//flutter_assets")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib/libapp.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/bundle/lib" TYPE FILE FILES "/home/otis/Documents/flutter/Protein-Tracker/build/lib/libapp.so")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/flutter/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/dynamic_color/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/gtk/cmake_install.cmake")
  include("/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/plugins/url_launcher_linux/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/install_local_manifest.txt"
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
  file(WRITE "/home/otis/Documents/flutter/Protein-Tracker/build/linux/x64/release/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
