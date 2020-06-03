Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCEYI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 00:24:08 -0400
Date: Wed, 3 Jun 2020 14:24:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ARCH=arm64 build breakage for Kbuild for-next branch
Message-ID: <20200603142404.33123d7d@canb.auug.org.au>
In-Reply-To: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
References: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 3 Jun 2020 13:11:59 +0900 Masahiro Yamada <masahiroy@kernel.org> wr=
ote:
>=20
> If you pull the latest kbuild for-next branch,
> ARCH=3Darm64 will fail to build.
>=20
> I will fix it soon.
>=20
> For today's linux-next, you can patch
> as follows.
> (or, you can use the old branch)
>=20
>=20
> diff --git a/Makefile b/Makefile
> index f80c4ff93ec9..fbb4b95ae648 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1074,7 +1074,7 @@ build-dirs        :=3D $(vmlinux-dirs)
>  clean-dirs     :=3D $(vmlinux-alldirs)
>=20
>  # Externally visible symbols (used by link-vmlinux.sh)
> -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(addsuffix built-in.a, $(core-y))
> +KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
>  KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>  ifdef CONFIG_MODULES
>  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))

OK, thanks, I will apply that at some point, since I have already
merged your tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XJeQACgkQAVBC80lX
0GzUbggAkU/kt74T6bUPKK+eofowxA+Kn0iM6h19munVmEu91EtXbQk1+BVhzB1U
Nc39JXnpDQtNP+Zw9E3L/NNriIj7pJZpRQrD+ER0i2w7GUtn7ZhuqhgvD2T8bwV4
BVBx3+boUwab72mPbvU8ZeaMnFkVqyYz9Y1fwx5QqWmZzfmzfcJq5G/iKd5yab7z
inzNPGWJIqkGOZSGzOjqsWc450TbL+ewYGVyQDFvW2a+P60pqMZ0WeFffy1u8Pqo
MR8YisqJNTIYkPbXP6TPJI0Vxy4w830TKB9Yb8tQlm5sYSVCnMd+5xAUAa4tY9iH
CnoNJbs+6i7xE9FIJ5MqSrmKCcBmUg==
=1GnE
-----END PGP SIGNATURE-----

--Sig_/3Zi8rxl9_RJnvHIR2Xal4Sa--
