Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33988 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755530AbdLOUQl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 15:16:41 -0500
Date: Fri, 15 Dec 2017 21:16:39 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] fix perl locale warnings in arch/arm/boot/
Message-ID: <20171215201639.GA32042@amd>
References: <20171119222703.GA12824@amd>
 <CAK7LNARWMpxxC9hT8f7rGj5McjdNU1GXfjML9NbWFTCGyQ++dg@mail.gmail.com>
 <20171127094620.GA18072@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20171127094620.GA18072@amd>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, rmk+kernel@armlinux.org.uk, tony@atomide.com, j-keerthy@ti.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, Linus Torvalds <torvalds@linux-foundation.org>, olof@lixom.net, arm@kernel.org, Andrew Morton <akpm@osdl.org>, linux@armlinux.org.uk
Cc: kernel list <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2017-11-27 10:46:20, Pavel Machek wrote:
>=20
> Commit 429f7a062e3b5cf6fcf01eb00600cee5fe4d751f introduced perl into
> arch/arm/boot/compressed/Makefile, which unfortunately leads to locale
> warnings.
>=20
> Fix it by setting default locale.
>=20
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

RMK apparently can't be bothered to fix the stuff he broke. Can
someone take the patch? Arm-soc? Linus? Andrew?=20

Thanks,
								Pavel

> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed=
/Makefile
> index 45a6b9b..4656e98 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -118,7 +118,7 @@ asflags-y :=3D -DZIMAGE
> =20
>  # Supply kernel BSS size to the decompressor via a linker symbol.
>  KBSS_SZ =3D $(shell $(CROSS_COMPILE)nm $(obj)/../../../../vmlinux | \
> -		perl -e 'while (<>) { \
> +		LC_ALL=3DC perl -e 'while (<>) { \
>  			$$bss_start=3Dhex($$1) if /^([[:xdigit:]]+) B __bss_start$$/; \
>  			$$bss_end=3Dhex($$1) if /^([[:xdigit:]]+) B __bss_stop$$/; \
>  		}; printf "%d\n", $$bss_end - $$bss_start;')
>=20
>=20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlo0LacACgkQMOfwapXb+vJnOQCfe5si+9TJ1IZAsiq02yPF/M7x
5VQAn2WmOB/KpCAsZwAhj6y5qg52M7P+
=T1J7
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
