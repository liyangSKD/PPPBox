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
include apps/DataAvailability/CMakeFiles/daa.dir/depend.make

# Include the progress variables for this target.
include apps/DataAvailability/CMakeFiles/daa.dir/progress.make

# Include the compile flags for this target's objects.
include apps/DataAvailability/CMakeFiles/daa.dir/flags.make

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o: apps/DataAvailability/CMakeFiles/daa.dir/flags.make
apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o: apps/DataAvailability/daa.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kemin/develop/PPPBOX/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/daa.dir/daa.cpp.o -c /home/kemin/develop/PPPBOX/apps/DataAvailability/daa.cpp

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/daa.dir/daa.cpp.i"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kemin/develop/PPPBOX/apps/DataAvailability/daa.cpp > CMakeFiles/daa.dir/daa.cpp.i

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/daa.dir/daa.cpp.s"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kemin/develop/PPPBOX/apps/DataAvailability/daa.cpp -o CMakeFiles/daa.dir/daa.cpp.s

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.requires:
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.requires

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.provides: apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.requires
	$(MAKE) -f apps/DataAvailability/CMakeFiles/daa.dir/build.make apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.provides.build
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.provides

apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.provides.build: apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o: apps/DataAvailability/CMakeFiles/daa.dir/flags.make
apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o: apps/DataAvailability/DataAvailabilityAnalyzer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/kemin/develop/PPPBOX/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o -c /home/kemin/develop/PPPBOX/apps/DataAvailability/DataAvailabilityAnalyzer.cpp

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.i"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/kemin/develop/PPPBOX/apps/DataAvailability/DataAvailabilityAnalyzer.cpp > CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.i

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.s"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/kemin/develop/PPPBOX/apps/DataAvailability/DataAvailabilityAnalyzer.cpp -o CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.s

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.requires:
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.requires

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.provides: apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.requires
	$(MAKE) -f apps/DataAvailability/CMakeFiles/daa.dir/build.make apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.provides.build
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.provides

apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.provides.build: apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o

# Object files for target daa
daa_OBJECTS = \
"CMakeFiles/daa.dir/daa.cpp.o" \
"CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o"

# External object files for target daa
daa_EXTERNAL_OBJECTS =

apps/DataAvailability/daa: apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o
apps/DataAvailability/daa: apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o
apps/DataAvailability/daa: apps/DataAvailability/CMakeFiles/daa.dir/build.make
apps/DataAvailability/daa: libpppbox.so
apps/DataAvailability/daa: apps/DataAvailability/CMakeFiles/daa.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable daa"
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/daa.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/DataAvailability/CMakeFiles/daa.dir/build: apps/DataAvailability/daa
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/build

apps/DataAvailability/CMakeFiles/daa.dir/requires: apps/DataAvailability/CMakeFiles/daa.dir/daa.cpp.o.requires
apps/DataAvailability/CMakeFiles/daa.dir/requires: apps/DataAvailability/CMakeFiles/daa.dir/DataAvailabilityAnalyzer.cpp.o.requires
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/requires

apps/DataAvailability/CMakeFiles/daa.dir/clean:
	cd /home/kemin/develop/PPPBOX/apps/DataAvailability && $(CMAKE_COMMAND) -P CMakeFiles/daa.dir/cmake_clean.cmake
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/clean

apps/DataAvailability/CMakeFiles/daa.dir/depend:
	cd /home/kemin/develop/PPPBOX && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/DataAvailability /home/kemin/develop/PPPBOX /home/kemin/develop/PPPBOX/apps/DataAvailability /home/kemin/develop/PPPBOX/apps/DataAvailability/CMakeFiles/daa.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/DataAvailability/CMakeFiles/daa.dir/depend

