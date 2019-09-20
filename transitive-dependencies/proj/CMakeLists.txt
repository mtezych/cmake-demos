
#
# MIT License
#
# Copyright (c) 2019 Mateusz Zych
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice
# shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS",
# WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

cmake_minimum_required(VERSION 3.11)

project(Proj VERSION 0.1.0 LANGUAGES CXX)


add_library                (algo INTERFACE)

target_include_directories (algo INTERFACE algo/include)

target_compile_features    (algo INTERFACE cxx_std_11)


add_library                (util STATIC)

target_include_directories (util PUBLIC  util/include)

target_compile_features    (util PUBLIC  cxx_std_17)

target_sources             (util PRIVATE util/include/util/Util.hxx
                                               util/source/Util.cxx)


add_library                (tool SHARED)

target_include_directories (tool PUBLIC  tool/include)

target_compile_features    (tool PUBLIC  cxx_std_14)

target_link_libraries      (tool PUBLIC  util
                                 PRIVATE algo)

target_sources             (tool PRIVATE tool/include/tool/Tool.hxx
                                               tool/source/Tool.cxx)


add_executable             (app)

target_compile_features    (app PRIVATE cxx_std_11)

target_sources             (app PRIVATE app/source/App.cxx)

target_link_libraries      (app PRIVATE tool)
