Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:44350 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751637Ab3FWQvQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Jun 2013 12:51:16 -0400
Message-ID: <1372006261.21189.0.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v5 1/4] deb-pkg: use KCONFIG_CONFIG instead of .config
 file directly
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 23 Jun 2013 17:51:01 +0100
In-Reply-To: <20130617154921.221997cd@serenity>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	 <1371203217-19572-2-git-send-email-anisse@astier.eu>
	 <1371265896.3776.2.camel@deadeye.wl.decadent.org.uk>
	 <20130617154921.221997cd@serenity>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7Jo9WiM8emXgiJsenU+6"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>


--=-7Jo9WiM8emXgiJsenU+6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-06-17 at 15:49 +0200, Anisse Astier wrote:
> On Sat, 15 Jun 2013 04:11:36 +0100, Ben Hutchings <ben@decadent.org.uk> w=
rote :
>=20
> > On Fri, 2013-06-14 at 11:46 +0200, Anisse Astier wrote:
> > > Signed-off-by: Anisse Astier <anisse@astier.eu>
> > > Cc: Ben Hutchings <ben@decadent.org.uk>
> > [...]
> > > @@ -245,7 +245,7 @@ fi
> > >  # Build header package
> > >  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*=
.pl > "$objtree/debian/hdrsrcfiles")
> > >  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> =
"$objtree/debian/hdrsrcfiles")
> > > -(cd $objtree; find arch/$SRCARCH/include .config Module.symvers incl=
ude scripts -type f >> "$objtree/debian/hdrobjfiles")
> > > +(cd $objtree; find arch/$SRCARCH/include $KCONFIG_CONFIG Module.symv=
ers include scripts -type f >> "$objtree/debian/hdrobjfiles")
> > [...]
> >=20
> > I think $KCONFIG_CONFIG needs to be handled specially here - it should
> > be installed as .config in the linux-headers package, since you can't
> > assume the environment variable is set when that package is used.
> >=20
> > Ben.
> >=20
>=20
> You're right. New version below.
>=20
> From: Anisse Astier <anisse@astier.eu>
> Subject: [PATCH] deb-pkg: use KCONFIG_CONFIG instead of .config file dire=
ctly
>=20
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> Cc: Ben Hutchings <ben@decadent.org.uk>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> ---
>  scripts/package/builddeb | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index acb8650..a8662ef 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -41,9 +41,9 @@ create_package() {
>  	parisc*)
>  		debarch=3Dhppa ;;
>  	mips*)
> -		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy .config && echo el) ;;
> +		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo =
el) ;;
>  	arm*)
> -		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy .config && echo el) ;;
> +		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el) ;;
>  	*)
>  		echo "" >&2
>  		echo "** ** **  WARNING  ** ** **" >&2
> @@ -106,12 +106,12 @@ fi
>  if [ "$ARCH" =3D "um" ] ; then
>  	$MAKE linux
>  	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
> -	cp .config "$tmpdir/usr/share/doc/$packagename/config"
> +	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
>  	gzip "$tmpdir/usr/share/doc/$packagename/config"
>  	cp $KBUILD_IMAGE "$tmpdir/usr/bin/linux-$version"
>  else=20
>  	cp System.map "$tmpdir/boot/System.map-$version"
> -	cp .config "$tmpdir/boot/config-$version"
> +	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
>  	# Not all arches include the boot path in KBUILD_IMAGE
>  	if [ -e $KBUILD_IMAGE ]; then
>  		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
> @@ -120,7 +120,7 @@ else
>  	fi
>  fi
> =20
> -if grep -q '^CONFIG_MODULES=3Dy' .config ; then
> +if grep -q '^CONFIG_MODULES=3Dy' $KCONFIG_CONFIG ; then
>  	INSTALL_MOD_PATH=3D"$tmpdir" $MAKE KBUILD_SRC=3D modules_install
>  	rm -f "$tmpdir/lib/modules/$version/build"
>  	rm -f "$tmpdir/lib/modules/$version/source"
> @@ -245,11 +245,12 @@ fi
>  # Build header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl =
> "$objtree/debian/hdrsrcfiles")
>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$ob=
jtree/debian/hdrsrcfiles")
> -(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include =
scripts -type f >> "$objtree/debian/hdrobjfiles")
> +(cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts =
-type f >> "$objtree/debian/hdrobjfiles")
>  destdir=3D$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
>  (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destd=
ir; tar -xf -)
>  (cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destd=
ir; tar -xf -)
> +(cd $objtree; cp $KCONFIG_CONFIG $destdir/.config) # copy .config manual=
ly to be where it's expected to be
>  ln -sf "/usr/src/linux-headers-$version" "$kernel_headers_dir/lib/module=
s/$version/build"
>  rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
>  arch=3D$(dpkg --print-architecture)

--=20
Ben Hutchings
DNRC Motto:  I can please only one person per day.
Today is not your day.  Tomorrow isn't looking good either.

--=-7Jo9WiM8emXgiJsenU+6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUccndee/yOyVhhEJAQq7sA//Rj74zndN99EPEZA75wPfwUu1q4fXZIaT
jxYXQq+yYoAM3jxEhLGBjbaZjtluA2QpZBTJlGezpDv6HHNPisplLCbknSnpt6e9
ChTcUzjUygNCjoZvScJZJcyVIEtNf/HpBmbBRNFK7OH3SRoEeIChztc1yyK9R51B
eRahBjOQJiISwseYna4sN8qLQjvz5It2Lf6YwE43x8y8C9moBAVBs8NFsNV5FZFW
PctO/KIm7ivXNMWQ505UEB1XQpRqkA/PQGt9w/xgAgICxoYhJdgv86XHkr9P/Enp
m4QHY7CqvvPYlyRgI8DFHJXjsOAkyiP90YbjX1wKOuBriUmGos+TJ7aOpHmGlCUE
K4FlsafyxcZS/ja/zvKZ+dE5h0IrS2W0ai494Mt89E7lQSxyEFBCKMIu29HNoJLZ
7MOdv6BZ53sOsfcWSUYU3kZrxwilnTDWOF2A/Nlf3rdTiW89QGkHy9EdR2HOQB3w
1FadxQbQV1fNfQ0PJu08Bpjys2jjViTfn0IsIOhXfqvUTgozFmWIgtERrQlwXNyj
bITVhs9GsHv3wMq6wkKw35m4a/FsFaUG4REr6H81lph721O/CacO5jpPb8J3+bbV
c9DGUYCRwGORlNiWipyiHywQG4zlEp1eyK/6S6716PorM51AYKi74vN96ZXu10lZ
ZQhZew7dZhg=
=ef7D
-----END PGP SIGNATURE-----

--=-7Jo9WiM8emXgiJsenU+6--
