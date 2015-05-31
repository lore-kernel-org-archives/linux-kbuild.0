Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55797 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754370AbbEaBO7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 May 2015 21:14:59 -0400
Message-ID: <1433034886.6319.80.camel@decadent.org.uk>
Subject: Re: [PATCH 2/2] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 31 May 2015 02:14:46 +0100
In-Reply-To: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
References: <1432804275-13187-3-git-send-email-riku.voipio@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LSqm3T4WeSJ46zg8quHo"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: riku.voipio@linaro.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org, maximilian attems <maks@stro.at>


--=-LSqm3T4WeSJ46zg8quHo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-05-28 at 12:11 +0300, riku.voipio@linaro.org wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>=20
> By passing BUILD_SOURCE=3Dy variable, make deb-pkg builds a debian source
> package. It will generate a minimal debian/rules file that calls back
> to make deb-pkg. Generated source package will build the same kernel
> .config than what was available for make deb-pkg.
>=20
> The source package is useful for gpl compliance, or for feeding to a
> automated debian package builder.
>=20
> v2, address Maximilians comments
>=20
> - Isolate from my other patches, so it can be merged easier
> - Separate bindeb-pkg target for building just binary debs
> - Build source package in deb-pkg target to match rpm-pkg target
[...]
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -265,12 +265,16 @@ On Debian GNU/Linux systems, the complete text of t=
he GNU General Public
>  License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
>  EOF
> =20
> +
> +build_depends=3D"bc, kmod, cpio, python "

Why python?

>  # Generate a control file
>  cat <<EOF > debian/control
>  Source: linux-upstream
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> +Build-Depends: $build_depends
>  Standards-Version: 3.8.4
>  Homepage: http://www.kernel.org/
>  EOF
> @@ -391,4 +395,33 @@ EOF
>  	create_package "$dbg_packagename" "$dbg_dir"
>  fi
> =20
> +if [ "x$1" =3D "xdeb-pkg" ]
> +then
> +    cat <<EOF > debian/rules
> +#!/usr/bin/make -f
> +
> +build:
> +	cp debian/config .config
> +	\$(MAKE) oldconfig
> +
> +binary-arch:
> +	\$(MAKE) KDEB_PKGVERSION=3D${packageversion} deb-pkg

This should invoke the bindeb-pkg target.

> +clean:
> +	\$(MAKE) clean
> +
> +binary: binary-arch
> +EOF
> +
> +	(cd $KBUILD_SRC; git archive --prefix=3Dlinux-upstream-${version}/ HEAD=
)|gzip -9 > ../linux-upstream_${version}.orig.tar.gz

Not xz?  (Which would add a build-dependency, of course.)

Ben.

> +	cp $KCONFIG_CONFIG debian/config
> +	tar caf ../linux-upstream_${packageversion}.debian.tar.gz debian/{confi=
g,copyright,rules,changelog,control}
> +	dpkg-source -cdebian/control -ldebian/changelog --format=3D"3.0 (custom=
)" --target-format=3D"3.0 (quilt)" \
> +		-b / ../linux-upstream_${version}.orig.tar.gz  ../linux-upstream_${pac=
kageversion}.debian.tar.gz
> +	mv linux-upstream_${packageversion}*dsc ..
> +	dpkg-genchanges > ../linux-upstream_${packageversion}_${debarch}.change=
s
> +else
> +	dpkg-genchanges -b > ../linux-upstream_${packageversion}_${debarch}.cha=
nges
> +fi
> +
>  exit 0

--=20
Ben Hutchings
Reality is just a crutch for people who can't handle science fiction.

--=-LSqm3T4WeSJ46zg8quHo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVWpgiue/yOyVhhEJAQpuQRAAruPywmX/wR/ZetVG6QtNHKw0oiZ31WQB
VJOUUYFlxJ/VTNRroKE3cSxg/h1/bK0OZvwV4ntZSZK7D7wJF/vzymSEFav1NMtl
1MvaZmQkv/TxnL5b4PES07B/6JVinKIadjefwC6EeWY/Tx0sQSuf/YdXXEOLh8ST
wcTmV6JrCETZ2jTx0j1pmNjiTIlPqweNdr/G8jEFFp2zrQddA/Yx5260MccZiiXo
9LFlTn/8sRGaTnkue2NzbwD44qMfBaWUYaqbV/DhjNQHPRFxknKWAo3ZEpqxuUGs
0vR9j00bfUyO529FQo7Sl/mNZj5sJ/QqsVorjuoZe8R0ZgiIdVDCU9OvWXtv+P63
yi9avV8rfL1LTIY2ix6Z5RcpcvHIGXJDuHqI+BrSvuQDUC+kO/LUwDmyITtXYeqs
xtDMZhkQtyxgO52y7zNrgTYmudaYCzQfO8Lqxnp426FgW20v9Mw5hON6w5Ur+TFK
kcc5PAfaMRONbFLq2GdIjvtEBbg5oRiwUE7mJz/MWd3eAq+IHSryvVq0gjTA1siL
s+fUUsXPReR5GQi9j50cvkF1xUSyjV7Hq1fpcmXP0/+0Ou16JBGdJA8NtNogI8GT
mVKpiOpwY9v7DaoeFKBTYCpQGUBmAWdjq1QAOQEQQgVDtbb4DeHemIjZPPvuVYaf
YhzWtszAV7k=
=V5WV
-----END PGP SIGNATURE-----

--=-LSqm3T4WeSJ46zg8quHo--
