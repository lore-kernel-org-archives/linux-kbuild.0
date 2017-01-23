Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51879 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750784AbdAWOoO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 09:44:14 -0500
Message-ID: <1485182646.2998.101.camel@decadent.org.uk>
Subject: Re: [PATCH v2 1/3] builddeb: Update a few outdated and hardcoded
 strings
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 23 Jan 2017 14:44:06 +0000
In-Reply-To: <20170123114011.4189-2-riku.voipio@linaro.org>
References: <20170123114011.4189-1-riku.voipio@linaro.org>
         <20170123114011.4189-2-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-lBv15X8b7TPAnFUD/+Hk"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: debian-kernel@lists.debian.org, Timo Sigurdsson <public_timo.s@silentcreek.de>


--=-lBv15X8b7TPAnFUD/+Hk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-01-23 at 13:40 +0200, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> The builddeb script has some hardcoded references to Linux version 2.6
> which is ancient. Drop Provides as the virtual packages provided are not
> useful anymore. Leave the Provides for linux-kernel-headers, as someone
> might still be referring to it.

I agree that these virtual packages are not useful.  Debian's official
kernel packages don't provide them any more as they that effectively
prevented auto-removal.

> While at it, updated copyright date and standards version.
[...]

Does it makes sense to specify a Standards-Version at all?  These
packages aren't really=C2=A0policy-compliant since e.g. packaging changes
aren't mentioned in the changelog.

Ben.

--=20
Ben Hutchings
Hoare's Law of Large Problems:
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Inside every large problem =
is a small problem struggling to get
out.


--=-lBv15X8b7TPAnFUD/+Hk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAliGFrYACgkQ57/I7JWG
EQmSvBAAzdm7YIBF4gCh99m7OveBzRmMV3DHQDSAsM5Pt+szazGBHW4uKRpLJIU7
gJ4GeomOJDu8+/RGkyusDnobpAxgyGHOKJTSCWDlAPpk4CCnlDN/tuLKNAPt+J2+
817ct6xeR8F8ga2TCv1IALp+8kS24f3ycXA+Ow4ogTA34mMzrovu5Xm+hQUB5Qui
xyfSnwyfv1dO3Y4cvHZD/SrISiu3TqzfCHPSttyLr+A/SdjXK6XrujxQqRe9w4R6
LO8T/iZUNsripKP/H6UWXJUEXFHw8yt6pqTAvWhhKrcPxfQztxb2PDVVU6mDfWWu
s2S8BxAytL5mLQeu+jL0YWc9Sr0NfQC68rNGz1LamqtOymQZQ8TikpXleHgVQqQz
jNZTuuBz1O6/PeKXdnW/ZjX48nUn6meSwnWj67C4luAUIsTR7mx85jI3knu09xo1
TRZgtar2dE9rJij/2N2cDHcoLfgLPXAff4asl8C/ED/Dk2pRFPh0xntXOjlKN0Gz
+H6JFyU4alzY6fTCQIeN3TyRZ0JHgUiWj4LKewseSMPKhoaqSoQRZaLTRhcDgQZT
IBgQR1sdDo9oUnSwcWCeAjKxhtFrTlFcnKPcGwJYLvuhZ3q/pBf0UQdzMqv2aSTW
XPH84hne2H550sDjPiiD21bQwMwbkAvIJE32ll8rYfPGQcg4eu0=
=TmG+
-----END PGP SIGNATURE-----

--=-lBv15X8b7TPAnFUD/+Hk--
