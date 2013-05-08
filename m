Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55906 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752065Ab3EHDyO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 23:54:14 -0400
Message-ID: <1367985245.4131.188.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v4 3/4] deb-pkg: fix installed image path on parisc,
 mips and powerpc
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 08 May 2013 04:54:05 +0100
In-Reply-To: <1367941611-12223-4-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
	 <1367941611-12223-4-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zFjIzzmRXMncVKDoWttj"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com


--=-zFjIzzmRXMncVKDoWttj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-05-07 at 17:46 +0200, Anisse Astier wrote:
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  scripts/package/builddeb | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 797484b..73bb551 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -89,6 +89,18 @@ if [ "$ARCH" =3D "um" ] ; then
>  	packagename=3Duser-mode-linux-$version
>  fi
> =20
> +# Not all arches have the same installed path in debian
> +case $ARCH in
> +um)
> +	installed_image_path=3D"usr/bin/linux-$version"
> +	;;
> +parisc|mips|powerpc)
> +	installed_image_path=3D"boot/vmlinux-$version"
> +	;;
> +*)
> +	installed_image_path=3D"boot/vmlinuz-$version"
> +esac
[...]

This certainly matches the naming we use in official Debian kernel
packages.  The intent was, I think, to match what 'make install' would
do, but with the version suffix.  We've diverged from that slightly in
that some MIPS platforms now support compressed kernel images which are
installed as vmlinuz.

So, you can consider this:

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

However I think we could improve on this by making each architecture
Makefile define the canonical installed name of the kernel image.

Ben.

--=20
Ben Hutchings
For every action, there is an equal and opposite criticism. - Harrison

--=-zFjIzzmRXMncVKDoWttj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUYnMXee/yOyVhhEJAQpj1A//UG8/h1cIovAP+gBBV9nLTBjX4f5pOz4y
p7Ef3+aNwBFw1mvsMVQdzzSszwVsP8zf9zGPH8RrdOtmYYoCFRkj1vOUI8fULS4p
I1wW03fqscsKRHcHC1Ci+hVlinoYaMzhKbdODM2GeTOnn3NeJYBw13Slnxj2vve5
kX5abLf/eYu9pbc/qKHzd7mtDuhQrbotzpU9uevvJy80PKAUh7o4T2WJygkHv6Zi
DW0aEVtRsMpxRyBse5bdksQCaEkY/Vi6rc4qAvOoohqdUFPPhsDeTFvmVCmAJfFU
JO8alhYTBpx6pZKDFEtr5oa4G/BKQr1aG2U39eA1jTW5Q+TXNeKkYnRJq9nxFqJK
4ZCySthRI2YmTYXhrKpFRG7g30ji8FFzplAtJRi5uWWn+jx4h89zJkIXQgdCOvt/
xsoGjZe3US4IY9Wx7cDqNuUojAWjdcThrc5LBi2D5G9ASyvrHsQDDEiUCiSyEddk
TTyOEqxeap31PTanwUqatjOSeeTt7P61hjTgPYONx09LW+zYKNODhVh2v8vdUQEo
+XiqPCLNE3ynV26Krny0+wZjT14K+b4WpMkfD++IIgsYQlcpgE7//JkHQKcGPT0n
CvWQloX9gnme3gVYGaFIFSmcNtdQFgxteJ1gAw7Knd6gDp+PaSiI20JAIYhlLs5K
PHdiqgJezug=
=Cl+W
-----END PGP SIGNATURE-----

--=-zFjIzzmRXMncVKDoWttj--
