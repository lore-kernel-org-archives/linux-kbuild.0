Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38051 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732579AbeGLW1z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 18:27:55 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fdjsq-0007iN-1f
        for linux-kbuild@vger.kernel.org; Thu, 12 Jul 2018 23:16:20 +0100
Date: Thu, 12 Jul 2018 23:16:20 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180712221619.GH14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fckbADODYWZD5TdN"
Content-Disposition: inline
Subject: [RFC PATCH 0/3] kbuild: In quiet mode, print the full command line
 if it fails
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--fckbADODYWZD5TdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The default (quiet) kbuild output is usually preferable to a log
showing every command line in full.  However, after a failure the
full command line may be more interesting.  When building from an
interactive shell, it's trivial to retry the build with V=1, but in
case the failed build was automated this is not so easy.

For example,
<https://buildd.debian.org/status/fetch.php?pkg=linux&arch=powerpcspe&ver=4.18%7Erc4-1%7Eexp1&stamp=1531410477&raw=0>
is a build failure triggered by a change in the default compiler
options for powerpc.  This failure is from a native build and I
cannot reproduce it in a cross-build environment.  From the quiet
build log I can't tell whether the same compiler options were used
in the native build.

This series changes the various standard macros used to run and
(depending on verbosity) echo a command.  In quiet mode, if a
command fails it will be echoed before exiting the shell.

Ben.

Ben Hutchings (3):
  kbuild: Move final argument to modpost into $(cmd_modpost)
  kbuild: Add $(run-cmd) macro for running and maybe echoing command
  kbuild: In quiet mode, print the full command line if it fails

 scripts/Kbuild.include   | 13 +++++++++----
 scripts/Makefile.modpost |  4 ++--
 2 files changed, 11 insertions(+), 6 deletions(-)


--fckbADODYWZD5TdN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW0fTM+e/yOyVhhEJAQr8GhAAmfGDqycIDAtEbxdlkAiCbdTdKI7oG//9
Xn3Tcg/zJmKJDaqpsYLeYwTBrcm+UPfqtYKLz+S/rkHxEwlADpCyLU0jaz23p6KI
JwLSONV+xTFsQwq+AhHTd0VLgUrLH7KHixnINNsyAvhmq0KKBYSYm2iLA/Vxgx09
c8kJkkdnlT/IHRucTg13Xy1jcQ2TXfGLW9eLgZ1s1BxmiYJL0eeQa9FvyCqJgfh4
KmGS9S9+aMIzm8WTFh7RrzIMLnyhgsy0xuTh1gik19XphsKAR1Gga1+xf4H637Pn
m9/ovcICg9zWIGdlWIm6MUM9opeprVE1hABT4ZL8qTKDXc6/7/8RXdUpzBqCswwc
j68SOtgx3MrFsiLoJhI+eV54VkxPmGNScWZPEvHpcj2v2pRFQGHuM77bKU8ZvDUp
uZDmXSjHvJraOE3pUrZnrA2x9Rzpx6vL5IQjJvcs7AD/IyZpfcj06BmkKJcXBrfZ
l63bIsrSS8mtpRGai8j9wrEgSyM5MK8QV4PsCTSis7VBKuXKwo8SqgnUnApIOhNY
jy025Sj38r7qioPzzpfeumcEc0jc79arKDfxifgiI1kuo55unKOZBdcP5uUzGSkS
ilceEPu+1IvqcSZ237gorjDc6U+6M1HPHq4AOftEfpBxBC+y+XlTC3/jcz07zlqO
tBuxzhFa0Mc=
=KW/u
-----END PGP SIGNATURE-----

--fckbADODYWZD5TdN--
