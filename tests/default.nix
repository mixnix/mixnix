import <nixpkgs/nixos/tests/make-test-python.nix> {
  machine =
    { config, pkgs, ... }:
    { imports = [ ../default.nix ];

      musnix.enable = true;
      musnix.kernel.optimize = true;
      musnix.kernel.realtime = true;
      musnix.kernel.packages = pkgs.linuxPackages_latest_rt;
      musnix.rtirq.enable = true;
      musnix.rtirq.highList = "timer";
      musnix.soundcardPciId = "00:05.0";
    };

  testScript = ''
    machine.start()
    machine.wait_for_unit("default.target")
    result = machine.succeed("uname -v")
    print(result)
    if not "PREEMPT RT" or not "PREEMPT_RT" in result:
        raise Exception("Wrong OS")
    print("PASSED")
  '';
}
