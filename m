Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:46235 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730834AbeHGDMD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 23:12:03 -0400
Date: Tue, 7 Aug 2018 10:59:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20180807105955.06c70fc8@canb.auug.org.au>
In-Reply-To: <20180806222401.3d68fb28@canb.auug.org.au>
References: <20180806103738.794c479d@canb.auug.org.au>
        <20180806222401.3d68fb28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_kkL3JhGeO=lIDyC.DZ5KWL"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>

--Sig_/_kkL3JhGeO=lIDyC.DZ5KWL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Aug 2018 22:24:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Mon, 6 Aug 2018 10:37:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the vfs tree, today's linux-next build (x86_64 allmodconf=
ig)
> > failed like this:
> >=20
> > samples/statx/test-fsinfo.c:26:10: fatal error: linux/fsinfo.h: No such=
 file or directory
> >  #include <linux/fsinfo.h>
> >           ^~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem informa=
tion")
> >=20
> > I guess that headers_install (or whatever its called) has not bee run
> > before the sample code is built.
> >=20
> > I have applied the following patch for today:
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 6 Aug 2018 10:29:34 +1000
> > Subject: [PATCH] vfs: don;t build new sample programs yet
> >=20
> > It seems that headers_install is not done before the samples
> > are build so some needed include files are not in the right place.
> >=20
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  samples/statx/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/samples/statx/Makefile b/samples/statx/Makefile
> > index 05b4d30cdd3c..0b4d01822eca 100644
> > --- a/samples/statx/Makefile
> > +++ b/samples/statx/Makefile
> > @@ -1,5 +1,5 @@
> >  # List of programs to build
> > -hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx test-fsinfo test-fs-q=
uery
> > +hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx
> > =20
> >  # Tell kbuild to always build the programs
> >  always :=3D $(hostprogs-y) =20
>=20
> It turns out that commit
>=20
>   ba5214f7f40c ("vfs: Implement parameter value retrieval with fsinfo()")
>=20
> removed the "depends on BROKEN" from CONFIG_SAMPLE_STATX and that
> breaks other builds (at least allyesconfig on s390).

I have added the following suggested patch (I am sorry I can't
find/remember who pointed me to this patch) for today (I guess that it
should be merged via the vfs tree as that is what is causing the build
failures ... in which case a real patch should be supplied with
appropriate SOB line).  This seems to fix the current problem.

From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Aug 2018 10:33:43 +1000
Subject: [PATCH] Try to get the headers installed before we build the sampl=
es

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9e71826f67d7..d224d94c14be 100644
--- a/Makefile
+++ b/Makefile
@@ -1023,6 +1023,7 @@ endif
 # Build samples along the rest of the kernel
 ifdef CONFIG_SAMPLES
 vmlinux-dirs +=3D samples
+samples: headers_install
 endif
=20
 # The actual objects are generated when descending,
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/_kkL3JhGeO=lIDyC.DZ5KWL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlto7wsACgkQAVBC80lX
0GyqFwf/V7zzfUZUGOvR49NrOWKIg2pRQ7R+LfQwK1cYxPMoEYVKwrIScNNjZR6H
bBdmZRgNyZMVxJs/m4Hgn2AiYm0NluNWNVIbnqvievYhjIPLLzHGCT4TbpcRfrhY
uw8eQMgT8wvXb9b1dP8Tl8EKsAnSU4TcjavHsnpQQk6SDXhUGYB4gbclC/rkLDsH
ZZthCo/IRuH+59s/inTMITQseEaEEzdJN4O2uAQpLDhgtv90ksJwLDWS4BT/m+cn
m6EUZHOoujdRTQUQXHDFSqiNjz9Ri5sElTovZnxhsTHBmc+ab3/tAUBPiZFBuau8
HuYJ9MSOcBpnWavOMJHMm3VEhAX2lw==
=pJEY
-----END PGP SIGNATURE-----

--Sig_/_kkL3JhGeO=lIDyC.DZ5KWL--
