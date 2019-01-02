Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:49014 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728983AbfABTsT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 14:48:19 -0500
Message-ID: <f1334713b98ce0133988f5ff590ee90b81cf30d9.camel@decadent.org.uk>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 02 Jan 2019 19:48:12 +0000
In-Reply-To: <20190102092304.27262-1-riku.voipio@linaro.org>
References: <20190102092304.27262-1-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-QnFgQyGX3XuiYavtYjNJ"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, manivannan.sadhasivam@linaro.org, debian-kernel@lists.debian.org


--=-QnFgQyGX3XuiYavtYjNJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-01-02 at 11:23 +0200, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> bison/flex is now needed always for building for kconfig. Some build
> dependencies depend on kernel configuration, enable them as needed:
>=20
> - libelf-dev when UNWINDER_ORC is set
> - libssl-dev for SYSTEM_TRUSTED_KEYRING
>=20
> Since the libssl-dev is needed for extract_cert binary, denote with
> :native to install the libssl-dev for the build machines
> architecture,
> rather than for the architecture of the kernel being built.
>=20
> Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> ---
> v2: commit message updated
> ---
>  scripts/package/mkdebian | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index edcad61fe3cd..c858abf4569e 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -134,6 +134,8 @@ fi
> =20
>  mkdir -p debian/
>  echo $debarch > debian/arch
> +extra_build_depends=3D", $(if_enabled_echo UNWINDER_ORC libelf-dev)"
> +extra_build_depends=3D"$extra_build_depends, $(if_enabled_echo SYSTEM_TR=
USTED_KEYRING libssl-dev:native)"
> =20
>  # Generate a simple changelog template
>  cat <<EOF > debian/changelog
> @@ -170,7 +172,7 @@ Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> -Build-Depends: bc, kmod, cpio
> +Build-Depends: bc, kmod, cpio, bison, flex $extra_build_depends
>  Homepage: http://www.kernel.org/
> =20
>  Package: $packagename
--=20
Ben Hutchings
Absolutum obsoletum. (If it works, it's out of date.) - Stafford Beer



--=-QnFgQyGX3XuiYavtYjNJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlwtFXwACgkQ57/I7JWG
EQlaLhAAoOdyRCoA/voz9N1Dy3N03oTI68G4E8HvXUBw3EPPPWjuCS/0M4UhI+PF
YvBTdiandJE8HA20WtJKPgvstiXrOIAoy+kPmYkCmBTci0SjcEErQyBdFRlcD7ES
LeqdNKcCdxlUo8rlnVD6yL1dh/1VHjwWMoa8/PoW7fYM9WBdlrA5AbmbxHE+rDzt
lmF5GKf9jyXcMH0Effnnpbpnhou8YHYLWUDSGSEWKip/JjfmLdH8P7YNnyYhkh3Q
SBqYEQ06P8wHFSyRJTsvUmbDFdzw97jyl3V+/lCGUat0zteoGH230KDv+UdQlWRr
CYagAf9rs8eWab67+dETYNBnup6ddB6677T8RkF9936ZGFiqaX/KMAtlEX1RS2LZ
L6mLSPhH+8lJIJFSEwiKct1tcOJoTXUL4U9WVWxCShoTZ3lLTe6KygHgHcnMmEqc
rn9zBix5DAX/p4WHXvHb1dPqDx7rz7JU9xpfgUgmCDY1HaAEROgmHouy/k76Pfks
sBBZUQyyEhk85mEIjnDzrt9aThA4acD+F+P4c3y0ZghF92nTAu349S7E+MvqcVhT
E3S+drkzjWCxgKoCmIsl4N+mjaHfLXu29AzN8zB3mvDaLE+1cn4DShgtdsI3Vq1U
e6Zo31rmNK0eFRbtJrY8qcZJcjF7CYoNOwxd5xTZyv2BU278J1E=
=Zb9u
-----END PGP SIGNATURE-----

--=-QnFgQyGX3XuiYavtYjNJ--
