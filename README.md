This repository is a **work in progress**.

## CMake

You will need cmake to build SDL3. Compile it from source so you get the latest
version.

## Build SDL3

From the repository's root directory run the following:

    cd sdl
    mkdir build
    cd build
    cmake ..
    make

Now you have an SDL3 let's build an example.

## Building the project

To test everything compiles and works fine, run the following command:

    make

After running this command 3 new directories are created. The `bin` directory
contains the executable "game".

Run `make clean` to remove the generated directories and files.
