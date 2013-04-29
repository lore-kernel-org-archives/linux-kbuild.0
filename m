Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:9628 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932264Ab3D2Xau (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 19:30:50 -0400
Message-Id: <20130429233000.662744610@goodmis.org>
Date: Mon, 29 Apr 2013 19:30:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/2] [GIT PULL take 2 ] localmodconfig: Fix missing depends of config files included in if statements
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="00GvhwF7k39YY"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

--00GvhwF7k39YY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Linus,

[
  Sorry for the previous confusion. My scripts to make my patch sets
  key off of the tag name. Thus by using the ktest tag, my scripts
  put in the linux-ktest.git tree.
]

A bug was recently found in the make localmodconfig where it would miss
dependencies of config files are include in other config files inside
an if statement.

Also added a debug print that helped in solving this bug.


Please pull the latest localmodconfig-v3.10 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v3.10

Head SHA1: 0d0f18b32c5382431163391f224195dea251cae8


Steven Rostedt (2):
      localmodconfig: Add debug prints for dependencies of module configs
      localmodconfig: Process source kconfig files as they are found

----
 scripts/kconfig/streamline_config.pl |   26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

--00GvhwF7k39YY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAABAgAGBQJRfwKmAAoJEOdOSU1xswtMd0IIAMsHxNiia11NzyCDd01D+1Np
g3Lqx/3LPA4o7wAfBHxHrAheES11w2J+PJg8Sq74z4V0TpdFYhdp5FbXdIYTQ/aV
7pg+uPfmeALr6M3nl4rM55sJSyaq8jKLguFCNLziERsQIMQyFpqrtlpm7YvnTszJ
RwZgh0fEZK69qOMCkacHdPd1XDu4YvXLhX+JHTwc3sR0MJYoPET6+qTQIY+ZRvrM
uzVWl++jgBcC45wikPyIjQhQQoHAfILa/sHK9T56Z0fFgMbozlj6Ypo97fqY9hHk
p6aOUefi7Up2+NsaoQ4PfN6WW52EnTse/JK5+topMkb1F8PK3eI8TSw2uLwY7gc=
=NRGC
-----END PGP SIGNATURE-----

--00GvhwF7k39YY--
