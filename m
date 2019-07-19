Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:54667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfGSAgI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:36:08 -0400
Date: Fri, 19 Jul 2019 10:36:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719103605.5ee9198a@canb.auug.org.au>
In-Reply-To: <20190719100557.3ead3285@canb.auug.org.au>
References: <20190718133751.3cf036be@canb.auug.org.au>
        <127d228c-322d-6349-382b-d304974df148@infradead.org>
        <20190719100557.3ead3285@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bCrC30V_16tyleeOcNzjhRQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "Darrick J. Wong" <darrick.wong@oracle.com>

--Sig_/bCrC30V_16tyleeOcNzjhRQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 19 Jul 2019 10:05:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 18 Jul 2019 10:00:22 -0700 Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >
> > on x86_64, when CONFIG_BLOCK is not set:
> >=20
> >   CC      include/linux/iomap.h.s
> > In file included from <command-line>:0:0:
> > ./../include/linux/iomap.h: In function =E2=80=98iomap_sector=E2=80=99:
> > ./../include/linux/iomap.h:76:48: error: =E2=80=98SECTOR_SHIFT=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98SECTIONS_SH=
IFT=E2=80=99?
> >   return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
> >                                                 ^~~~~~~~~~~~ =20
>=20
> include/linux/iomap.h should only be used when CONFIG_BLOCK is set (if
> you follow the Kconfig trail).  So maybe this header should only be
> compile tested if CONFIG_BLOCK is set.

Or maybe fs/iomap/ needs to grow a private header file for stuff like
iomap_sector() ?

--=20
Cheers,
Stephen Rothwell

--Sig_/bCrC30V_16tyleeOcNzjhRQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0xEHUACgkQAVBC80lX
0GzBlAgAi0HSYElWpG7qvU6y21A8vri4QTUVA0mIE8DqRqX2pjgUOPmQaaGge2u+
Q58vKppAl1Dzt8qbUI9B6xBR4TrbXjqTTRhZHTuWwO0UbHB8rBW4amAVqZMFlXx6
iJq8CdnB/Cdltv434Nilsk5R9PIn3ePDgvyxuc9xgEJ3ZIckceT/zntjqNiJJUBs
egV9XQokaGfQRFKnVK6sqrRgZV0k7YU+Yb396N8I8+Zy3PKMCvj1WERFlp+BOmJ5
TTAii5R0hjA5cCLnYia6f4LCO+bNWduuuiv0/oUv32iv0yWpgFLKbqO+astE09f4
3JMCCpjfRvlGLUbZZTneZdp+h4AHlQ==
=+bDW
-----END PGP SIGNATURE-----

--Sig_/bCrC30V_16tyleeOcNzjhRQ--
