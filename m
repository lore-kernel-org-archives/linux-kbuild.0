Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gagarine.paulk.fr ([109.190.93.129]:58288 "EHLO
	gagarine.paulk.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbcCZTDo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Mar 2016 15:03:44 -0400
Message-ID: <1459019060.971.3.camel@paulk.fr>
Subject: Re: [PATCH] kconfig: Add localdefconfig helper
From: Paul Kocialkowski <contact@paulk.fr>
Date: Sat, 26 Mar 2016 20:04:20 +0100
In-Reply-To: <20160326185306.GA4133@ravnborg.org>
References: <1459017087-11640-1-git-send-email-contact@paulk.fr>
	 <20160326185306.GA4133@ravnborg.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mJeRj/Oz1BRckw1neVaj"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>


--=-mJeRj/Oz1BRckw1neVaj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 26 mars 2016 =C3=A0 19:53 +0100, Sam Ravnborg a =C3=A9crit=C2=A0:
> On Sat, Mar 26, 2016 at 07:31:27PM +0100, Paul Kocialkowski wrote:
> >=20
> > This introduces a localdefconfig make target to specify out-of-tree def=
ault
> > configs. The out-of-tree default target is selected by defining
> > KBUILD_LOCALDEFCONFIG in the make command line.
> >=20
> > The intent of this change is to easily allow using default configs that=
 are
> > not
> > part of the kernel source (e.g. for a specific device or use case), wit=
hout
> > ever
> > touching the kernel source tree.
> >=20
> Does this differ from what you can achieve with KCONFIG_ALLCONFIG?
> See Documentation/kbuild/kconfig.txt
>=20
> From a quick glance the functionality is the same.

It looks like my suggestion is equivalent to specifying KCONFIG_ALLCONFIG a=
nd
running the alldefconfig target, indeed!

Thanks for pointing this out, I suppose this patch can be disregarded then.

Cheers,

--=20
Paul Kocialkowski, low-level free software developer on embedded devices

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/

--=-mJeRj/Oz1BRckw1neVaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW9t01AAoJEIT9weqP7pUM1OcP/AzKHr5gjlMKNPPmAQ954Al7
uGSxidO02uso+1N8VmJndIlYaifl2qsQWnOnpJG1QbT+Xaa8qUud/D/M9juCCA/1
pvoH/fYDV7aOeb6WR7nNmE2hp1IDIpJvVmGIFk5yS12YY0uX/eYmiunbS6/DASe3
V6jfNNZETbxRoitggm+2s4cg17GI37LY41RzAN9lBQZlIPXEWpppVeK0wV6P36BR
KMwN0xi11p/e6Q/BveM21lah+OS6nFYu1rE7lf+yvW9Zg6blX5BbMAkY2jPlnlGE
OpNSsdUEcMjbR1Hesd2RKAPWdQY/llqwh3Vrgy5fqCGY/izNtaX0QzmP3rmyGts0
eGiCFSkUZOrN+QpGIgOH6mlalL3J0Zyrgk56E2zNRm3SuXqJDE1oIgPDYCh8AVGH
ZUupu+UIknaq/X8FMv/N7o+zclFE7sWXzNyg/AXMG3KedgL+34mX9OaQmB5WcVha
akTQYJ5f+zdOI+2nYRze9sDs4mP8g6ojb5gTQb/zahlGbDgfumyW5XQQKuiIjacy
X2dnxrOVqlUPxbBulrfB/lLZD2TtBWZ6mREvZ9kfOdem/SPZ4CcvUskgqCEwcMyi
ONSgZn+WAxiVrVnBEBCPEiTIuyvScosRm+xYOQ+0Gs3nMxJRRWVXveHZ+gbFlxkc
M2ZctPUERNJegJn7SPN2
=iPCz
-----END PGP SIGNATURE-----

--=-mJeRj/Oz1BRckw1neVaj--

