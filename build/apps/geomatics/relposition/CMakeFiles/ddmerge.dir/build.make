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
include apps/geomatics/relposition/CMakeFiles/ddmerge.dir/depend.make

# Include the progress variables for this target.
include apps/geomatics/relposition/CMakeFiles/ddmerge.dir/progress.make

# Include the compile flags for this target's objects.
include apps/geomatics/relposition/CMakeFiles/ddmerge.dir/flags.make

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/flags.make
apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o: ../apps/geomatics/relposition/ddmerge.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/shjzhang/Documents/Develop/rocket/pppbox/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/ddmerge.dir/ddmerge.cpp.o -c /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/geomatics/relposition/ddmerge.cpp

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ddmerge.dir/ddmerge.cpp.i"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/geomatics/relposition/ddmerge.cpp > CMakeFiles/ddmerge.dir/ddmerge.cpp.i

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ddmerge.dir/ddmerge.cpp.s"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/geomatics/relposition/ddmerge.cpp -o CMakeFiles/ddmerge.dir/ddmerge.cpp.s

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.requires:
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.requires

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.provides: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.requires
	$(MAKE) -f apps/geomatics/relposition/CMakeFiles/ddmerge.dir/build.make apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.provides.build
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.provides

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.provides.build: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o

# Object files for target ddmerge
ddmerge_OBJECTS = \
"CMakeFiles/ddmerge.dir/ddmerge.cpp.o"

# External object files for target ddmerge
ddmerge_EXTERNAL_OBJECTS =

apps/geomatics/relposition/ddmerge: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o
apps/geomatics/relposition/ddmerge: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/build.make
apps/geomatics/relposition/ddmerge: apps/geomatics/relposition/libbaselib.a
apps/geomatics/relposition/ddmerge: libpppbox.dylib
apps/geomatics/relposition/ddmerge: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ddmerge"
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ddmerge.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/geomatics/relposition/CMakeFiles/ddmerge.dir/build: apps/geomatics/relposition/ddmerge
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/build

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/requires: apps/geomatics/relposition/CMakeFiles/ddmerge.dir/ddmerge.cpp.o.requires
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/requires

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/clean:
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition && $(CMAKE_COMMAND) -P CMakeFiles/ddmerge.dir/cmake_clean.cmake
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/clean

apps/geomatics/relposition/CMakeFiles/ddmerge.dir/depend:
	cd /Users/shjzhang/Documents/Develop/rocket/pppbox/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shjzhang/Documents/Develop/rocket/pppbox /Users/shjzhang/Documents/Develop/rocket/pppbox/apps/geomatics/relposition /Users/shjzhang/Documents/Develop/rocket/pppbox/build /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition /Users/shjzhang/Documents/Develop/rocket/pppbox/build/apps/geomatics/relposition/CMakeFiles/ddmerge.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/geomatics/relposition/CMakeFiles/ddmerge.dir/depend
