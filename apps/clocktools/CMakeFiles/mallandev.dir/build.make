# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kemin/develop/PPPBOX

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kemin/develop/PPPBOX

# Include any dependencies generated for this target.
include apps/clocktools/CMakeFiles/mallandev.dir/depend.make

# Include the progress variables for this target.
include apps/clocktools/CMakeFiles/mallandev.dir/progress.make

# Include the compile flags for this target's objects.
include apps/clocktools/CMakeFiles/mallandev.dir/flags.make

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o: apps/clocktools/CMakeFiles/mallandev.dir/flags.make
apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o: apps/clocktools/mallandev.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kemin/develop/PPPBOX/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o"
	cd /home/kemin/develop/PPPBOX/apps/clocktools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mallandev.dir/mallandev.cpp.o -c /home/kemin/develop/PPPBOX/apps/clocktools/mallandev.cpp

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mallandev.dir/mallandev.cpp.i"
	cd /home/kemin/develop/PPPBOX/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kemin/develop/PPPBOX/apps/clocktools/mallandev.cpp > CMakeFiles/mallandev.dir/mallandev.cpp.i

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mallandev.dir/mallandev.cpp.s"
	cd /home/kemin/develop/PPPBOX/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kemin/develop/PPPBOX/apps/clocktools/mallandev.cpp -o CMakeFiles/mallandev.dir/mallandev.cpp.s

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.requires:
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.requires

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.provides: apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.requires
	$(MAKE) -f apps/clocktools/CMakeFiles/mallandev.dir/build.make apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.provides.build
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.provides

apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.provides.build: apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o

# Object files for target mallandev
mallandev_OBJECTS = \
"CMakeFiles/mallandev.dir/mallandev.cpp.o"

# External object files for target mallandev
mallandev_EXTERNAL_OBJECTS =

apps/clocktools/mallandev: apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o
apps/clocktools/mallandev: apps/clocktools/CMakeFiles/mallandev.dir/build.make
apps/clocktools/mallandev: libpppbox.so
apps/clocktools/mallandev: apps/clocktools/CMakeFiles/mallandev.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mallandev"
	cd /home/kemin/develop/PPPBOX/apps/clocktools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mallandev.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/clocktools/CMakeFiles/mallandev.dir/build: apps/clocktools/mallandev
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/build

apps/clocktools/CMakeFiles/mallandev.dir/requires: apps/clocktools/CMakeFiles/mallandev.dir/mallandev.cpp.o.requires
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/requires

apps/clocktools/CMakeFiles/mallandev.dir/clean:
	cd /home/kemin/develop/PPPBOX/apps/clocktools && $(CMAKE_COMMAND) -P CMakeFiles/mallandev.dir/cmake_clean.cmake
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/clean

apps/clocktools/CMakeFiles/mallandev.dir/depend:
	cd /home/kemin/develop/PPPBOX && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/clocktools /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/clocktools /home/kemin/develop/PPPBOX/apps/clocktools/CMakeFiles/mallandev.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/clocktools/CMakeFiles/mallandev.dir/depend
