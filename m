Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:31958 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753328Ab2JAQma (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Oct 2012 12:42:30 -0400
Message-ID: <1349109745.22822.118.camel@gandalf.local.home>
Subject: [PATCH][GIT PULL] localmodconfig: last minute fix
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 01 Oct 2012 12:42:25 -0400
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-3NvUoHPpes7bbM/ql/zh"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Yuta Ando <yuta.and@gmail.com>, stable <stable@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>


--=-3NvUoHPpes7bbM/ql/zh
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable


Linus,

I received this fix from Yuta today. Seems that localyesconfig has been
broken since v3.2 due to a change in the make files that calls it.

The change is a two line fix (see below), so I added it on top of my
last pull request and pushed this out with the new tag. This tag
includes the changes of my last pull request that was tagged
localmodconfig-v3.7.

-- Steve

Please pull the latest localmodconfig-v3.7-2 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v3.7-2

Head SHA1: d5f25147faf149510d883de1c8749ab76b812b4elinux-kbuild@vger.kernel=
.org


Yuta Ando (1):
      localmodconfig: Fix localyesconfig to set to 'y' not 'm'

----
 scripts/kconfig/streamline_config.pl |    2 ++
 1 file changed, 2 insertions(+)
---------------------------
commit 4eae518d4b01b0cbf2f0d8edb5a6f3d6245ee8fb
Author: Yuta Ando <yuta.and@gmail.com>
Date:   Mon Oct 1 23:24:30 2012 +0900

    localmodconfig: Fix localyesconfig to set to 'y' not 'm'
   =20
    The kbuild target 'localyesconfig' has been same as 'localmodconfig'
    since the commit 50bce3e "kconfig/streamline_config.pl: merge
    local{mod,yes}config". The commit expects this script generates
    different configure depending on target, but it was not yet implemented=
.
   =20
    So I added code that sets to 'yes' when target is 'localyesconfig'.
   =20
    Link: http://lkml.kernel.org/r/1349101470-12243-1-git-send-email-yuta.a=
nd@gmail.com
   =20
    Cc: stable@vger.kernel.org # v3.2
    Cc: linux-kbuild@vger.kernel.org
    Signed-off-by: Yuta Ando <yuta.and@gmail.com>
    Signed-off-by: Steven Rostedt <rostedt@rostedt.homelinux.com>

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streaml=
ine_config.pl
index 39b6314..3368939 100644
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -601,6 +601,8 @@ foreach my $line (@config_file) {
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
 	        $setconfigs{$1} =3D 'y';
+		print "$1=3Dy\n";
+		next;
 	    } else {
 	        $setconfigs{$1} =3D $2;
 	    }


--=-3NvUoHPpes7bbM/ql/zh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAABAgAGBQJQacfxAAoJEOdOSU1xswtMUkEH/1wpKlOVnwC6anpApBmyM4ur
94exnEtaOVe/NvPGzaQBUDu3ZgKZmfadzntOZb0/fQ6yyKv1CbVEQGV1Nws64Xy8
zEJB6xEnZSDk3FleXn0zwZqp01ojcPzYAIsbJPzUPlLF64Rl+8AzPQcnkpyg+H0C
Wn/pC1jqWSQV6tA/q1V2gdLxKTDu2Bbn8N8Dfir8ZqAouYTMMJtZGUtFPrZckobK
6PDl/zJbb5DaXy9NpIB3MbCoy+X/y34uDCGFwei7qoIMXpjccZVkxVqcS8YMwf66
Mu8kBytKF7Wejitmb972Rs47l4aFbJfMMGh6FsseUf3q93Fmu2jKQXvoGFLZM6A=
=XDGp
-----END PGP SIGNATURE-----

--=-3NvUoHPpes7bbM/ql/zh--

