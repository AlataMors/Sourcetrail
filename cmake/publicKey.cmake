# searching for public key file of the Sourcetrail version in setup/RSA_keys
# if found the file will be put into a const string into the PubicKeh.h file

string(REGEX REPLACE "^([0-9]+)\\..*" "\\1" VERSION_MAJOR "${GIT_VERSION_NUMBER}")
message(STATUS "Get Public Key for Sourcetrail version: ${VERSION_MAJOR}")

# message(STATUS "${CMAKE_SOURCE_DIR}/setup/RSA_keys/public-${VERSION_MAJOR}.pem")
message(STATUS "${CMAKE_SOURCE_DIR}/setup/RSA_keys/public-0.pem") # explain in Readme.md how to get this to work first

# set(pubKeyFile "${CMAKE_SOURCE_DIR}/setup/RSA_keys/public-${VERSION_MAJOR}.pem")
set(pubKeyFile "${CMAKE_SOURCE_DIR}/setup/RSA_keys/public-0.pem") # explain in Readme.md how to get this to work first

# message(STATUS "file: ${pubKeyFile}")

if(EXISTS ${pubKeyFile})
    file(READ ${pubKeyFile} KEY)
    STRING(REGEX REPLACE "\"" "\\\\\"" KEY "${KEY}")
    STRING(REGEX REPLACE "\n" "\\\\n\"\n\t\"" KEY "${KEY}")
    # message(STATUS "key: ${KEY}")
else()
    message(WARNING "public keyfile for this version of Sourcetrail not found")
endif()

configure_file(
  ${CMAKE_SOURCE_DIR}/cmake/PublicKey.h.in
  ${CMAKE_BINARY_DIR}/src/lib_license/PublicKey.h
)