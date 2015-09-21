Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:43656 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756670AbbIUSJb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Sep 2015 14:09:31 -0400
Message-ID: <1442858954.3511.1.camel@decadent.org.uk>
Subject: Re: [PATCH v2] builddeb: remove debian/files before build
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 21 Sep 2015 20:09:14 +0200
In-Reply-To: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
References: <1442340712-8991-1-git-send-email-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pl5rV/mg5ZNOJ+Dd2rhx"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: dsmythies@telus.net, kvalo@qca.qualcomm.com


--=-pl5rV/mg5ZNOJ+Dd2rhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-09-15 at 21:11 +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> As debian/files keeps accumulating entries, the changes file
> will end up growing indefinelty. Remove the file in clean
> rule and before build starts.
>=20
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> Reported-by: Doug Smythies <dsmythies@telus.net>
[...]

FWIW:

Acked-by: Ben Hutchings <ben@decadent.org.uk>

Ben.

--=20
Ben Hutchings
If the facts do not conform to your theory, they must be disposed of.
--=-pl5rV/mg5ZNOJ+Dd2rhx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVgBHyue/yOyVhhEJAQrZbA/+KUVpREZBtDfIoH/f9ROGe6Bk+/+ppcsb
6xZmflvydNtBpWA/u/M4l4iAvwhUFWDhvXu5uNOGd8n+O/NDwjFXafmPCGZvD8P1
xUF/I3QCRhWL1JebIY9oLf/XGosJVn/sZe5MYlWt37K45jDGwNoX4UmBphkpkRP0
H4YiUYYsnq9iXdSt10LyjFmLz66FJZPqAGmCUR1F6utVeaHb2K9Gm6hVM2WEoFkE
dgR/nhS9wD+asNQfJJBU19ghp2RD7op2VZQvgq5aURuJerdNFajPswGN17Iinypd
0I0LUGT5NFJ3I4LkHOI333teAxyPSdqief2QbNB0/NWOM5LcX/Wn25pb6wcAak2Z
hsm8QGbNkI0ButvmceCD3MZnqgXtnYifQtql6gKk9i5oYAKGQuF3GdTSFdJgQaaE
5x1hrxE5z9GRDwTcj7ExWE8U/BPK8c6sjG1Va7Tu2N9UXMpkASYz/QkQdP3tSKmj
t6Vlwdaidn566KeAE8h4gaBQcjotSh6RJLMh9kWaMJXGszugTYiZX0Lu9eMhYfHp
3sdhyJhd14UGS1AFU4/jv5s1hStnwOjCs+IK7qOeVO5V3XP69BY0aLp88LnDqJAk
1l+cO/7A3JDqiySpoVljrrxCNRZeXloXsnh1JUznyHdVINa3fXmsf1m0kwZedffr
mTiuuRP2wmw=
=FAPa
-----END PGP SIGNATURE-----

--=-pl5rV/mg5ZNOJ+Dd2rhx--
