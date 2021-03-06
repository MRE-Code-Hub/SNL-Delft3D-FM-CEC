2017-01-25
----------

This folder contains source files of Proj4 C library (release 4.9.3), downloaded from https://github.com/OSGeo/proj.4/releases/tag/4.9.3
For license info see file called "COPYING".
The folder src/ also contains Visual Studio 2012 project files for this Proj4 C library, which were made with CMake, using the following steps on Windows:

1. Download zip file with source code of Proj4 release 4.9.3 from https://github.com/OSGeo/proj.4/releases/tag/4.9.3 and unpack to a folder called proj4
2. Run command in folder proj4 :
    cmake -G "Visual Studio 11 2012 Win64" .\
3. From folder proj4 remove all subfolders, except:
    proj4/src
4. From folders proj4 and proj4/src remove all files generated by CMake, except:
    proj4/src/proj.vcxproj
    proj4/src/proj.vcxproj.filters
    proj4/src/proj_config.h
5. From folder proj4 remove files:
    CMakeLists.txt
    .gitignore
6. From folder proj4\src remove files:
    CMakeLists.txt
    *.cmake
7. Open project proj.vcxproj in Visual Studio 2012 and:
   - remove project reference to project ZERO_CHECK.
   - remove custom build tool item "CMakeLists.txt".
   - remove filter "CMake Files".
   - in configuration manager for project proj remove configurations MinSizeRel and RelWithDebInfo.
   - in configuration manager for project proj add new platform Win32 by copying settings from x64.
   - in project properties for project proj for all configurations and Win32 platform, in "Librarian -> All Options -> Additional Options" change "x64" to "x86".
   - in project properties for project proj for all configurations and all platforms, make "General -> Output Directory" and "General -> Intermediate Directory" unique for each combination of configuration and platform.
   - exit Visual Studio and save changes.
8. Remove files:
    proj4/src/proj.sln
    proj4/src/proj.sdf
    proj4/src/proj.v11.suo
    proj4/src/proj.vcxproj.user
9. With a text editor open files proj.vcxproj and proj.vcxproj.filters and make all paths in each file relative to the file itself.
