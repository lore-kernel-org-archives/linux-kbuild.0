Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:64541 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbfCGTFn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 14:05:43 -0500
Date: Thu, 7 Mar 2019 22:05:30 +0300
From: Arseny Maslennikov <ar@cs.msu.ru>
Message-ID: <20190307190530.GA25561@cello>
References: <20190221215901.23970-1-ar@cs.msu.ru>
 <CAK7LNAQrN1e1GYRd760pWiAdgY9_7Jda3QD_zozTNHpHOim4Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQrN1e1GYRd760pWiAdgY9_7Jda3QD_zozTNHpHOim4Xg@mail.gmail.com>
Subject: Re: [PATCH] scripts/package/Makefile: put proper config in source
 tarball
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2019 at 12:32:11AM +0900, Masahiro Yamada wrote:
> On Fri, Feb 22, 2019 at 7:19 AM Arseny Maslennikov <ar@cs.msu.ru> wrote:
> >
> > It is widely known that one can build a kernel without a .config in the
> > source tree
>=20
> "without a .config in the source file"  means
> KCONFIG_CONFIG will probably contain '..' or absolute path.
>=20
>=20
>=20
> ex1)  KCONFIG_CONFIG=3D../my_dir/.config
>=20
> ex2)  KCONFIG_CONFIG=3D/absolute/pass/to/my/.config
>=20

Hmm, I did not consider that; my bad, sorry.

>=20
>=20
>=20
>=20
> > by setting KCONFIG_CONFIG equal to the actual configuration
> > file path.
> >
> > When making a *-pkg target, make(1) prepares a source tarball and tries
> > to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
> > failing spectacularly if .config is absent and packing the wrong config
> > if it exists.
> > Let's fix that.
>=20
>=20
> Did you notice the log 'Removing leading ...' from tar
> for case ex1), ex2) ?
>=20
>=20
> masahiro@grover:~/ref/linux$ make -j8  KCONFIG_CONFIG=3D../.config  deb-p=
kg
> make clean
> /bin/bash ./scripts/package/mkdebian
>   TAR     linux-5.0.0+.tar.gz
> tar: Removing leading `../' from member names

Yes, I know tar does that. I mostly use KCONFIG_CONFIG with a bunch of
config files in the source tree, so did not experience this while making
sure the change makes sense.

>    ...
>=20
>=20
> Even if I apply 3/3, it will produce a broken source package
> since the tar will rip off the leading directory path,
> then it mismatches to KCONFIG_CONFIG recorded in debian/rules.
>=20
> A simple case like KCONFIG_CONFIG=3Dmy.config will work,
> but I am not convinced with 3/3.
>=20

So instead of this one and 3/3 we could ensure the source tarball
contains a .config equal to the contents of KCONFIG_CONFIG provided to
make(1), so the source package is fixed and its users are not confused.

If the following is ok, I'll send a v2.
A quick look at the generated orig tarball tells me it ought to work
well.

Something like this:

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 100a0d28ad25..8530fe267a76 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -44,6 +44,7 @@ if test "$(objtree)" !=3D "$(srctree)"; then \
 fi ; \
 $(srctree)/scripts/setlocalversion --save-scmversion; \
 tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
+	--absolute-names --transform 's:^$(KCONFIG_CONFIG):.config:S' \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
=20

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE56JD3UKTLEu/ddrm9dQjyAYL01AFAlyBa3QACgkQ9dQjyAYL
01CxSw/9HJEvBrWN5BU6rEohXfDzq1odRKDg/VVHBaogxpUilnCMhg79UPyTr2Te
Wl9Nobm4merPTYI94gHkYPNOV40Fk649cvfFq/zVJc0bna/SG1r3mDsJsGjaeeLF
/6LNpJslkCVS1+EStvKkkdTAPNVChMjkISCyRNR8LffXGnh8dJbBPNeB9SwSd41N
1BiVWWm4nx1Ol479jYzHdETpn3uQLectT/YrCienqQJdPKTsEfvdnCj/nu8Bhte1
Ztbwe2dAlxeM2+E57vvnT5vzLTxsCt7Sn3LycPbM+42cl9EQwcPt56eKAk7+DSe1
zRZ9RaKG9VMz7kiBd9HJZX0UsDKoMcZWHgOeqxlpZ6g849R//FMwM/K2M1dW4RTS
fQHDkBzklglbSd35OB7Fdi5YG/gYltD1hpjHht1yhECPjquNbJMkMz+S7Cqyox8M
TRUuqpwjJXS+RfVHp9rtaqB4Wv8XxArVkyQbJLhlWOo1wIM/IzCR2QjfJC6hSRIH
jB1/Qrh0kqLadjMmHcxTKk2J8hRG93W+79UPPcuVBaEWYUsUerKlSG9EVdWOwqxE
4WNujYXr0nWcjCjUFupJaPafc9KKDvnwZGzxFZ9ixpH2JzLPrr9niXfZAElJbn2a
IhtbTCb7FwpQZhzYEGtv4LGcf2YCFIxxmpdAiSlhHstSt52/8oQ=
=/0Sk
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
