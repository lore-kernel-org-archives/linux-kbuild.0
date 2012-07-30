Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:14463 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754475Ab2G3TpC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jul 2012 15:45:02 -0400
Message-Id: <20120730194316.768288008@goodmis.org>
Date: Mon, 30 Jul 2012 15:43:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/4] [GIT PULL] localmodconfig: Improve module config removal
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="00GvhwF7k39YY"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

--00GvhwF7k39YY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Linus,

These changes drastically improve the amount of module configs removed
from a config file. It also adds some debug that I can have users
easily enable if things do not work for them.

Please pull the latest localmodconfig-v3.6 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v3.6

Head SHA1: d217733ba4a4b30e27a88753f9eeabd4464ddf19


Steven Rostedt (4):
      localmodconfig: Comments and cleanup for streamline_config.pl
      localmodconfig: Read in orig config file to avoid extra processing
      localmodconfig: Check if configs are already set for selects
      localmodconfig: Add debug environment variable LOCALMODCONFIG_DEBUG

----
 scripts/kconfig/streamline_config.pl |  175 ++++++++++++++++++++++++++++++=
----
 1 file changed, 158 insertions(+), 17 deletions(-)

--00GvhwF7k39YY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQFuQ6AAoJEIy3vGnGbaoAiq8P/iKtIWWgk/cVlOOSzZMG6XpV
uNi0zuBU5QBWqJkHhdy2+XJFj+D8LEwmrcYEfE3lv5LTsd9nBuMMQHchA2JDoBHC
UhkuAXNQGDhd2XB0Vk08jn8ooGXg2JEOAKEtfYsjJZI+DHLhfseJSAHA/gntYYiF
0YsoAa386BZ89qoHM6ZC5vWpYGUzXL1YVI/3Qqdppdvg4JYYH8SEn/uJ6GT92WuI
FfLJ3J0GBk1VyuZQJp5UPSzPRRXf/oChHCHCEV/U8kDENq2RNhHsLTVFOAI8Y0VJ
IncgWT/uk+zEcDR1Jq+41uLcMOMMcc1nroYNYOgHyHXKBPFPZzJr7qYahU6Eqr93
0tQs4JCx2TNVeLglO1tGvM2gFYLUkDqAWtQtC6mteJ0pNibWSctz4dHu6F0x/c8h
OeTqUm2h0H/r9syi7KnhkXRyJYisutJYMMBgsrrgQGncr2mQ1+0+7VFNrYTLp0YB
wYUvnWp5YZFrpDRGkKC0nR4WAkAkrWPV3j+OiLn2H2PL9Cvw/M8w/Bq+/M3sXWJb
S8rDHTwZBg7l7A70QWvQ8U+u7b5Mv7yWnDMPST1UtBAwReyYFZTrz8SV/6PNLpHv
q56OjWp0CJAbsf1/S0gxdFLKie+cpmGLvB37iXxnh6Lbd82FwC4stFcvR5cjhS7v
yaworKBzSUMQRsrf8P5T
=dHX+
-----END PGP SIGNATURE-----

--00GvhwF7k39YY--
