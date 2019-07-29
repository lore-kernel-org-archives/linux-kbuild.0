Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:50349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbfG2FNz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 01:13:55 -0400
Date: Mon, 29 Jul 2019 15:13:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190729151351.24f9eeb9@canb.auug.org.au>
In-Reply-To: <20190728100906.18847-1-efremov@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
        <20190728100906.18847-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fSyd3K5KRCXREfTWGJHSsGT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/fSyd3K5KRCXREfTWGJHSsGT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Sun, 28 Jul 2019 13:09:06 +0300 Denis Efremov <efremov@linux.com> wrote:
>
> Thus, the current implementation adds approx. 1 min for allmodconfig.

Just a reminder that some of us (just me?) do well over 100+ builds per
day ...  if this can be optimised some what that would be good.

--=20
Cheers,
Stephen Rothwell

--Sig_/fSyd3K5KRCXREfTWGJHSsGT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+gI8ACgkQAVBC80lX
0GzDlAgAj8tlMdZYaX6/zkzdTuPCBG03dlkV7SVXM1VvedIhPgKU9iA2oCFuUGKI
g6gfwXKOXeInsNMJAcND2YQcsVuD83HOnwWCUXiWmKbLhwrauCj80x+F0LsVROan
mSGjEEJOZuI8UAcb4ER998RELlcoD4W4IZB1LS/pjBkhLOyqyptAlfjecH0ZfQ23
JWC0SsfpeGDNF4De4GBK9ozxuwx911ufpsHSO+0pVUMF48E5gXobj7l8ukApBJfH
RJ1dwLP5+OMeA+mTWRxdaIlLrZNOwO/NloYjuVGn8ICZf4VawxYxD71COB7xXwgo
dQdh9sT+0Yg9BkZIU3mR36GnbXPyqQ==
=LHxE
-----END PGP SIGNATURE-----

--Sig_/fSyd3K5KRCXREfTWGJHSsGT--
