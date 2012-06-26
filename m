Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:47834 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758852Ab2FZSHw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jun 2012 14:07:52 -0400
Message-ID: <4FE9FA6F.3090808@nod.at>
Date: Tue, 26 Jun 2012 20:07:43 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: add a rule to just create one file for kernel
 doc
References: <1340732427-3747-1-git-send-email-sebastian@breakpoint.cc>
In-Reply-To: <1340732427-3747-1-git-send-email-sebastian@breakpoint.cc>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC7E5F18F092CDCE3460A6AE6"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC7E5F18F092CDCE3460A6AE6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am 26.06.2012 19:40, schrieb Sebastian Andrzej Siewior:
> If you are chaning the file and you want to verify that it looks good i=
t
> is helpfull to just re-run for the single file instead of running the
> complete htmldocs target.
>=20
> With this patch one can run
> |	make drivers/mtd/ubi/wl.html
> and create the output just for this file.
>=20
> Cc: Richard Weinberger <richard@nod.at>
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>

Acked-by: Richard Weinberger <richard@nod.at>


--------------enigC7E5F18F092CDCE3460A6AE6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP6fp0AAoJEN9758yqZn9efNgH/1nJJSZYSFARQnN9sCgfJjWy
0HwmmIaP7GjITOmq+JL8F/mpXFkQ7HRgbaK0FjZ/1d4+Fljm5FplMcZVqflS8F5o
YQ3yJ+puknb3ShpQwmkxF6Pf/oC8Ge5Sa/1ZvSJlFqYY+tefcD67WGl4pp1jwT3U
5InOTg7IBo7cs2TjfdBe9qo9gZzd6tN6mvZoq3TF5fIGhJnPRUhYv3Yn/5ONU4AJ
muvmwOstF3VdD5qAY8T5ls6pEW/7xQj7TVKeQNKD4dtxbjrau76QwRONWG/h2+Jo
40JF4PnsCTj3IR/pGL3HIhoZWKQ3Tio4Q8Aloy2mQBUTcd1LyL2cYvzaUbaXTVQ=
=e/BZ
-----END PGP SIGNATURE-----

--------------enigC7E5F18F092CDCE3460A6AE6--
