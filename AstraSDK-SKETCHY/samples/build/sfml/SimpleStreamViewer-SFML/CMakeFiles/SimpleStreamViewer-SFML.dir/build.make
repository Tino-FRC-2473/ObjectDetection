# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.8.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.8.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build

# Include any dependencies generated for this target.
include sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/depend.make

# Include the progress variables for this target.
include sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/progress.make

# Include the compile flags for this target's objects.
include sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/flags.make

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/flags.make
sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o: ../sfml/SimpleStreamViewer-SFML/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o"
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o -c /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/sfml/SimpleStreamViewer-SFML/main.cpp

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.i"
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/sfml/SimpleStreamViewer-SFML/main.cpp > CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.i

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.s"
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/sfml/SimpleStreamViewer-SFML/main.cpp -o CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.s

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.requires:

.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.requires

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.provides: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.requires
	$(MAKE) -f sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/build.make sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.provides.build
.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.provides

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.provides.build: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o


# Object files for target SimpleStreamViewer-SFML
SimpleStreamViewer__SFML_OBJECTS = \
"CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o"

# External object files for target SimpleStreamViewer-SFML
SimpleStreamViewer__SFML_EXTERNAL_OBJECTS =

bin/SimpleStreamViewer-SFML: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o
bin/SimpleStreamViewer-SFML: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/build.make
bin/SimpleStreamViewer-SFML: /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/lib/libastra_core.dylib
bin/SimpleStreamViewer-SFML: /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/lib/libastra_core_api.dylib
bin/SimpleStreamViewer-SFML: /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/lib/libastra.dylib
bin/SimpleStreamViewer-SFML: ../thirdparty/sfml-2.3.2-min/lib/libsfml-graphics.dylib
bin/SimpleStreamViewer-SFML: ../thirdparty/sfml-2.3.2-min/lib/libsfml-window.dylib
bin/SimpleStreamViewer-SFML: ../thirdparty/sfml-2.3.2-min/lib/libsfml-system.dylib
bin/SimpleStreamViewer-SFML: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/SimpleStreamViewer-SFML"
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SimpleStreamViewer-SFML.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/build: bin/SimpleStreamViewer-SFML

.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/build

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/requires: sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/main.cpp.o.requires

.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/requires

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/clean:
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML && $(CMAKE_COMMAND) -P CMakeFiles/SimpleStreamViewer-SFML.dir/cmake_clean.cmake
.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/clean

sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/depend:
	cd /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/sfml/SimpleStreamViewer-SFML /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML /Users/work/Desktop/AstraSDK-0.5.0-20160426T102621Z-darwin-x64/samples/build/sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sfml/SimpleStreamViewer-SFML/CMakeFiles/SimpleStreamViewer-SFML.dir/depend

