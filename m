Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:44471 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751308AbdLASs7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Dec 2017 13:48:59 -0500
Message-ID: <1512154058.2811.4.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: introduce variables for control-file
 customization
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 01 Dec 2017 18:47:38 +0000
In-Reply-To: <20171201193433.68b25efe@md1em3qc>
References: <20171127161345.17880-1-henning.schild@siemens.com>
         <1512147072.2785.20.camel@decadent.org.uk>
         <20171201193433.68b25efe@md1em3qc>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-S0VUkgi89eQlzdFBUbGo"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Henning Schild <henning.schild@siemens.com>
Cc: linux-kernel@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Konrad Schwarz <konrad.schwarz@siemens.com>


--=-S0VUkgi89eQlzdFBUbGo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-12-01 at 19:34 +0100, Henning Schild wrote:
> Am Fri, 1 Dec 2017 16:51:12 +0000
> schrieb Ben Hutchings <ben@decadent.org.uk>:
>=20
> > On Fri, 2017-12-01 at 15:56 +0000, Henning Schild wrote:
> > > The debian packages coming out of "make *deb-pkg" lack some critical
> > > information in the control-files e.g. the "Depends:" field. If one
> > > tries to install a fresh system with such a "linux-image"
> > > debootstrap or multistrap might try to install the kernel before
> > > its deps and the package hooks will fail. =20
> >=20
> > I assume you're talking about those hook scripts being run while the
> > packages they belong to are only unpacked?  I hadn't thought about
> > this issue, but it seems to me that those hook scripts generally
> > ought to be fixed to handle this case properly.  Most of the packages
> > installing hook scripts for kernel packages are not going to be
> > dependencies of linux-image packages, so it will never be safe for
> > them to assume their package has been fully installed.
>=20
> Yes these hook scripts fail when installing the kernel on another
> system. Indeed we seem to have a case where packages installed on the
> build-machine cause install-time deps for the package.

Can you give an example?  I don't see how that would happen.

> In my case the build-machine is pretty minimal but i still want some of
> that i.e. initramfs.
>=20
> > > Different debian-based distros use different values for the missing
> > > fields. And the values differ between distro versions as well. So
> > > hardcoding of e.g. "Depends" is not possible. =20
> >=20
> > The dependencies also depend on the kernel configuration.  (And a
> > custom kernel built with 'make deb-pkg' often won't have any
> > dependencies outside of essential packages.)
>=20
> In fact it does not have any at the moment, there is no essential. Or
> maybe that is hidden in debian-magic.
[...]

Essential packages are always installed, which means there is no need
to declare a dependency on them (in fact it is discouraged):
https://www.debian.org/doc/debian-policy/#dependencies

Ben.

--=20
Ben Hutchings
When in doubt, use brute force. - Ken Thompson

--=-S0VUkgi89eQlzdFBUbGo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAloho8oACgkQ57/I7JWG
EQllHxAAiCwOyUoU9rIR8eTcLImpn3TfjVRrX/MiHGnQ/cXr1ScIalE7JTBsWzBY
GJhIjca1fFa2bdrf5KjqeARg4+C1vmmzwbhUsHwtjVWDqua17RrQnFgsIFQqiwyD
9ANFqBfAl7nACR+9W+/6AJDb7K8hQuxQxkruQsDF3i7w0Kvf3yHfeWByJmv8/mCl
2Wxl3NKQTFTsWcunTBZKvEgUCjeY5lvV3CdfT7w7C+IEt9icnBmMUUbzk5tGPlFL
ig7dR54BQaX+6f0jiXQNh/n59dFxEvLf0l8Y7nlyueF0EjQYKy5rgRnLyVERcjQv
DRzQ624n9k1m0b/LdVkGjSAcnp9VW2Xs0oy/gwMsRJvxQhSiLIoUhsETGwzohBCZ
ySJPIbGTqgO0xIUDtIeUdc3eQ+4LcoDxLu4V9y6bdEFHo6TjcWWnaiS0m7fmziAD
bopnUgqIP8hxR+b/XN2tTfQJoUJNGkINdmtA87UtyiCKn9Bc/BDdf5IG9QLNVUIt
R7GRFgEUnOl21e8MEiFh5GHuJLJp1LglGrrcOw61gm4nLVWWQ62WeSYbPJK3qRdE
Q5VeLFv/swzEBqRfR+H2ZdKhI3QSgSdWy2g4DYF8FCiCIwOYm7ZqphmLELOWkfOS
u44CmXK8lY4y26R36QDQF/lJbSkzLFmtWJ+oif0519InEV6H0gc=
=UvEY
-----END PGP SIGNATURE-----

--=-S0VUkgi89eQlzdFBUbGo--
