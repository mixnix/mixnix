{ stdenv, fetchurl, utillinux, lib }:

stdenv.mkDerivation rec {
  name = "rtirq";
  version = "20210309";

  src = fetchurl {
    urls = ["http://www.rncbc.org/archive/${name}-${version}.tar.gz" "https://www.rncbc.org/archive/old/${name}-${version}.tar.gz" ];
    sha256 = "1z7nfak52g5zgahsdj2iz97q9pxjk2c3xhaa67c14xvzrnxvk0cq";
  };

  phases = [ "unpackPhase" "patchPhase" "installPhase" ];

  patchPhase = ''
    patchShebangs rtirq.sh
    substituteInPlace rtirq.sh \
      --replace "/sbin /usr/sbin /bin /usr/bin /usr/local/bin" "${utillinux}/bin"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp rtirq.sh $out/bin/rtirq
  '';

  meta = with lib; {
    description = "IRQ thread tuning for realtime kernels";
    homepage = http://www.rncbc.org/jack/;
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = with maintainers; [ henrytill ];
  };
}
