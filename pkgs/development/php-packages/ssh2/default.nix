{ buildPecl, autoconf, lib, libssh2 }:

let libssh2-dev = lib.getDev libssh2;

in

buildPecl {
  pname = "ssh2";
  version = "1.3.1";
  sha256 = "9093a1f8d24dc65836027b0e239c50de8d5eaebf8396bc3331fdd38c5d69afd9";

  buildInputs = [
    autoconf
    libssh2
    libssh2-dev
  ];

  configurePhase = ''
    phpize
    ./configure --with-ssh2=${libssh2-dev}
  '';

  meta = with lib; {
    description = "Bindings for the libssh2 library.";
    license = licenses.php301;
    homepage = "http://www.libssh2.org";
    maintainers = teams.php.members;
  };
}
