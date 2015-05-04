Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:35029 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbbEDPh2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 May 2015 11:37:28 -0400
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Date: Mon, 4 May 2015 18:37:24 +0300
Subject: Re: [PATCH] builddeb: fix stripped module signatures if
 CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
Message-ID: <20150504153724.GA26392@nest>
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
 <55365798.4090302@suse.cz>
 <20150422155700.GD32026@gluino>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <20150422155700.GD32026@gluino>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22 Apr, maximilian attems wrote:
> On Tue, Apr 21, 2015 at 03:58:48PM +0200, Michal Marek wrote:
> > (added Max to Cc)
> >=20
> > On 2015-03-16 09:20, Andrey Skvortsov wrote:
> > > If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules a=
re
> > > automatically signed in the result package, as it's for rpm-pkg, binr=
pm-pkg,
> > > tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
> > > is NOT set. In that case deb-package contains signed modules.
> > >=20
> > > But if CONFIG_DEBUG_INFO is set, builddeb creates separate package wi=
th
> > > debug information. To do that, debug information from all modules
> > > is copied into separate files by objcopy. And loadable kernel modules=
 are
> > > stripped afterwards. Stripping removes previously (during modules_ins=
tall)
> > > added signatures from loadable kernel modules. Therefore final deb-pa=
ckage
> > > contains unsigned modules despite of set option CONFIG_MODULE_SIG_ALL.
> > >=20
> > > This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is s=
et
> > > to solve this problem.
> > >=20
> > > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >=20
> > Max, Ben, are you fine with this patch? It looks OK to me, the
> > modules_sign target has been added for this very purpose.
> >=20
>=20
> Ben seems busy with the release, so jumping in. The patch looks
> perfect to me.
>=20
> Acked-by: maximilian attems <max@stro.at>
>=20
Maximilian, thanks for the review.

Michal, are we waiting for Ben's acknowledge too?

--=20
Best regards,
Andrey Skvortsov

Secure e-mail with gnupg: See http://www.gnupg.org/
PGP Key ID: 0x57A3AEAD



--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVR5I0AAoJEAF8y6L1SLCt14kP/jG/ygQ1hDCfqoPDTkJGsBx0
WNZ3toN/dtXyYpi2NLTn+OiSMjLXUxgzW2JCk1T9PBKOkpUBJSDUN/e9isJ90686
1ssiXD43h1fdk+urjK3EyhcQLFovTNNfPNihneAr+RbNu0gJMXC9YYUBM1pYnrSN
HM3GdsjpK+uzlAbxCp6mIYtRrogf7YdA1nwwsdLZEFvM8L2xusOSZFYfQJOOjLga
vC9pkWUDDIw8FVfapBwqPznA6FHMZgf8WU0ZNOsyGCY/VuftuTtupoREuiW49jgK
m+8XdmjTGBItv84YfB7YtvWMgMqsdp6XuUeEltHBvjbQjiezqUS5vVxfOcMdU83I
o9EQpIYA6RoNl7sRovq09LpECTs5/Pdqta9iVU8a7E2yiHVnUHfk0FWWM0P9yNGh
5kFnLDXbiwpznaq+jrJTODIR+64rk7M5eT6R1QBYPKc54tS16HOEZ4358zv7JwQs
DxJyX+926KqMbwLY3A62G6lbB+wTl7ljpXuHspsqkJB+LD2uPsJ/3jdFQfubCqjD
dZJTEIzsqS572jvLeyJ+Kk6CBZO+pvry83UPzEIAdpOdpcgml/dFm13ka3e0+XEB
+Giv7d7ihw1BBfg2RZ6xrvSN2jtNqwZgEE+oeXdImIk8+v15ViITmEJpnds/2V3L
6PG3B+5DZdp6UL3YvD3U
=oQZv
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
