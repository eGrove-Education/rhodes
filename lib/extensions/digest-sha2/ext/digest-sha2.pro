QT -= core

TARGET = digest-sha2
TEMPLATE = lib

CONFIG += staticlib warn_on

INCLUDEPATH += ../../digest/ext\
../../../../platform/shared/ruby/include\
../../../../platform/shared\
../../../../platform/shared/common

macx {
  DESTDIR = ../../../../platform/osx/bin/extensions
  OBJECTS_DIR = ../../../../platform/osx/bin/extensions/digest-sha2
  INCLUDEPATH += ../../../../platform/shared/ruby/iphone
  INCLUDEPATH += ../../../../../openssl/include
}
win32 {
  DESTDIR = ../../../../platform/win32/bin/extensions
  OBJECTS_DIR = ../../../../platform/win32/bin/extensions/digest-sha2
  DEFINES += WIN32 _WINDOWS _LIB _UNICODE UNICODE WIN32_LEAN_AND_MEAN
  Debug {
    DEFINES += _DEBUG DEBUG
  }
  Release {
    DEFINES += _NDEBUG NDEBUG
  }
  INCLUDEPATH += ../../../../platform/shared/ruby/win32\
../../openssl.so/ext/win32/include
}

DEFINES += RHODES_QT_PLATFORM _XOPEN_SOURCE _DARWIN_C_SOURCE

!isEmpty(RHOSIMULATOR_BUILD) {
  DEFINES += RHODES_EMULATOR
}

!win32 {
  QMAKE_CFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
  QMAKE_CXXFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
  # QMAKE_CFLAGS += -fvisibility=hidden
  # QMAKE_CXXFLAGS += -fvisibility=hidden
}
win32 {
  QMAKE_CFLAGS_WARN_ON += /wd4996 /wd4100 /wd4005
  QMAKE_CXXFLAGS_WARN_ON += /wd4996 /wd4100 /wd4005
  QMAKE_CFLAGS_RELEASE += /O2
  QMAKE_CXXFLAGS_RELEASE += /O2
}

HEADERS += sha2.h sha2ossl.h

SOURCES += sha2.c sha2init.c sha2ossl.c
