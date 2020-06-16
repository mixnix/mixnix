{ stdenv, fetchurl }:

let

  realtimePatch =
    { branch
    , kversion
    , pversion
    , url ? "https://www.kernel.org/pub/linux/kernel/projects/rt/${branch}/older/patch-${kversion}-${pversion}.patch.xz"
    , sha256
    }:
    { name  = "rt-${kversion}-${pversion}";
      patch = fetchurl {
        inherit url sha256;
      };
    };

in rec {

  realtimePatch_3_18 = realtimePatch
    { branch = "3.18";
      kversion = "3.18.51";
      pversion = "rt57";
      sha256 = "057f39vn520lf1my9fdfjfbmfm4jp6qwpsq068ci96q983jn6mvg";
    };

  realtimePatch_4_1 = realtimePatch
    { branch = "4.1";
      kversion = "4.1.40";
      pversion = "rt48";
      sha256 = "0b5sdzlzi6bjmbvmhxb72w73pafr30yawzjd4is7vzcd8b71y227";
    };

  realtimePatch_4_4 = realtimePatch
    { branch = "4.4";
      kversion = "4.4.70";
      pversion = "rt83";
      sha256 = "1kannihx8hcykdachi14myapsdgpwxl2gkwfy0ylb9khjp6zw9yw";
    };

  realtimePatch_4_9 = realtimePatch
    { branch = "4.9";
      kversion = "4.9.35";
      pversion = "rt25";
      sha256 = "0vm7dpdaspwyccx2lh6sycfcaaiw1439fpnhypm5cya0ymsnz0fj";
    };

  realtimePatch_4_11 = realtimePatch
    { branch = "4.11";
      kversion = "4.11.12";
      pversion = "rt14";
      sha256 = "0zh0xfw34abwaadlskdgbmm9cgz88kw7ss5scq4x821qx9n11a0b";
    };

  realtimePatch_4_13 = realtimePatch
    { branch = "4.13";
      kversion = "4.13.7";
      pversion = "rt1";
      sha256 = "0jmwwy6yf19apqh6m8cc3k16czgjb1vlhg02r78zpxx77w793x2z";
    };

  realtimePatch_4_14 = realtimePatch
    { branch = "4.14";
      kversion = "4.14.103";
      pversion = "rt55";
      sha256 = "0ccn0f2yvrjsx8rwlg8x6xgqa1mch1r5372k6vfwq394jxi82d6g";
    };

  realtimePatch_4_16 = realtimePatch
    { branch = "4.16";
      kversion = "4.16.18";
      pversion = "rt12";
      sha256 = "1rh36wfgg5x15nrx7zd0cfpkjrvlagsvpdf806la4fsyr7gcqwa7";
    };

  realtimePatch_4_18 = realtimePatch
    { branch = "4.18";
      kversion = "4.18.16";
      pversion = "rt9";
      sha256 = "04zzm1mlm9km1776w9bgblyr6c36wc10wmyvkf4pimwdd7ch50mb";
    };

  realtimePatch_4_19 = realtimePatch
    { branch = "4.19";
      kversion = "4.19.124";
      pversion = "rt53";
      sha256 = "06l65z626y9gh437n3b8cxafgbqlclagwpwixzr7zdn8lrby0yiw";
    };

  realtimePatch_5_0 = realtimePatch
    { branch = "5.0";
      kversion = "5.0.19";
      pversion = "rt11";
      sha256 = "005krk67w8742nqv63b8mnjkssw6db3k19x1jdfr26rgdcq9azbi";
    };

  realtimePatch_5_4 = realtimePatch
    { branch = "5.4";
      kversion = "5.4.44";
      pversion = "rt26";
      sha256 = "16piyv1a167gl8hvnn3hyxw5bz97xhz8i97f4zpb7l28lj3iixvx";
    };

  realtimePatch_5_6 = realtimePatch
    { branch = "5.6";
      kversion = "5.6.17";
      pversion = "rt9";
      sha256 = "0k0inq5pjk50yii9dsvhpip76naal5f73i736fvd5qz1l5gayy0b";
    };
}
