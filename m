Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:40671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfGSAGA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:06:00 -0400
Date: Fri, 19 Jul 2019 10:05:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719100557.3ead3285@canb.auug.org.au>
In-Reply-To: <127d228c-322d-6349-382b-d304974df148@infradead.org>
References: <20190718133751.3cf036be@canb.auug.org.au>
        <127d228c-322d-6349-382b-d304974df148@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z1=xYY.a9cTfhHO35FJ79pe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "Darrick J. Wong" <darrick.wong@oracle.com>

--Sig_/z1=xYY.a9cTfhHO35FJ79pe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Jul 2019 10:00:22 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> on x86_64, when CONFIG_BLOCK is not set:
>=20
>   CC      include/linux/iomap.h.s
> In file included from <command-line>:0:0:
> ./../include/linux/iomap.h: In function =E2=80=98iomap_sector=E2=80=99:
> ./../include/linux/iomap.h:76:48: error: =E2=80=98SECTOR_SHIFT=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98SECTIONS_SHIF=
T=E2=80=99?
>   return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
>                                                 ^~~~~~~~~~~~

include/linux/iomap.h should only be used when CONFIG_BLOCK is set (if
you follow the Kconfig trail).  So maybe this header should only be
compile tested if CONFIG_BLOCK is set.

--=20
Cheers,
Stephen Rothwell

--Sig_/z1=xYY.a9cTfhHO35FJ79pe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0xCWUACgkQAVBC80lX
0GwSMAf/XraSYDqoBJY5K/r9UdR05YjdlfrPEbwsEwGFHCpL0u2m6jiwq9ciOo1R
E9MgT5vqxAOBTcm8hc4XK0msKMDUWwYso0O6/1BGjRARdUz3c8QHYjIYZ4oHV1nG
6R4vWHLBKs9YIusRCl7ZFYy364DGmvVAb9dwTc1L3ZF3Tu9vPlIn2ntsrc+Je/zA
A3OoztV9DKmXWmzL+XZHScEx391GX3pGo3zSL26w4rDpSwSjfFctL5EWo2p9mH2Z
KFkH0pYUxh2O50GS1XGWfVfmpo7mck6rfHRTuMyKkB2Oq67xFZg+Uh81axMR2hlZ
M2SCpbYCyCvX+2ZB9uTWpdB31FaytA==
=Zdp9
-----END PGP SIGNATURE-----

--Sig_/z1=xYY.a9cTfhHO35FJ79pe--
