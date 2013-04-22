Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:37802 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754496Ab3DVSTk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 14:19:40 -0400
From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: non-visible options vs menuconfigs
Date: Mon, 22 Apr 2013 14:19:50 -0400
References: <201304221251.54695.vapier@gentoo.org> <20130422180046.GA24143@free.fr>
In-Reply-To: <20130422180046.GA24143@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4744025.mEQq85ylTY";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304221419.51623.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

--nextPart4744025.mEQq85ylTY
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 22 April 2013 14:00:46 Yann E. MORIN wrote:
> On Mon, Apr 22, 2013 at 12:51:53PM -0400, Mike Frysinger wrote:
> > the current EXPERT menuconfig is broken by some new options that happen
> > to be sprinkled into the wrong place.  seems like if a node is
> > unprintable, it should get skipped for menuconfig purposes ?  otherwise,
> > this is a constantly losing battle where someone inserts new Kconfig
> > options and forgets this nuance, and then it stays broken for a while
> > until someone notices.  this particular bug wrt EXPERT has been
> > linux-3.2.
> >=20
> > for example, in the General setup section, you currently see:
> > 	[ ] Configure standard kernel features (expert users)  --->
> > 	[ ] Embedded system
> >=20
> > if you enable EXPERT there, the options get dumped into the same level
> > instead
> >=20
> > of being under that menuconfig:
> > 	[*] Configure standard kernel features (expert users)  --->
> > 	[ ] Sysctl syscall support
> > 	[*] Load all symbols for debugging/ksymoops
> > 	...
> > 	[ ] Embedded system
>=20
> Yes, this is indeed disturbing.
>=20
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>=20
> > is this feasible in the kconfig code ?
>=20
> From Documentation/kbuild/kconfig-language.txt:

when i said "kconfig code", i was referring to making changes to the parsin=
g=20
source, not the kconfig language.

> As far as I remember, this has always been the behaviour of menuconfig.
>=20
> What do you suggest the frontends do in this case, short of re-ordering
> the options (which I think is not correct) ?

i think you missed a critical part of my proposal:
	seems like *if a node is unprintable*, it should get skipped for
	menuconfig purposes

to modify your example, i'm proposing a change for:
	menuconfig MENU_A
		bool "A"

	config OPT_B
		bool

	config OPT_C
		bool "C"
		depends on MENU_A

OPT_B is not shown to the user (there is no option text), therefore it shou=
ld=20
automatically get skipped when searching for options to collapse into the=20
menuconfig MENU_A.

i do agree that if OPT_B had text, then the existing behavior would be=20
unchanged.
=2Dmike

--nextPart4744025.mEQq85ylTY
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdX9HAAoJEEFjO5/oN/WBvW0P/jX9huIb/CPzV9CpnzYCSIy8
Sa8mIBQbDhogur5hXwycJQj/xC/L9crpt7/+HKOhWMKZpse/iEizQK2V5xpQ+uKa
z5Pefui+G1+x42Y+YYo4hhSNwqziJ9zks9nMXYr73/wc/izDkwCplwyAjaTL6ER5
ioc597eQE3XxjWSwJcZ1ZSreQJuq/LPcdm8nn1oGoR1vgiBz7Dht7sDLcLCiLARA
3BO9+oD/Y+DRar8wZmYcYp5Ae/bHfslMqXDDlQBXbGhDb3hinzZZ2AoRH9X2+ZoA
CVK8xrumC0WLZgci1tCnSAuXfETEEMcp9osOO00U5T+2cbzVhC/fg3EK5+Pp91sY
WQDKQs3DHtsngAUqIn+O8/naKOCDnsS9buUCYa37bTGg6i+Cl/zTRaKtFpuPMUTo
Lj54byUTokCw8ESf3MRqDb/2X6iJJnBBn7aDl7gUC8bP+PhHxuGxto6RHSXZSTLs
OPh7qGgByx1WInW9M89cQWOAe/a4zRlXYHJXrNP9uJBKHkKIX6Rm4mFXHGTTt8rD
USSJqe5q6pX61+MzvaGIeiy+pnRuEYswXEsMgWT0bJce8a0IDOu0GsTze9oAlmvW
JIMCjhhH3x9ENKaeSYTeyBHmzH/GMD4T6MFQZ97e3PRvQs543UH1sciReHF6r1H2
qdU9KBKWhr/4FjzmHXad
=GdhR
-----END PGP SIGNATURE-----

--nextPart4744025.mEQq85ylTY--
