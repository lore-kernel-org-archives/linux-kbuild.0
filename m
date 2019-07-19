Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:35307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbfGSAkm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jul 2019 20:40:42 -0400
Date: Fri, 19 Jul 2019 10:40:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Jul 18 (header build error)
Message-ID: <20190719104038.1d1f9a15@canb.auug.org.au>
In-Reply-To: <20190719003045.GF692234@magnolia>
References: <20190718133751.3cf036be@canb.auug.org.au>
        <127d228c-322d-6349-382b-d304974df148@infradead.org>
        <20190719100557.3ead3285@canb.auug.org.au>
        <20190719003045.GF692234@magnolia>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nX4Jeu6sxuCZYl9N82CPIAF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>

--Sig_/nX4Jeu6sxuCZYl9N82CPIAF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Darrick,

On Thu, 18 Jul 2019 17:30:45 -0700 "Darrick J. Wong" <darrick.wong@oracle.c=
om> wrote:
>
> ... oh, this is some weird "mash all the kernel headers together and see
> if they compile" thing, isn't it?  Um, yes, iomap.h should only be
> tested if CONFIG_IOMAP=3Dy (which in turn requires CONFIG_BLOCK=3Dy)

Actually it tries to build each header file on its own to see if it
include all its dependencies.

--=20
Cheers,
Stephen Rothwell

--Sig_/nX4Jeu6sxuCZYl9N82CPIAF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0xEYYACgkQAVBC80lX
0Gwjnwf/cpxl9GjFax+XTHpFksObgF3XDfOvv7FrK++PfETXXai/cL9CmG4r0KSY
m/s7MXlV83ONX4PmSB3LdMjMcPjYZFtuv5ZQ5LsAyupecwuJNDH7MEfH6F5pmx05
h4DEWwQTSauxRA9GXqUGApYNrzbXcauaUMy1kWyKO95owuNdQWFS5mGq0n3jL2dN
ClrPQuZZwPjvBRfrlJfJVe4/P8YluO5xJSGDCcFGmjiMc/zB71DoOHjWpP4ttS9J
/9J7EiaibV7dKQz6fl0uF5HnAyi2i0aD3/HCx4drT+kbMUWiohHlmxXJLyr5BW7j
tQAdbePufT0htEO3/XVLcm3+3PDyLg==
=GzlS
-----END PGP SIGNATURE-----

--Sig_/nX4Jeu6sxuCZYl9N82CPIAF--
