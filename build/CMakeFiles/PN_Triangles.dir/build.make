# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data/Workspace/openGL-Tessellation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data/Workspace/openGL-Tessellation/build

# Include any dependencies generated for this target.
include CMakeFiles/PN_Triangles.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/PN_Triangles.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/PN_Triangles.dir/flags.make

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o: CMakeFiles/PN_Triangles.dir/flags.make
CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o: ../PN_Triangles/pn_triangles.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/Workspace/openGL-Tessellation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o -c /data/Workspace/openGL-Tessellation/PN_Triangles/pn_triangles.cpp

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/Workspace/openGL-Tessellation/PN_Triangles/pn_triangles.cpp > CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.i

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/Workspace/openGL-Tessellation/PN_Triangles/pn_triangles.cpp -o CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.s

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.requires:

.PHONY : CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.requires

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.provides: CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.requires
	$(MAKE) -f CMakeFiles/PN_Triangles.dir/build.make CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.provides.build
.PHONY : CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.provides

CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.provides.build: CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o


CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o: CMakeFiles/PN_Triangles.dir/flags.make
CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o: ../common/objloader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/Workspace/openGL-Tessellation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o -c /data/Workspace/openGL-Tessellation/common/objloader.cpp

CMakeFiles/PN_Triangles.dir/common/objloader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PN_Triangles.dir/common/objloader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/Workspace/openGL-Tessellation/common/objloader.cpp > CMakeFiles/PN_Triangles.dir/common/objloader.cpp.i

CMakeFiles/PN_Triangles.dir/common/objloader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PN_Triangles.dir/common/objloader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/Workspace/openGL-Tessellation/common/objloader.cpp -o CMakeFiles/PN_Triangles.dir/common/objloader.cpp.s

CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.requires:

.PHONY : CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.requires

CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.provides: CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.requires
	$(MAKE) -f CMakeFiles/PN_Triangles.dir/build.make CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.provides.build
.PHONY : CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.provides

CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.provides.build: CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o


CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o: CMakeFiles/PN_Triangles.dir/flags.make
CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o: ../common/vboindexer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/Workspace/openGL-Tessellation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o -c /data/Workspace/openGL-Tessellation/common/vboindexer.cpp

CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/Workspace/openGL-Tessellation/common/vboindexer.cpp > CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.i

CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/Workspace/openGL-Tessellation/common/vboindexer.cpp -o CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.s

CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.requires:

.PHONY : CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.requires

CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.provides: CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.requires
	$(MAKE) -f CMakeFiles/PN_Triangles.dir/build.make CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.provides.build
.PHONY : CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.provides

CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.provides.build: CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o


CMakeFiles/PN_Triangles.dir/common/shader.cpp.o: CMakeFiles/PN_Triangles.dir/flags.make
CMakeFiles/PN_Triangles.dir/common/shader.cpp.o: ../common/shader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data/Workspace/openGL-Tessellation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/PN_Triangles.dir/common/shader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PN_Triangles.dir/common/shader.cpp.o -c /data/Workspace/openGL-Tessellation/common/shader.cpp

CMakeFiles/PN_Triangles.dir/common/shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PN_Triangles.dir/common/shader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data/Workspace/openGL-Tessellation/common/shader.cpp > CMakeFiles/PN_Triangles.dir/common/shader.cpp.i

CMakeFiles/PN_Triangles.dir/common/shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PN_Triangles.dir/common/shader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data/Workspace/openGL-Tessellation/common/shader.cpp -o CMakeFiles/PN_Triangles.dir/common/shader.cpp.s

CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.requires:

.PHONY : CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.requires

CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.provides: CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.requires
	$(MAKE) -f CMakeFiles/PN_Triangles.dir/build.make CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.provides.build
.PHONY : CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.provides

CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.provides.build: CMakeFiles/PN_Triangles.dir/common/shader.cpp.o


# Object files for target PN_Triangles
PN_Triangles_OBJECTS = \
"CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o" \
"CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o" \
"CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o" \
"CMakeFiles/PN_Triangles.dir/common/shader.cpp.o"

# External object files for target PN_Triangles
PN_Triangles_EXTERNAL_OBJECTS =

PN_Triangles: CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o
PN_Triangles: CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o
PN_Triangles: CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o
PN_Triangles: CMakeFiles/PN_Triangles.dir/common/shader.cpp.o
PN_Triangles: CMakeFiles/PN_Triangles.dir/build.make
PN_Triangles: /usr/lib/x86_64-linux-gnu/libGLU.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libGL.so
PN_Triangles: external/glfw-3.1.2/src/libglfw3.a
PN_Triangles: external/libGLEW_1130.a
PN_Triangles: /usr/lib/x86_64-linux-gnu/libGLU.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/librt.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libm.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libX11.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXrandr.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXinerama.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXi.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXcursor.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/librt.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libm.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libX11.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXrandr.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXinerama.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXi.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libXcursor.so
PN_Triangles: /usr/lib/x86_64-linux-gnu/libGL.so
PN_Triangles: CMakeFiles/PN_Triangles.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data/Workspace/openGL-Tessellation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable PN_Triangles"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PN_Triangles.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/PN_Triangles.dir/build: PN_Triangles

.PHONY : CMakeFiles/PN_Triangles.dir/build

CMakeFiles/PN_Triangles.dir/requires: CMakeFiles/PN_Triangles.dir/PN_Triangles/pn_triangles.cpp.o.requires
CMakeFiles/PN_Triangles.dir/requires: CMakeFiles/PN_Triangles.dir/common/objloader.cpp.o.requires
CMakeFiles/PN_Triangles.dir/requires: CMakeFiles/PN_Triangles.dir/common/vboindexer.cpp.o.requires
CMakeFiles/PN_Triangles.dir/requires: CMakeFiles/PN_Triangles.dir/common/shader.cpp.o.requires

.PHONY : CMakeFiles/PN_Triangles.dir/requires

CMakeFiles/PN_Triangles.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/PN_Triangles.dir/cmake_clean.cmake
.PHONY : CMakeFiles/PN_Triangles.dir/clean

CMakeFiles/PN_Triangles.dir/depend:
	cd /data/Workspace/openGL-Tessellation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data/Workspace/openGL-Tessellation /data/Workspace/openGL-Tessellation /data/Workspace/openGL-Tessellation/build /data/Workspace/openGL-Tessellation/build /data/Workspace/openGL-Tessellation/build/CMakeFiles/PN_Triangles.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/PN_Triangles.dir/depend

