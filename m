Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:40881 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752166Ab3FODLq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 23:11:46 -0400
Message-ID: <1371265896.3776.2.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v5 1/4] deb-pkg: use KCONFIG_CONFIG instead of .config
 file directly
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 15 Jun 2013 04:11:36 +0100
In-Reply-To: <1371203217-19572-2-git-send-email-anisse@astier.eu>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	 <1371203217-19572-2-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/IDqbPqAc/mKZLwYPUtO"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>


--=-/IDqbPqAc/mKZLwYPUtO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-06-14 at 11:46 +0200, Anisse Astier wrote:
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Cc: Ben Hutchings <ben@decadent.org.uk>
[...]
> @@ -245,7 +245,7 @@ fi
>  # Build header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl =
> "$objtree/debian/hdrsrcfiles")
>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$ob=
jtree/debian/hdrsrcfiles")
> -(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include =
scripts -type f >> "$objtree/debian/hdrobjfiles")
> +(cd $objtree; find arch/$SRCARCH/include $KCONFIG_CONFIG Module.symvers =
include scripts -type f >> "$objtree/debian/hdrobjfiles")
[...]

I think $KCONFIG_CONFIG needs to be handled specially here - it should
be installed as .config in the linux-headers package, since you can't
assume the environment variable is set when that package is used.

Ben.

--=20
Ben Hutchings
If the facts do not conform to your theory, they must be disposed of.

--=-/IDqbPqAc/mKZLwYPUtO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUbvbaOe/yOyVhhEJAQqkZQ/8DL0Z/9Odw0TSK9wddF4uwk3upjgYqcK4
BcB2b02SGEX9GaueCIwKYgrzUjrGVWzpqSLabURWhW0RxDUNf5IjxNodL+/i7qJm
KniD1iz/8kk1u1jHbH3ZXkGlt3cc3WOXYZOW1c6kYdn0aBzmzgrhne2KmR5NyQBo
eA2BNORWyCYQtIqaK68sP7gTQl0B/Rozwe/SakdBHLjOydjsPzBz8FjcP9Cha3HE
Jgq+u3OmvmvHnBTmIdLCPa7lTFLDBmPpCm6eOO8LwwRe0wbY8Ex9MCXKk5fwzllr
BMXV6If4lkEfW4R0n1e7NrodTj5YZwLVqVfou99rVmlzkKHTHQwQDtnx4+JYdB2B
W+pHwT8TvW/RpD4k7D7oZkau4pnIWr/TWsQmV+xQWWiF20XwsdEuCYu5fCZOmXDz
Ob+TCbfkoL4q7uIdngQmOAggM4qFx44/PbD7Oh3FcsIVatp7Y0AhyUSNHwKDDdVB
aoS/UzfwQpoiWA1b8ZKTHJwQv2oCGuvUkTn56Xd5Dv1HjgRdhi3JepzuWt18lAQw
VHnphumwtIpaC9eXsAd4sHnj1JhCVijjfjKqafzowVsecvH5nF6x1ZX05XyuuspJ
qDE+FFvD7Ge69L2TvDrIj+r6YDfvzqCSqdw55DlIjQhrZsPRG9nGJwL34W2msgNK
Gqdjl/n9L5c=
=JK+1
-----END PGP SIGNATURE-----

--=-/IDqbPqAc/mKZLwYPUtO--
