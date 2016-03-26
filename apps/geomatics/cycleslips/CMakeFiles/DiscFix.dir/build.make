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
include apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/depend.make

# Include the progress variables for this target.
include apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/progress.make

# Include the compile flags for this target's objects.
include apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/flags.make

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/flags.make
apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o: apps/geomatics/cycleslips/DiscFix.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kemin/develop/PPPBOX/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o"
	cd /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DiscFix.dir/DiscFix.cpp.o -c /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips/DiscFix.cpp

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DiscFix.dir/DiscFix.cpp.i"
	cd /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips/DiscFix.cpp > CMakeFiles/DiscFix.dir/DiscFix.cpp.i

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DiscFix.dir/DiscFix.cpp.s"
	cd /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips/DiscFix.cpp -o CMakeFiles/DiscFix.dir/DiscFix.cpp.s

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.requires:
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.requires

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.provides: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.requires
	$(MAKE) -f apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/build.make apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.provides.build
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.provides

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.provides.build: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o

# Object files for target DiscFix
DiscFix_OBJECTS = \
"CMakeFiles/DiscFix.dir/DiscFix.cpp.o"

# External object files for target DiscFix
DiscFix_EXTERNAL_OBJECTS =

apps/geomatics/cycleslips/DiscFix: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o
apps/geomatics/cycleslips/DiscFix: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/build.make
apps/geomatics/cycleslips/DiscFix: libpppbox.so
apps/geomatics/cycleslips/DiscFix: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable DiscFix"
	cd /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DiscFix.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/build: apps/geomatics/cycleslips/DiscFix
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/build

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/requires: apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DiscFix.cpp.o.requires
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/requires

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/clean:
	cd /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips && $(CMAKE_COMMAND) -P CMakeFiles/DiscFix.dir/cmake_clean.cmake
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/clean

apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/depend:
	cd /home/kemin/develop/PPPBOX && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips /home/kemin/develop/PPPBOX/apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/geomatics/cycleslips/CMakeFiles/DiscFix.dir/depend

