Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:40345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfG2MUw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 08:20:52 -0400
Date: Mon, 29 Jul 2019 22:20:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190729222045.4b491ffb@canb.auug.org.au>
In-Reply-To: <20190729092250.32670-1-efremov@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
        <20190729092250.32670-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ak=QLX=2NJUyzZgETBpXpbk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/Ak=QLX=2NJUyzZgETBpXpbk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Just a small note (nit? :-)):

On Mon, 29 Jul 2019 12:22:50 +0300 Denis Efremov <efremov@linux.com> wrote:
>
> +			if (s->is_static)
> +				warn("\"%s\" [%s] is the static %s\n",

This read a little wrong to me, maybe "is a static"?

--=20
Cheers,
Stephen Rothwell

--Sig_/Ak=QLX=2NJUyzZgETBpXpbk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+5J0ACgkQAVBC80lX
0GxG5wgApfJ4ZYIP4/nrvt1ZpHnsVu8rZOSuHQBxLepKCgo2wcYPrgDfSyyhrsYR
qK3mVW9IjuHCqRbbjoPQMzrHREdO11fIOvrGQyDNHE2FkUdkd1tr2SnBQmNov6LO
VtsyfEl6Iubq0Fv4RCALpas0lkdww7oz5fFIi10E51wX24p3q0OWLNJo3/6bsATi
XRuaH5VJ94fbWODxfQQeLpab+20pQABFUZQPM81pWG1jDHhod4IkCz1sJM/TC4IP
oOPhA9mBh/Pd8B9i88Mxcy1Jk62bkM7f1VG/lUHyY7hV8yTRHPlcGaHUgw2ye2XF
GiYlOFlRCmQKIpL1dt1JBY5kC286rw==
=Axup
-----END PGP SIGNATURE-----

--Sig_/Ak=QLX=2NJUyzZgETBpXpbk--
