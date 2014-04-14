Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:54658 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750873AbaDNT4J (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Apr 2014 15:56:09 -0400
Message-ID: <1397505357.31481.24.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH] deb-pkg: install device tree blobs in linux-image
 package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 14 Apr 2014 20:55:57 +0100
In-Reply-To: <1397322931-16688-1-git-send-email-fathi.boudra@linaro.org>
References: <1397322931-16688-1-git-send-email-fathi.boudra@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vgFsDHm0fR1M6XTf8U8R"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>


--=-vgFsDHm0fR1M6XTf8U8R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2014-04-12 at 20:15 +0300, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  scripts/package/builddeb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..24cb3b1 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -165,6 +165,11 @@ if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; t=
hen
>  	fi
>  fi
> =20
> +if grep -q '^CONFIG_OF=3Dy' $KCONFIG_CONFIG ; then
> +	mkdir -p "$tmpdir/boot/dtb/$version"

The boot loader only needs to read at most one of the installed DTB
files on any given system, and you can't in general expect it to read a
DTB from the filesystem.  So why not install them in
/usr/lib/linux-image-$version where flash-kernel expects?

> +	INSTALL_DTBS_PATH=3D"$tmpdir/boot/dtb/$version" $MAKE KBUILD_SRC=3D dtb=
s_install
> +fi
> +

The dtbs_install target is (currently) specific to arm so this appears
to break other architectures where CONFIG_OF is used.

(But it's good to know that it's there, and we should maybe start using
it in the Debian official packages.)

Ben.

>  if [ "$ARCH" !=3D "um" ]; then
>  	$MAKE headers_check KBUILD_SRC=3D
>  	$MAKE headers_install KBUILD_SRC=3D INSTALL_HDR_PATH=3D"$libc_headers_d=
ir/usr"

--=20
Ben Hutchings
I say we take off; nuke the site from orbit.  It's the only way to be sure.

--=-vgFsDHm0fR1M6XTf8U8R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU0w9Tee/yOyVhhEJAQrzzg/+K0nDU6IFsQHVQRmS4jddrRAE2VM8O1X6
/rz1yQE7TMkvYzovn3yTiD/px4P8ImldmCa7fVvVIQ78vzkDfXDZN1nKi/+THcw6
bu8xNtoaH3UAo3u8L+GDSFMocS306wUnxGrURDiCy49cl2FMnOeWeBrMxhrerHLE
mQxCG0yO6QDFoF6K4hfrRQfvFMaA36vuVkkmD62LQTHOJvTjwG1iv9nhdOHL8ULN
76HetGAtcA8fmtFCjk0e2d4oQHFJD4bxoEaZPzZzoWo3yMhDYCKGl5FVGsyoICW9
ZWVVHjGIInwD1ykgr3b8ccOJqB6lRmmpIBVg8gSmzAWLa7mmZ4SENorbSQR5h2uJ
VvahOm95LXtWoD7FhC+XTtq+zRU0ktysVCyB1SGhkKsdTuOxKEHQGHD2kLEN1sV/
E/uX+vZeEPdUjEh5NzKAP6dUJfzQCVVB1z32eQxxh7xex44ph6g/FC4qM6qN2iB7
QiiY3rt3mWB+EaSR88+X0u8BLkEV12z1pFTZC4KZIk77Wekl/LDuZ079kmQg/vt5
0BWBw/elI88bmFutdK7aGTD7jGbGqXp9Vggi3QozdLlYOKjO4CS2fz1rZczvUg/Q
rimyP1BQxoThvUubApzPLxF0gJLPRGQvdTVvdGst72aSJApK6jDKrx5J0512gxn+
AoNJkLy+18U=
=UAGS
-----END PGP SIGNATURE-----

--=-vgFsDHm0fR1M6XTf8U8R--
