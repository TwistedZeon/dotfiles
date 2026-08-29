{
  lib,
  buildGoModule,
  fetchFromGitHub,
  libchdr,
  pkg-config,
}:

buildGoModule {
  pname = "udpfsd";
  version = "0.1.7";

  src = fetchFromGitHub {
    owner = "pcm720";
    repo = "udpfsd";
    rev = "v0.1.7";
    hash = "sha256-z0WaZFvK6SQq626mGVe2EggoY2wowqZiEsShgN5hLbo=";
  };

  vendorHash = "sha256-0NjdihN5+EB7LBtBZKh1+725CjQCuLJ9KRECm0Md2jA=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libchdr
  ];

  subPackages = [
    "cmd/udpfsd"
  ];

  meta = with lib; {
    description = "UDPFS server";
    homepage = "https://github.com/pcm720/udpfsd";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
