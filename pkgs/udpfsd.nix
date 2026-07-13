{
  lib,
  buildGoModule,
  fetchFromGitHub,
  libchdr,
  pkg-config,
}:

buildGoModule {
  pname = "udpfsd";
  version = "0.1.6";

  src = fetchFromGitHub {
    owner = "pcm720";
    repo = "udpfsd";
    rev = "v0.1.6";
    hash = "sha256-QUnMNqQFGZXcRgIqn3iT56UTdnrpbva0X02L11bUKOE=";
  };

  vendorHash = "sha256-w1ZvVk06PwBZryCliRvoWMXwShQNnqMTJJZvEZMgRlQ=";

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
