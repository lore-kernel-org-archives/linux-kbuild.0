Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:51375 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753665Ab2BPVgI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Feb 2012 16:36:08 -0500
Date: Fri, 17 Feb 2012 06:29:27 +0900
From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2/2] kbuild: Only build linux-image package for UML
Message-ID: <20120216212926.GA8970@kamineko.org>
References: <1329323907-7696-1-git-send-email-joerg.roedel@amd.com>
 <1329323907-7696-2-git-send-email-joerg.roedel@amd.com>
 <1329367790.3048.168.camel@deadeye>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <1329367790.3048.168.camel@deadeye>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Joerg Roedel <joerg.roedel@amd.com>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 04:49:50AM +0000, Ben Hutchings wrote:
> On Wed, 2012-02-15 at 17:38 +0100, Joerg Roedel wrote:
> > For user-mode Linux the other packages are not required. So
> > only build the package with the linux-image in it.
> >=20
> > Cc: Michal Marek <mmarek@suse.cz>
> > Cc: maximilian attems <max@stro.at>
> > Cc: Ben Hutchings <ben@decadent.org.uk>
> > Cc: debian-kernel@lists.debian.org
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> Tested-by: Ben Hutchings <ben@decadent.org.uk>
>=20
> But I've never touched UML either so we should get confirmation that
> this really is the right thing to do.

there is a wishlist bug opened ages ago (and pinged not so long ago)
requesting headers to be packaged in debian:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D186930
Just to say that there is some interest in having headers packaged
somehow.

--=20
mattia
:wq!

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk89dTYACgkQgpRPaOotLEGmwwCeIOIw5eX2x+w2/QMPAnhLKEk/
XRwAoODTPg/s5HZyRJRf8CUm/vNaJnOJ
=LYHv
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
