Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:54612 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750770AbaDNT1e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Apr 2014 15:27:34 -0400
Message-ID: <1397503641.31481.10.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] builddeb: fix missing headers in linux-headers package
 on arm architecture
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 14 Apr 2014 20:27:21 +0100
In-Reply-To: <1397477996-24575-1-git-send-email-fathi.boudra@linaro.org>
References: <1397477996-24575-1-git-send-email-fathi.boudra@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hLd+Cei5U/X3C5aiGocE"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-hLd+Cei5U/X3C5aiGocE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-04-14 at 15:19 +0300, Fathi Boudra wrote:
> The kernel headers package (linux-headers) doesn't include
> the arch/arm/mach-*/include header files.
>=20
> It makes the package unusable on ARM architecture and prevent
> out-of-tree modules build:
>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
>  fatal error: mach/memory.h: No such file or directory
>  #include <mach/memory.h>
>  ^
>  compilation terminated.
>=20
> While this patch explicitely test arm architecture, avr32 and blackfin ar=
e
> affected since they ship mach-* headers. However, they haven't been inclu=
ded
> in the test because they aren't official architectures supported by Debia=
n.

I don't see why you can't generically look for all include directories
in arch/$SRCARCH.  There also seem to be some files missing for several
other architectures:

arch/ia64/module.lds
arch/m68k/kernel/module.lds
arch/mips/Kbuild.platforms
arch/mips/*/Platform

In the Debian official packages we use these commands to find
arch-specific headers and scripts:

	  find arch/$(KERNEL_ARCH) -maxdepth 1 -name 'Makefile*' -print; \
	  find arch/$(KERNEL_ARCH) \( -name 'module.lds' -o -name 'Kbuild.platform=
s' -o -name 'Platform' \) -print; \
	  find $$(find arch/$(KERNEL_ARCH) \( -name include -o -name scripts \) -t=
ype d -print) -print; \

> minor tweak: clean up the linux-headers package by using tar exclude opti=
on.
[...]

Shouldn't that be a separate patch?

Ben.

--=20
Ben Hutchings
I say we take off; nuke the site from orbit.  It's the only way to be sure.

--=-hLd+Cei5U/X3C5aiGocE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU0w2mee/yOyVhhEJAQoN8g/+NWaMH9tkUg/GVdntZip66T8VLlXo70Oh
yzZ7IIKqiznEFUp6vL9E33n5yc918sNlisgr9gc04CNqKpHsg1KhrLkPiA4xDNsA
BMgm7EX8tFWGESk2DDYLkeVnllWKpnt0HKn4n1jcppIZsCE3XX8SOOomWMC/gLTN
FPCus/pREYn3A/2eTlQg0TTwVuqIUyivu6kJZLduM9fj2cEBb7BJ/Wiw6ndnGBw0
9MJq9NdSUNpZV+ih8MkcWF7VUmuZZy9W0GydWP5La3D/aNtv2uyoJtyU0MEf45qE
wJH5akAOTCwuG07HowDwUdMx62TXrIE35xsEBFQzIMbYxo47d63pGz6NoCJ0cf66
lbm5dezyvhAJjGbuvVMuLZoO49UgZ2JZTKpEpX3QrrqI8pMnEmdV+XOw6gPNwBiv
JasTz1RVODilZEZZGUgHv4i1npWreDIgWyaVFdYogW+jO8MtvAJufm/psTXg8dys
uWDNM0A3ykRo9F8oGp/WR0QjDTuEJEJ19PgyRxfO1sMEpmVWMUokt2RDocKAWiHY
HJIdHphxlucwM31c//mLY7a5RHhAC8mvvCaiXkCmlJRu5CcGmAP0V/FkmUKhAuC2
G69cX0RKslY1kepcGbNKlNY72UOyOwZCU34bj316ldJgX7q34jW9/B1nXd+tLaF7
IoeYIplzAlY=
=LS7D
-----END PGP SIGNATURE-----

--=-hLd+Cei5U/X3C5aiGocE--
