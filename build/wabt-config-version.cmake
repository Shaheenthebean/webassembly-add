# This is a basic version file for the Config-mode of find_package().
# It is used by write_basic_package_version_file() as input file for configure_file()
# to create a version-file which can be installed along a config.cmake file.
#
# The created file sets PACKAGE_VERSION_EXACT if the current version string and
# the requested version string are exactly the same and it sets
# PACKAGE_VERSION_COMPATIBLE if the current version is equal to the requested version.
# The tweak version component is ignored.
# The variable CVF_VERSION must be set before calling configure_file().


if (PACKAGE_FIND_VERSION_RANGE)
  message(AUTHOR_WARNING
    "`find_package()` specify a version range but the version strategy "
    "(ExactVersion) of the module `${PACKAGE_FIND_NAME}` is incompatible "
    "with this request. Only the lower endpoint of the range will be used.")
endif()

set(PACKAGE_VERSION "1.0.31")

if("1.0.31" MATCHES "^([0-9]+\\.[0-9]+\\.[0-9]+)\\.") # strip the tweak version
  set(CVF_VERSION_NO_TWEAK "${CMAKE_MATCH_1}")
else()
  set(CVF_VERSION_NO_TWEAK "1.0.31")
endif()

if(PACKAGE_FIND_VERSION MATCHES "^([0-9]+\\.[0-9]+\\.[0-9]+)\\.") # strip the tweak version
  set(REQUESTED_VERSION_NO_TWEAK "${CMAKE_MATCH_1}")
else()
  set(REQUESTED_VERSION_NO_TWEAK "${PACKAGE_FIND_VERSION}")
endif()

if(REQUESTED_VERSION_NO_TWEAK STREQUAL CVF_VERSION_NO_TWEAK)
  set(PACKAGE_VERSION_COMPATIBLE TRUE)
else()
  set(PACKAGE_VERSION_COMPATIBLE FALSE)
endif()

if(PACKAGE_FIND_VERSION STREQUAL PACKAGE_VERSION)
  set(PACKAGE_VERSION_EXACT TRUE)
endif()


# if the installed project requested no architecture check, don't perform the check
if("FALSE")
  return()
endif()
