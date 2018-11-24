Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:39054 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725880AbeKYEij (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Nov 2018 23:38:39 -0500
Message-ID: <5db14c4980ab9d8d23606b2a336a6b8dbbb255d0.camel@decadent.org.uk>
Subject: Re: builddeb: Missing arch/x86/kernel/macros.s when building
 modules with dkms
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 24 Nov 2018 17:49:37 +0000
In-Reply-To: <CA+icZUXU8z_zke=3HCkceZo_becUL2Q=5j=QtAKkqYn8o-5-vw@mail.gmail.com>
References: <CA+icZUUPaoEf0JzXJO6T5xBBrr8tcw2NmNXBk4=HD6WBbLtEdw@mail.gmail.com>
         <CA+icZUWrbTPk7ws+LBjzMSKsbfwbZODjCoBt7uQU0Z4ykzd6mw@mail.gmail.com>
         <CAK7LNAQ_8RYQaLbouR84=HH+xoxvVGX=gN5z-vQqu0=PCVzOuQ@mail.gmail.com>
         <CA+icZUXU8z_zke=3HCkceZo_becUL2Q=5j=QtAKkqYn8o-5-vw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-pYpDy343z60XO1TeFz+Q"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org


--=-pYpDy343z60XO1TeFz+Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2018-11-24 at 07:51 +0100, Sedat Dilek wrote:
> On Sat, Nov 24, 2018 at 1:53 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
[...]
> > Maybe like this?
> >=20
> >=20
> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> > index f43a274..4cf5a5c 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -165,6 +165,9 @@ fi
> >  if grep -q '^CONFIG_GCC_PLUGINS=3Dy' $KCONFIG_CONFIG ; then
> >         (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
> > gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> >  fi
> > +if [ -r arch/$SRCARCH/kernel/macros.s ]; then
> > +       echo arch/$SRCARCH/kernel/macros.s >> "$objtree/debian/hdrobjfi=
les"
> > +fi
> >  destdir=3D$kernel_headers_dir/usr/src/linux-headers-$version
> >  mkdir -p "$destdir"
> >  (cd $srctree; tar -c -f - -T -) < "$objtree/debian/hdrsrcfiles" | (cd
> > $destdir; tar -xf -)
> >=20
> >=20
> > --
> > Best Regards
> > Masahiro Yamada
>=20
> Hi Masahiro Yamada,
>=20
> thanks, that fixes here the problem with building DKMS kernel modules:
>=20
> # find /usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl -name macros.s
> /usr/src/linux-headers-4.20.0-rc3-7-amd64-cbl/arch/x86/kernel/macros.
>=20
> I guess commit...
>=20
> 77b0bf55bc67 kbuild/Makefile: Prepare for using macros in inline
> assembly code to work around asm() related GCC inlining bugs
>=20
> ...is the root cause (mention as a "Fixes:" tag in a future patch)?
>=20
> Not sure if the according script for building Linux RPM packages needs
> the same fix, too.
>=20
> I can send a fix for the builddeb part or if you want to do it, it's OK f=
or me.
>=20
> I highly appreciate to see a fix in Linux v4.20-rcN if possible.

Perhaps it would make more sense to move this file under
arch/x86/include/generated, so there's no need to add a special case to
the packaging rules.

Ben.

--=20
Ben Hutchings
I'm always amazed by the number of people who take up solipsism because
they heard someone else explain it. - E*Borg on alt.fan.pratchett



--=-pYpDy343z60XO1TeFz+Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlv5jzEACgkQ57/I7JWG
EQk9ChAAuKvd2tJpzOTaLe0unKb06nNaiKTAp8qRTknXLv02LRi6Ke8jKtg2MGt1
8HQQcKy3hf8mBejxwQLhutXF4aqWbjj8/5GGLJX8WEBmdKEfQtpKxkZDjwVfiheE
WCuPDuennCLwOLw2gF7A5k+ZsCaGNEkRHV8QK/GKuug+2sw5jvm/QDADMHI/IbFx
4BEt1htfOm5yoYcpF6Z6Me7k5YG74J0Iz8sK8+joRL+G6c3md9HuZ0nIw8yGaEL0
fO/hKpYSht9ZQaDbnMW93sbtcgiUqpqutqoLDrxO6HhKejlsCPVW/3ZQCM2BgsCo
rn+f4XqC6vXH43vBfyz65Ny+d1V+dNWXyG+5FadHa3jAopXKXniWwWwH7CPeHfHy
y3lhD/a5kKo/H8CyBtt3oCC9VFVoRaQKHxc8NjQCty9mVfZiuE1CXRd63OsYRz40
vNjloI/jRk7ox+0e7pwaa5jq+r9Wv/0slh3DDhsQhfrRNDVyDHyc5U28rtCgaW4C
+3d1Ms20/vv+pl34gYNqzzazXdKU/LohmVDxdXV1uAm5tq67f8k+78sJ7YOldxle
WXS/lPD19kNApO/scozyW/iDOpWLplgqnOqDtKuiu7hTUeYLNDmlSVCb+g2T7lEt
txVxiEx6VG9iyJkw6riceFLqXKV8dapJeSaUHECbYUe2858o+SU=
=5feo
-----END PGP SIGNATURE-----

--=-pYpDy343z60XO1TeFz+Q--
