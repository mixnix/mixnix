{ stdenv, hostPlatform, fetchurl, buildPackages, perl, buildLinux, ... } @ args:

with stdenv.lib;

buildLinux (args // rec {
  kversion = "3.18.51";
  pversion = "rt57";
  version = "${kversion}-${pversion}";
    # branchVersion needs to be x.y
  extraMeta.branch = concatStrings (intersperse "." (take 2 (splitString "." version)));

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v3.x/linux-${kversion}.tar.xz";
    sha256 = "1346d00dnpfcazfa1wmpn2z7na4afkns6yd08xkq7249wzgi23gi";
  };

  kernelPatches = args.kernelPatches;

  features.iwlwifi = true;
  features.efiBootStub = true;
  features.needsCifsUtils = true;
  features.canDisableNetfilterConntrackHelpers = true;
  features.netfilterRPFilter = true;
} // (args.argsOverride or {}))
