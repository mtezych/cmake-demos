
cmake_minimum_required(VERSION 3.11)


function(is_defined VARIABLE)

    if(DEFINED var)

        message("${VARIABLE}           = '${${VARIABLE}}'")

    else()

        message("${VARIABLE}           = undef")

    endif()

endfunction()


function(variables_demo)

    # CMake does not require quotes around strings without spaces.
    set(var value)
    message("var           = '${var}'")

    set(str "this is string")
    message("str           = '${str}'")

    # CMake represents lists as strings with lists' elements separated by ';'.
    set(list x y z)
    message("list          = '${list}'")

    # CMake allows dereferencing variables recursively.
    set(var_name var)
    message("${var_name}           = '${${var_name}}'")

    set(${var_name} "modified value")
    message("${var_name}           = '${${var_name}}'")

    # CMake variables are problematic, because they do not require defining.
    message("undef_var     = '${undef_var}'")

    # CMake allows defining multi-line strings, which require escaping.
    set(multiline_str "This is
                 a multi-line string containing \"quotes\".")
    message("multiline_str = '${multiline_str}'")

    # CMake allows defining raw string literals using square brackets.
    set(raw_str [=[This is
                 another way of defining "multi-line" ${raw} string.]=])
    message("raw_str       = '${raw_str}'")

    #[==[
    message("CMake also allows defining comments using square brackets.")
    #]==]

    # CMake allows removing variables from the current scope.
    is_defined(var)
    unset(var)
    is_defined(var)

endfunction()


# CMake has access only to environment of the current CMake process, hence,
# all environment changes will be destroyed when CMake will finish processing.
function(append_cwd_to_path)

    if (UNIX)

        set(ENV{PATH} "$ENV{PATH}:$ENV{PWD}")

    elseif(WIN32)

        set(ENV{PATH} "$ENV{PATH};$ENV{CD}")

    else()

        message(FATAL_ERROR "Unsupported platform!")

    endif()

endfunction()


function(environment_demo)

    # CMake allows reading enviroment variables.
    message("PATH          = '$ENV{PATH}'")
    append_cwd_to_path()
    message("PATH          = '$ENV{PATH}'")

endfunction()


function(cache_demo)

    # CMake allows defining cache variables,
    # which are stored presistently in a CMakeCache.txe file.
    set(cache_var "cache value" CACHE STRING "This is a cache variable.")

    message("cache_var     = '${cache_var}'")

endfunction()


function(main)

    message("Variables Demo")

    variables_demo()

    environment_demo()

    cache_demo()

endfunction()


main()
