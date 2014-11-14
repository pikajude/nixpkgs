{ stdenv, cmake, coreutils, fetchsvn, libcxx, libunwind, llvm, lib }:
let
  rev = "217324";
in stdenv.mkDerivation {
  name = "libcxxabi-pre-${rev}";

  src = fetchsvn {
    url = http://llvm.org/svn/llvm-project/libcxxabi/trunk;
    inherit rev;
    sha256 = "07nmvzw5rcxpaw03c18vkn2mxp0lhn6y4nn57d2vlxi36kcwfbb8";
  };

  patches = [ ./no-stdc++.patch ./darwin.patch ];

  NIX_SKIP_CXX    = "true";
  NIX_SKIP_CXXABI = "true";

  buildInputs = [ coreutils cmake ];

  postUnpack = ''
    unpackFile ${libcxx.src}
  '' + lib.optionalString stdenv.isDarwin ''
    export TRIPLE=x86_64-apple-darwin
    # Hack: NIX_CFLAGS_COMPILE doesn't work here because clang++ isn't
    # wrapped at this point.
    export CXX="clang++ -D_LIBCXX_DYNAMIC_FALLBACK=1"
    unset SDKROOT
  '';

  installPhase = if stdenv.isDarwin
    then ''
      for file in lib/*; do
        # this should be done in CMake, but having trouble figuring out
        # the magic combination of necessary CMake variables
        # if you fancy a try, take a look at
        # http://www.cmake.org/Wiki/CMake_RPATH_handling
        install_name_tool -id $out/$file $file
      done
      make install
      install -d 755 $out/include
      install -m 644 $src/include/cxxabi.h $out/include
    ''
    else ''
      install -d -m 755 $out/include $out/lib
      install -m 644 lib/libc++abi.so.1.0 $out/lib
      install -m 644 $src/include/cxxabi.h $out/include
      ln -s libc++abi.so.1.0 $out/lib/libc++abi.so
      ln -s libc++abi.so.1.0 $out/lib/libc++abi.so.1
    '';

  meta = {
    homepage = http://libcxxabi.llvm.org/;
    description = "A new implementation of low level support for a standard C++ library";
    license = "BSD";
    maintainers = [ stdenv.lib.maintainers.shlevy ];
    platforms = stdenv.lib.platforms.unix;
  };
}
