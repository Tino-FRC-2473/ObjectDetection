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
CMAKE_SOURCE_DIR = /Users/work/Desktop/AstraSDK-SKETCHY/samples

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/work/Desktop/AstraSDK-SKETCHY/samples/build

# Include any dependencies generated for this target.
include tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/depend.make

# Include the progress variables for this target.
include tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/progress.make

# Include the compile flags for this target's objects.
include tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/flags.make

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/flags.make
tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o: ../tools/DebugHandViewer/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/work/Desktop/AstraSDK-SKETCHY/samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o"
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DebugHandViewer.dir/main.cpp.o -c /Users/work/Desktop/AstraSDK-SKETCHY/samples/tools/DebugHandViewer/main.cpp

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DebugHandViewer.dir/main.cpp.i"
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/work/Desktop/AstraSDK-SKETCHY/samples/tools/DebugHandViewer/main.cpp > CMakeFiles/DebugHandViewer.dir/main.cpp.i

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DebugHandViewer.dir/main.cpp.s"
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/work/Desktop/AstraSDK-SKETCHY/samples/tools/DebugHandViewer/main.cpp -o CMakeFiles/DebugHandViewer.dir/main.cpp.s

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.requires:

.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.requires

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.provides: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.requires
	$(MAKE) -f tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/build.make tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.provides.build
.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.provides

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.provides.build: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o


# Object files for target DebugHandViewer
DebugHandViewer_OBJECTS = \
"CMakeFiles/DebugHandViewer.dir/main.cpp.o"

# External object files for target DebugHandViewer
DebugHandViewer_EXTERNAL_OBJECTS =

bin/DebugHandViewer: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o
bin/DebugHandViewer: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/build.make
bin/DebugHandViewer: /Users/work/Desktop/AstraSDK-SKETCHY/lib/libastra_core.dylib
bin/DebugHandViewer: /Users/work/Desktop/AstraSDK-SKETCHY/lib/libastra_core_api.dylib
bin/DebugHandViewer: /Users/work/Desktop/AstraSDK-SKETCHY/lib/libastra.dylib
bin/DebugHandViewer: ../thirdparty/sfml-2.3.2-min/lib/libsfml-graphics.dylib
bin/DebugHandViewer: ../thirdparty/sfml-2.3.2-min/lib/libsfml-window.dylib
bin/DebugHandViewer: ../thirdparty/sfml-2.3.2-min/lib/libsfml-system.dylib
bin/DebugHandViewer: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/work/Desktop/AstraSDK-SKETCHY/samples/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/DebugHandViewer"
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DebugHandViewer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/build: bin/DebugHandViewer

.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/build

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/requires: tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/main.cpp.o.requires

.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/requires

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/clean:
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer && $(CMAKE_COMMAND) -P CMakeFiles/DebugHandViewer.dir/cmake_clean.cmake
.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/clean

tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/depend:
	cd /Users/work/Desktop/AstraSDK-SKETCHY/samples/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/work/Desktop/AstraSDK-SKETCHY/samples /Users/work/Desktop/AstraSDK-SKETCHY/samples/tools/DebugHandViewer /Users/work/Desktop/AstraSDK-SKETCHY/samples/build /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer /Users/work/Desktop/AstraSDK-SKETCHY/samples/build/tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/DebugHandViewer/CMakeFiles/DebugHandViewer.dir/depend

