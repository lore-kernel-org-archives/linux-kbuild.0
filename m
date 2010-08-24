Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.michael-prokop.at ([88.198.6.110]:52465 "EHLO
	mail.michael-prokop.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933210Ab0HXXNc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Aug 2010 19:13:32 -0400
Date: Wed, 25 Aug 2010 01:03:49 +0200
From: Michael Prokop <mika@grml.org>
Subject: scripts/setlocalversion: information retrieval about git
	repository state
Message-ID: <2010-08-25T00-33-12@devnull.michael-prokop.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FNPeqk0egs0iuvD"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: nico-linuxsetlocalversion@schottelius.org


--5FNPeqk0egs0iuvD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

(please Cc me on replies as I'm not subscribed to linux-kbuild@)

while building Debian packages of my own kernel version I stumbled
upon a build problem with a Debian mechanism, see
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=591793

Why I'm reporting this issue: in scripts/setlocalversion there's the
following comment (hint: "apped" should be "append"):

        # apped a plus sign if the repository is not in a clean tagged
        # state and  LOCALVERSION= is not specified

Ok, so testing with a clean and untagged state and empty
LOCALVERSION using master of current
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git:

  % cd linux-2.6
  % make defconfig
  % make prepare
  % git status
  # On branch master
  nothing to commit (working directory clean)
  % scripts/setlocalversion
  +

Alright. But:

  % git branch
  * master
  % git show master | head -1
  commit d1b113bb028999e82a8528e1484be8c23fb5a7d9
  % git tag master-test d1b113bb028999e82a8528e1484be8c23fb5a7d9
  % scripts/setlocalversion
  +

Huh? Ok, scripts/setlocalversion uses 'git describe --exact-match':

  % git describe --exact-match
  fatal: no tag exactly matches 'd1b113bb028999e82a8528e1484be8c23fb5a7d9'
  % git branch --contains d1b113bb028999e82a8528e1484be8c23fb5a7d9
  * master

For my understanding this *is* a tagged and clean state of the
repository. But I'm not sure whether that's a bug in 'git describe
--exact-match' or if scripts/setlocalversion of recent kernel
versions should be adjusted (either the check for the untagged state
or clarify/improve the comment about it).

regards,
-mika-

--5FNPeqk0egs0iuvD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkx0T9UACgkQ2N9T+zficuihkQCfbe9DhAB2rYWxAuC/0x9cmxBZ
OHUAniW3KPqVrtv1iKetUff7WaWfX4np
=HXdR
-----END PGP SIGNATURE-----

--5FNPeqk0egs0iuvD--
