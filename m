Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:47291 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752189Ab3DVVMJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 17:12:09 -0400
From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: non-visible options vs menuconfigs
Date: Mon, 22 Apr 2013 17:12:19 -0400
References: <201304221251.54695.vapier@gentoo.org> <201304221419.51623.vapier@gentoo.org> <20130422202649.GD24143@free.fr>
In-Reply-To: <20130422202649.GD24143@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4156525.zSdKUAW17O";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304221712.21176.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

--nextPart4156525.zSdKUAW17O
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 22 April 2013 16:26:49 Yann E. MORIN wrote:
> On Mon, Apr 22, 2013 at 02:19:50PM -0400, Mike Frysinger wrote:
> > On Monday 22 April 2013 14:00:46 Yann E. MORIN wrote:
> > > As far as I remember, this has always been the behaviour of menuconfi=
g.
> > >=20
> > > What do you suggest the frontends do in this case, short of re-orderi=
ng
> > > the options (which I think is not correct) ?
> >=20
> > i think you missed a critical part of my proposal:
> > 	seems like *if a node is unprintable*, it should get skipped for
> > 	menuconfig purposes
>=20
> Ah, yes, I missed it. And it is part of the solutions I exposed, too:
>=20
>     On the other hand, we could consider dependent options as candidates
> for being sub-options until we see the first non-dependent option with a
> prompt.
>=20
> > to modify your example, i'm proposing a change for:
> > 	menuconfig MENU_A
> > 		bool "A"
> > =09
> > 	config OPT_B
> > 		bool
> > =09
> > 	config OPT_C
> > 		bool "C"
> > 		depends on MENU_A
> >=20
> > OPT_B is not shown to the user (there is no option text), therefore it
> > should automatically get skipped when searching for options to collapse
> > into the menuconfig MENU_A.
> >=20
> > i do agree that if OPT_B had text, then the existing behavior would be
> > unchanged.
>=20
> And as I pointed out, this would break as soon as an option with a prompt
> (which you call 'option text') is added in-between. For example, starting
> with:

sure.  i'm focusing on the non-displayed case since it wouldn't be a=20
behavioral change, and because that's the only reason that EXPERT broke. =20
there aren't EXPERT & non-EXPERT options there (at least, unintentional).  =
i=20
don't think we should worry about this case because, as you pointed out, we=
=20
already have kconfig language to enforce the behavior if truly desired.

using the EXPERT case as an example, i don't think we want the re-ordering =
as=20
this is a general knob.  we've got specific items which make more sense whe=
n=20
grouped elsewhere, and we've got a "dumping bucket" which the current EXPER=
T=20
menuconfig is designed to hold.

for example, checkpoint/restore makes more sense when grouped with=20
cgroups/namespace (and it actually appears *before* the EXPERT menuconfig, =
so=20
you'd have to build the entire tree first before doing possible re-
ordering/processing).

another example, the vmcounters/slub debug better fits with the non-expert=
=20
memory settings (like "choose your allocator").

> This would change the semantic of the language anyway, where currently
> your example disrupts the dependendcy chain. Granted, it looks like a
> good change, but I think we should not encourage people to be lazy, and
> we better want them to be careful about what they intend to do, about
> what they review and ack (myself largely included! :-] ).

sure, but i think we can segment this.  i don't think we should hassle=20
developers with details that make 0 difference to the end result.  that's w=
hy i=20
think automatically handling options that don't get displayed is OK.  but=20
resorting options and possible sticking them in different menus than what t=
he=20
source Kconfig files declare violates KISS.
=2Dmike

--nextPart4156525.zSdKUAW17O
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRdae1AAoJEEFjO5/oN/WBGJoP/0YtgrKXiah+PrbVCQJAEBdk
VDHJZf2xxaAELP1jC+WJesNfGEtJFApYQuenqVF9brM/gDYGWmJGysJHvfALd1Lz
4fTG3sda+trcIhO/uP1T4mWFxiAuWWGjZJ7b4OD3NiIZuqhdVLZJdcdS6zhnHpiB
SL4BkF8ZemsIKe494ufCQ50G93pyM1Io702/HTN0oLlH9qUUvtBXjPv4PyT/Aklr
lGTgstTLlhGkwaZyyOvo8QDaIfP4F0pBl6CToPaf7T9W8nqSxWoj3dKgWmFAomTL
LcacldoiPSvtdXdW5XbGSZTFh10yGZqfz9EE+Gd9UvHfY9hgrTOK1gTXC3IpphCL
QYW97ZZ5eGa9dC/k72RWYJW7Jl3xFHmRW1Nd0f+9WKdnPW5byG8SPHV5GOPEJDvd
q8oYH99ohlQPETuDnqxMuMCLOZlTJGhSsSMmEyoU/W3afuBhvSVUxuhbbJ3wMAi+
p16WZ5y+jm3WKmsPoBBVi1kpLTSpHi3Kw1hoaN/aimByDtYqwtdqh0qnwzPlleCu
FrHAklMe4VCfQQB0D4srQJh98737fnXoUOjo9RSQN3OQVXnqg5fcpyKNQtb8i9/R
JSJuT1F+XvRciTL38SUgkBIKzUMAi0CmG6g47sMK3REm+0LuTjpNIaNTegxRHRZR
GmNEnoi5fLogJ/0DIYf+
=MZWf
-----END PGP SIGNATURE-----

--nextPart4156525.zSdKUAW17O--
