{
  lib,
  stdenv,
  fetchzip,
  mbedtls,
  meson,
  ninja,
}:
let
  webManModVersion = "1.47.48";
in
stdenv.mkDerivation rec {
  pname = "ps3netsrv";
  version = "20250501";

  src = fetchzip {
    url = "https://github.com/aldostools/webMAN-MOD/releases/download/${webManModVersion}/${pname}_${version}.zip";
    hash = "sha256-+8O4M5ZmALwvm7Jafh82W4MVS3XZ0baMjoh2jXlP6Bs=";
  };

  sourceRoot = "${src.name}/src";

  buildInputs = [
    meson
    ninja
    mbedtls
  ];

  env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.hostPlatform.isDarwin "-Doff64_t=off_t";

  postInstall = ''
    install -Dm644 ../LICENSE.TXT $out/usr/share/licenses/${pname}/LICENSE.TXT
  '';

  meta = {
    description = "PS3 Net Server (mod by aldostools)";
    homepage = "https://github.com/aldostools/webMAN-MOD/";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.unix;
    mainProgram = "ps3netsrv";
  };
}
