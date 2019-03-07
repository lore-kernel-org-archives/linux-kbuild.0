Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:56888 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbfCGTIz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 14:08:55 -0500
Date: Thu, 7 Mar 2019 22:08:49 +0300
From: Arseny Maslennikov <ar@cs.msu.ru>
Message-ID: <20190307190849.GB25561@cello>
References: <20190221215901.23970-1-ar@cs.msu.ru>
 <CAK7LNAQrN1e1GYRd760pWiAdgY9_7Jda3QD_zozTNHpHOim4Xg@mail.gmail.com>
 <20190307190530.GA25561@cello>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <20190307190530.GA25561@cello>
Subject: Re: [PATCH] scripts/package/Makefile: put proper config in source
 tarball
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 10:05:30PM +0300, Arseny Maslennikov wrote:
> On Fri, Mar 08, 2019 at 12:32:11AM +0900, Masahiro Yamada wrote:
> > On Fri, Feb 22, 2019 at 7:19 AM Arseny Maslennikov <ar@cs.msu.ru> wrote:
> > >
> > > It is widely known that one can build a kernel without a .config in t=
he
> > > source tree
> >=20
> > "without a .config in the source file"  means
> > KCONFIG_CONFIG will probably contain '..' or absolute path.
> >=20
> >=20
> >=20
> > ex1)  KCONFIG_CONFIG=3D../my_dir/.config
> >=20
> > ex2)  KCONFIG_CONFIG=3D/absolute/pass/to/my/.config
> >=20
>=20
> Hmm, I did not consider that; my bad, sorry.
>=20
> >=20
> >=20
> >=20
> >=20
> > > by setting KCONFIG_CONFIG equal to the actual configuration
> > > file path.
> > >
> > > When making a *-pkg target, make(1) prepares a source tarball and tri=
es
> > > to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
> > > failing spectacularly if .config is absent and packing the wrong conf=
ig
> > > if it exists.
> > > Let's fix that.
> >=20
> >=20
> > Did you notice the log 'Removing leading ...' from tar
> > for case ex1), ex2) ?
> >=20
> >=20
> > masahiro@grover:~/ref/linux$ make -j8  KCONFIG_CONFIG=3D../.config  deb=
-pkg
> > make clean
> > /bin/bash ./scripts/package/mkdebian
> >   TAR     linux-5.0.0+.tar.gz
> > tar: Removing leading `../' from member names
>=20
> Yes, I know tar does that. I mostly use KCONFIG_CONFIG with a bunch of
> config files in the source tree, so did not experience this while making
> sure the change makes sense.
>=20
> >    ...
> >=20
> >=20
> > Even if I apply 3/3, it will produce a broken source package
> > since the tar will rip off the leading directory path,
> > then it mismatches to KCONFIG_CONFIG recorded in debian/rules.
> >=20
> > A simple case like KCONFIG_CONFIG=3Dmy.config will work,
> > but I am not convinced with 3/3.
> >=20
>=20
> So instead of this one and 3/3 we could ensure the source tarball
> contains a .config equal to the contents of KCONFIG_CONFIG provided to
> make(1), so the source package is fixed and its users are not confused.
>=20
> If the following is ok, I'll send a v2.
> A quick look at the generated orig tarball tells me it ought to work
> well.
>=20
> Something like this:
>=20
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 100a0d28ad25..8530fe267a76 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -44,6 +44,7 @@ if test "$(objtree)" !=3D "$(srctree)"; then \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
>  tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +	--absolute-names --transform 's:^$(KCONFIG_CONFIG):.config:S' \

GNU tar seems to trim the paths of archive members first and only then
consider the --transform rules, so it does not work with
KCONFIG_CONFIG=3D../../my.config and the likes if -P/--absolute-names is
not provided.

>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
> =20



--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE56JD3UKTLEu/ddrm9dQjyAYL01AFAlyBbEEACgkQ9dQjyAYL
01DRqhAA2dHa3Cx65JfXeF4ZDeLbIjUN1Yzvp3Gp3qRcoS1ournITx3P/x247VAw
/jf/MtU5fUq2xKDrrw9qYZaEsxm7D8zqkXR5Ir3y+4ow4EICPXCJ55w94h9evpam
3fKs3W32n/YnIxTvloxn0L5xYz2+d7C1h4RIIMdrCWkBrgNgfy/19RBFqeuU65yj
7wCC457n/aHGdLYwu1ebVIR3I2b59mxS6zL3RfLNFjCj88oaBHMpk59x2OuIlt23
v1urv5UsDuW+vZBCmh1v9PCUQanKTQpw5yJlFCx0VsO2AYN71OX80Stytoum7oq8
5WTx/a3Sz+X7yY5CRV8BExhL6eS2bnBvkHe4hUQIa1xEiDvkmuqLSo6rrgpNcTCI
LfnxVZ5GyM70gGsbXWXapKw+fdH0qyMNuIkb+cVFE/gECkymZZWnlOhwtiIKG2Aw
i7BwLrpun73QiEZJA9XI/LQ4KOBH6RVzQQhXdMPv2kK1JVUfGzsW54ZGEPNEwOMM
mAhGN6ZaCnAs6UJf+MOzTTUR7E5Y++5DbH+3VV6flnewNtrM8SL4a1qqy6WeI2R2
UvP1KxoFWWRSLIu/B2DbL27OcWghrLXy34Mklm4owBwPeKP6Bqo6jTRPcEa1ckIY
VVjqUxX+/GmaOct8LhdckUhjjx9flAI63bvTZIK1SlU+KII2/bM=
=wPvZ
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
