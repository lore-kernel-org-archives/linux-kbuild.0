Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:2302 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754879AbbEPJo0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 May 2015 05:44:26 -0400
Received: from molly.corsac.net (unknown [78.194.244.226])
	by smtp2-g21.free.fr (Postfix) with ESMTPS id 0646A4B0117
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2015 11:43:17 +0200 (CEST)
Message-ID: <1431769429.14305.29.camel@debian.org>
Subject: Re: [PATCH] builddeb: generate a changes file from the build
From: Yves-Alexis Perez <corsac@debian.org>
Date: Sat, 16 May 2015 11:43:49 +0200
In-Reply-To: <1431606908-20880-1-git-send-email-corsac@debian.org>
References: <1431606908-20880-1-git-send-email-corsac@debian.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-p+h9EO6GTvQpYokk+z/8"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--=-p+h9EO6GTvQpYokk+z/8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On jeu., 2015-05-14 at 14:35 +0200, Yves-Alexis Perez wrote:

> +# Generate a change file
> +(cd $KBUILD_OUTPUT; dpkg-genchanges -b > ../linux_${packageversion}_${de=
barch}.changes)
> +

Actually cwd during the build is KBUILD_OUTPUT already, so the cd part
is unnecessary (I can resend a v2 if really needed).

Regards,
--=20
Yves-Alexis

--=-p+h9EO6GTvQpYokk+z/8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVVxFVAAoJEG3bU/KmdcCl1qYIAJzVFNQwwQYo192ypXPmFpBJ
H/5FUTnzdDT0iMpkenJFq8YO2a8mAGpettU0FVPy/GYf0RMr2memTi2zSx1wiIhw
id5wWArAHVRs8oqx11sLxw/+yE6aLCYmMfcs4bTWGqGEpab/3eaIiDU2P4xdrst7
WxKoHOuJXYkdBHdj2DbeHl5WHJNkZ1E1unzIXgWxZjKhR+UxCGwEv1f4Hn9UyIlg
TU2AE/KSiInvX60DzAYMqAjAID/tqmcuYzuowsLHQ8Zdfrp7xamsrxpj5ZRL1oxw
Muq8a3RSiE9pmWUavKumyxb4chF/a3bLSYdrG0Zb1otapoYH19STm9FbeomyrSU=
=uM8h
-----END PGP SIGNATURE-----

--=-p+h9EO6GTvQpYokk+z/8--
