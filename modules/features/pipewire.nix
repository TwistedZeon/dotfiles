{
  ...
}:
{
  flake.nixosModules.pipewire =
    {
      pkgs,
      lib,
      ...
    }:
    {
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;

        # Increase latency a bit to stop crackles
        extraConfig =
          let
            quantum = rec {
              rate = 48000;
              max = default * 2;
              default = 512;
              min = default / 2;
            };
          in
          {
            pipewire."92-latency" = {
              "context.properties" = {
                "default.clock.quantum" = quantum.default;
                "default.clock.min-quantum" = quantum.min;
                "default.clock.max-quantum" = quantum.max;
              };
            };
            #
            pipewire-pulse."92-latency".context = {
              modules = [
                {
                  name = "libpipewire-module-protocol-pulse";
                  args =
                    let
                      quantumStr = lib.mapAttrs (_: v: "${toString v}/${toString quantum.rate}") quantum;
                    in
                    {
                      pulse.default.req = quantumStr.default;
                      pulse.min.quantum = quantumStr.min;
                      pulse.max.quantum = quantumStr.max;
                    };
                }
              ];
            };

            # Noise Cancelling
            pipewire."99-input-denoising" = {
              "context.modules" = [
                {
                  "name" = "libpipewire-module-filter-chain";
                  "args" = {
                    "node.description" = "DeepFilter Noise Cancelling Source";
                    "media.name" = "DeepFilter Noise Cancelling Source";
                    "filter.graph" = {
                      "nodes" = [
                        {
                          "type" = "ladspa";
                          "name" = "DeepFilter Mono";
                          "plugin" = "${pkgs.deepfilternet}/lib/ladspa/libdeep_filter_ladspa.so";
                          "label" = "deep_filter_mono";
                          # "control" = {
                          #   "Attenuation Limit (dB)" = cfg.source.attenuation;
                          # };
                        }
                      ];
                    };
                    "audio.rate" = 48000;
                    "capture.props" = {
                      "node.name" = "deep_filter_mono_input";
                      "node.passive" = true;
                    };
                    "playback.props" = {
                      "node.name" = "deep_filter_mono_output";
                      "media.class" = "Audio/Source";
                    };
                  };
                }
              ];
            };
          };
      };
    };
}
