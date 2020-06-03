Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:57759 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCLWw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 07:22:52 -0400
Date: Wed, 3 Jun 2020 21:22:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: ARCH=arm64 build breakage for Kbuild for-next branch
Message-ID: <20200603212250.69feb53b@canb.auug.org.au>
In-Reply-To: <20200603142404.33123d7d@canb.auug.org.au>
References: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
        <20200603142404.33123d7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cBciKtCFp0OIoiyBGlNwe.K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--Sig_/cBciKtCFp0OIoiyBGlNwe.K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 3 Jun 2020 14:24:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Wed, 3 Jun 2020 13:11:59 +0900 Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> >=20
> > If you pull the latest kbuild for-next branch,
> > ARCH=3Darm64 will fail to build.
> >=20
> > I will fix it soon.
> >=20
> > For today's linux-next, you can patch
> > as follows.
> > (or, you can use the old branch)
> >=20
> >=20
> > diff --git a/Makefile b/Makefile
> > index f80c4ff93ec9..fbb4b95ae648 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1074,7 +1074,7 @@ build-dirs        :=3D $(vmlinux-dirs)
> >  clean-dirs     :=3D $(vmlinux-alldirs)
> >=20
> >  # Externally visible symbols (used by link-vmlinux.sh)
> > -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(addsuffix built-in.a, $(core-y))
> > +KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-=
y))
> >  KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y=
)))
> >  ifdef CONFIG_MODULES
> >  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y=
))) =20
>=20
> OK, thanks, I will apply that at some point, since I have already
> merged your tree.

And then I forgot, sorry.  I assume it will be fixed tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/cBciKtCFp0OIoiyBGlNwe.K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XiAoACgkQAVBC80lX
0GzHtQgAkznUzjiD/EXRvERR3mezHb9xSY0/NtQ511uFdc7cNANutqCQqbnL8xCY
FRAzIvnbeQDCYieBjb8BWcNMj37j2KkBMbQMnsooDxa8iofFwRt2WWDFtSzFXCaD
XbY1MvCTBqUM26DsploHRAXWLeLXk6+rEJGgmEKSQjF6iiAAf83yRJQP5y2meOEw
eIGykNstUQJvsKJT+j6KvUyMuvcTCkGXjPgQSVnEH+PhWoK9M7VWvASlfpWncrR8
PQoQwRNiG0CIIXP0WKGkOc4A5yQGnjajdPQzXYzx5kDGDtAs14ciIpA+YXJyGRKQ
8PIvofk+LjavLWpp3cbo7a4A8/bzBg==
=JgD9
-----END PGP SIGNATURE-----

--Sig_/cBciKtCFp0OIoiyBGlNwe.K--
