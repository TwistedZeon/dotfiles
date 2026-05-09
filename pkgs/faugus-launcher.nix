{
  fetchFromGitHub,
  gobject-introspection,
  icoextract,
  imagemagick,
  lib,
  libayatana-appindicator,
  libcanberra-gtk3,
  lsfg-vk,
  meson,
  ninja,
  nix-update-script,
  python3Packages,
  umu-launcher,
  wrapGAppsHook3,
  xdg-utils,
}:

let
  src = fetchFromGitHub {
    owner = "Faugus";
    repo = "faugus-launcher";

    rev = "1.19.2";

    hash = "sha256-fhO7W+m4YT6fw+D+x9xVVvSTSqRtdiNA66Vqb9q35U4=";
  };
in

python3Packages.buildPythonApplication {
  pname = "faugus-launcher";
  version = "1.19.2";

  inherit src;
  pyproject = false;

  nativeBuildInputs = [
    gobject-introspection
    meson
    ninja
    wrapGAppsHook3
  ];

  buildInputs = [
    libayatana-appindicator
  ];

  dependencies = with python3Packages; [
    pillow
    psutil
    pygame
    pygobject3
    requests
    vdf
  ];

  postPatch = ''
    substituteInPlace faugus-launcher \
      --replace-fail "/usr/bin/python3" "${python3Packages.python.interpreter}"

    substituteInPlace faugus/launcher.py \
      --replace-fail "PathManager.user_data('faugus-launcher/umu-run')" "'${lib.getExe umu-launcher}'" \
      --replace-fail "/usr/lib/extensions/vulkan/lsfgvk/lib/liblsfg-vk.so" "${lsfg-vk}/lib/liblsfg-vk.so" \
      --replace-fail "/usr/lib/liblsfg-vk.so" "${lsfg-vk}/lib/liblsfg-vk.so"

    substituteInPlace faugus/runner.py \
      --replace-fail "PathManager.user_data('faugus-launcher/umu-run')" "'${lib.getExe umu-launcher}'"

    substituteInPlace faugus/shortcut.py \
      --replace-fail "/usr/lib/extensions/vulkan/lsfgvk/lib/liblsfg-vk.so" "${lsfg-vk}/lib/liblsfg-vk.so" \
      --replace-fail "/usr/lib/liblsfg-vk.so" "${lsfg-vk}/lib/liblsfg-vk.so"
  '';

  dontWrapGApps = true;

  preFixup = ''
    makeWrapperArgs+=(
      "''${gappsWrapperArgs[@]}"
      --suffix PYTHONPATH : "$out/${python3Packages.python.sitePackages}:$PYTHONPATH"
      --suffix PATH : "${
        lib.makeBinPath [
          icoextract
          imagemagick
          libcanberra-gtk3
          umu-launcher
          xdg-utils
        ]
      }"
    )

    wrapProgram $out/bin/faugus-launcher ''${makeWrapperArgs[@]}
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Simple and lightweight app for running Windows games using UMU-Launcher";
    homepage = "https://github.com/Faugus/faugus-launcher";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ RoGreat ];
    mainProgram = "faugus-launcher";
    platforms = lib.platforms.linux;
  };
}
