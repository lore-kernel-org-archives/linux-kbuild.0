Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:15702 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759040Ab3D2TwE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 15:52:04 -0400
Message-Id: <20130429195100.202681236@goodmis.org>
Date: Mon, 29 Apr 2013 15:51:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of config files included in if statements
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="00GvhwF7k39YY"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

--00GvhwF7k39YY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Linus,

A bug was recently found (today) in the make localmodconfig where it would =
miss
dependencies of config files that are included in other config files inside
an if statement.

Also added a debug print that helped in solving this bug.

Please pull the latest ktest-v3.10 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
ktest-v3.10

Head SHA1: 7714fe5ac0cf752eae7a20ef23408aa26271a3eb


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

iQEcBAABAgAGBQJRfs9eAAoJEOdOSU1xswtM3LUIAL1DRYctw+T+hgj01zMdpoxI
PenEWWWHPX2f4en2nHDFYyPfVRhv+SXQ4H+i5EZO9MDCg2H5a8e3UHYswM3B+jrW
e+SkCbegUoL9njtbZxnEnJzDZqlMQu+1Gj+wjlD2H55Z7jut/J1COjK2pxmVrudR
Hffu8j0GM8kMdcXfY61eN4smEKhtjGrbJIbXx+zeiZgu9lk88+sQM4rzcRUWDLHP
Mf2z9mVHAKS/S0gnfNkwUDCJDflEcRYKY4I4bnSMjiV1rbwWAmvg/wzKWoJtp+pl
EdSQdebreLFD8vlPZTswgZPTKlZlTWhP6c/r+JdMk+WAkA/KT4IvKBZbKPmRHMs=
=N5OO
-----END PGP SIGNATURE-----

--00GvhwF7k39YY--
