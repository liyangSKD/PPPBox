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
CMAKE_COMMAND = /sw/bin/cmake

# The command to remove a file.
RM = /sw/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /sw/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shjzhang/Documents/Develop/rocket/pppbox

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shjzhang/Documents/Develop/rocket/pppbox/build

# Include any dependencies generated for this target.
include apps/clocktools/CMakeFiles/nallandev.dir/depend.make

# Include the progress variables for this target.
include apps/clocktools/CMakeFiles/nallandev.dir/progress.make

# Include the compile flags for this target's objects.
include apps/clocktools/CMakeFiles/nallandev.dir/flags.make

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o: apps/clocktools/CMakeFiles/nallandev.dir/flags.make
apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o: ../apps/clocktools/nallandev.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/rocket/pppbox/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/nallandev.dir/nallandev.cpp.o -c /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/clocktools/nallandev.cpp

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nallandev.dir/nallandev.cpp.i"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/clocktools/nallandev.cpp > CMakeFiles/nallandev.dir/nallandev.cpp.i

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nallandev.dir/nallandev.cpp.s"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/clocktools/nallandev.cpp -o CMakeFiles/nallandev.dir/nallandev.cpp.s

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.requires:
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.requires

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.provides: apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.requires
	$(MAKE) -f apps/clocktools/CMakeFiles/nallandev.dir/build.make apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.provides.build
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.provides

apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.provides.build: apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o

# Object files for target nallandev
nallandev_OBJECTS = \
"CMakeFiles/nallandev.dir/nallandev.cpp.o"

# External object files for target nallandev
nallandev_EXTERNAL_OBJECTS =

apps/clocktools/nallandev: apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o
apps/clocktools/nallandev: apps/clocktools/CMakeFiles/nallandev.dir/build.make
apps/clocktools/nallandev: libpppbox.dylib
apps/clocktools/nallandev: apps/clocktools/CMakeFiles/nallandev.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable nallandev"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nallandev.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/clocktools/CMakeFiles/nallandev.dir/build: apps/clocktools/nallandev
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/build

apps/clocktools/CMakeFiles/nallandev.dir/requires: apps/clocktools/CMakeFiles/nallandev.dir/nallandev.cpp.o.requires
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/requires

apps/clocktools/CMakeFiles/nallandev.dir/clean:
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools && $(CMAKE_COMMAND) -P CMakeFiles/nallandev.dir/cmake_clean.cmake
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/clean

apps/clocktools/CMakeFiles/nallandev.dir/depend:
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/rocket/pppbox /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/clocktools /Users/shjzhang/Documents/Develop/rocket/pppbox/build /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/clocktools/CMakeFiles/nallandev.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/clocktools/CMakeFiles/nallandev.dir/depend
