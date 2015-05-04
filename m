Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:49482 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750779AbbEDSW4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 May 2015 14:22:56 -0400
Message-ID: <1430763762.4113.173.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: fix stripped module signatures if
 CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 04 May 2015 19:22:42 +0100
In-Reply-To: <20150504153724.GA26392@nest>
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
	 <55365798.4090302@suse.cz> <20150422155700.GD32026@gluino>
	 <20150504153724.GA26392@nest>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nQksFOMZpdi6Tb1ZgpV5"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--=-nQksFOMZpdi6Tb1ZgpV5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2015-05-04 at 18:37 +0300, Andrey Skvortsov wrote:
> On 22 Apr, maximilian attems wrote:
> > On Tue, Apr 21, 2015 at 03:58:48PM +0200, Michal Marek wrote:
> > > (added Max to Cc)
> > >=20
> > > On 2015-03-16 09:20, Andrey Skvortsov wrote:
> > > > If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules=
 are
> > > > automatically signed in the result package, as it's for rpm-pkg, bi=
nrpm-pkg,
> > > > tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
> > > > is NOT set. In that case deb-package contains signed modules.
> > > >=20
> > > > But if CONFIG_DEBUG_INFO is set, builddeb creates separate package =
with
> > > > debug information. To do that, debug information from all modules
> > > > is copied into separate files by objcopy. And loadable kernel modul=
es are
> > > > stripped afterwards. Stripping removes previously (during modules_i=
nstall)
> > > > added signatures from loadable kernel modules. Therefore final deb-=
package
> > > > contains unsigned modules despite of set option CONFIG_MODULE_SIG_A=
LL.
> > > >=20
> > > > This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is=
 set
> > > > to solve this problem.
> > > >=20
> > > > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > >=20
> > > Max, Ben, are you fine with this patch? It looks OK to me, the
> > > modules_sign target has been added for this very purpose.
> > >=20
> >=20
> > Ben seems busy with the release, so jumping in. The patch looks
> > perfect to me.
> >=20
> > Acked-by: maximilian attems <max@stro.at>
> >=20
> Maximilian, thanks for the review.
>=20
> Michal, are we waiting for Ben's acknowledge too?

Don't wait for me.

Ben.

--=20
Ben Hutchings
If you seem to know what you are doing, you'll be given more to do.

--=-nQksFOMZpdi6Tb1ZgpV5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVUe49+e/yOyVhhEJAQpbjhAAyY+G6yazoTCjY+vWAioMRRdD0WCfaedX
DYiUXc+37wVcPpB57qIZbpvo/im8ygoMu43pvdl1X84ub47DP5g0wez8Q/2tP0qI
WUl6NVU/5JsDoaT1Adzu9URHFBNSzje/qpslyK0g+biwALtOGuNz72J5Jq/QR/WT
Fha9JL7HF3ejha7SMUGYMbsT6sHTzGyXcof+gc3Xt4aJz3PE9XhyBUMOIBE9ZfxH
MD++oUOox8dcnaBQuHvFGRpjbv+XRzZvRtkYBnxJCVDxpLI1fKyBa0aiUHVlKbts
jMoonKkAJC4fy+UpeG7OdQBXE2xxWn67BvCxfISsubodTr2c3MUWdkLfjS/L0C+f
w4cepi0C0QAhwbvt3BBQiOSKu/RCnDxM28HEOzpFHBJfY3oEKCDHIEYgZ4log2OX
zXO/XQdjG64s6/XYJZ8jsjrk078HwJocQ7qF5iF7xQ6BjRKUU318SfxRgYFm9nrC
ZYO5mCcdDlqpsz7AQNux3WRHignaM+y6/7PI3Hjn4cy3oUH0j298OG3zOOrC/bYM
66c/nDdb36g1tTmIskBx0urznnKMlM9RU5ZDtWsKNzPlX0fwPkXSIjGoKQb0yxw0
+QJWBsZd8BAM7dSlOhCFFyq+u2Sgn1dbKdMR44yrgp2pO2Wg4MglMGPGwA3F6nAR
PE/EvPrUMmY=
=dYxz
-----END PGP SIGNATURE-----

--=-nQksFOMZpdi6Tb1ZgpV5--
