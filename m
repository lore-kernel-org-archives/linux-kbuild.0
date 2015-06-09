Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:14451 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752106AbbFIH06 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Jun 2015 03:26:58 -0400
Received: from molly.corsac.net (unknown [78.194.244.226])
	by smtp2-g21.free.fr (Postfix) with ESMTPS id 1C9614B021B
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2015 09:24:42 +0200 (CEST)
Message-ID: <1433834784.3041.1.camel@debian.org>
Subject: Re: [2/2] deb-pkg: add source package
From: Yves-Alexis Perez <corsac@debian.org>
Date: Tue, 09 Jun 2015 09:26:24 +0200
In-Reply-To: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
References: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-I92HHozgJm64FYUKPGtY"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org, maximilian attems <maks@stro.at>


--=-I92HHozgJm64FYUKPGtY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On jeu., 2015-05-28 at 12:11 +0300, Riku Voipio wrote:
> +       dpkg-genchanges > ../linux-upstream_${packageversion}_
> ${debarch}.changes
> +else
> +       dpkg-genchanges -b > ../linux-upstream_${packageversion}_
> ${debarch}.changes

${debarch} seems empty here when using make deb-pkg, not too sure why
(I'm building using KBUILD_OUTPUT, not sure if it's related).

Regards,
--=20
Yves-Alexis

--=-I92HHozgJm64FYUKPGtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVdpUgAAoJEG3bU/KmdcClth8H/3uJfOMQ8pVszluSPbhEO7f8
+/NAllYGs+vsHfjUE2rP6ExU8/hNhZ11DeMdKs6+4emM3bQxSfWid2efIqu8+0dE
tpUf7Kv6xP60n+JcGx0vxqQh9YHYcXFVPCtVnbaI9nMFMBfYaBDTsMOugIz0uAAO
YJoRmGmN9v+DMg2FAF2Di0xqG0H2QrALRBU3rZtGRYJqCRCdpL47uHjXKTtYWoNv
Zaz/EBdSas/7XZcFkgkPFayB6chalhJOzBEduG1ZnYHr2vrb9dLXZyN57tzO+vte
ECVhMIblzGhIK7+cRd5er3plQVYYKmdlYWo+IcHtjujKoS/FfDQIgsEJgc3lDR4=
=rFGi
-----END PGP SIGNATURE-----

--=-I92HHozgJm64FYUKPGtY--
