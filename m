Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:34849 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751950AbdLDOgE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 09:36:04 -0500
Message-ID: <1512398147.2768.20.camel@decadent.org.uk>
Subject: Re: [PATCH] builddeb: introduce variables for control-file
 customization
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 04 Dec 2017 14:35:47 +0000
In-Reply-To: <20171204100150.1f040839@md1em3qc>
References: <20171127161345.17880-1-henning.schild@siemens.com>
         <1512147072.2785.20.camel@decadent.org.uk>
         <20171201193433.68b25efe@md1em3qc>
         <1512154058.2811.4.camel@decadent.org.uk>
         <20171204100150.1f040839@md1em3qc>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-jPKZMKLogAjzQk13cUhx"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Henning Schild <henning.schild@siemens.com>
Cc: linux-kernel@vger.kernel.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Konrad Schwarz <konrad.schwarz@siemens.com>


--=-jPKZMKLogAjzQk13cUhx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-12-04 at 10:01 +0100, Henning Schild wrote:
> Am Fri, 1 Dec 2017 18:47:38 +0000
> schrieb Ben Hutchings <ben@decadent.org.uk>:
>=20
> > On Fri, 2017-12-01 at 19:34 +0100, Henning Schild wrote:
> > > Am Fri, 1 Dec 2017 16:51:12 +0000
> > > schrieb Ben Hutchings <ben@decadent.org.uk>:
> > >  =20
> > > > On Fri, 2017-12-01 at 15:56 +0000, Henning Schild wrote: =20
> > > > > The debian packages coming out of "make *deb-pkg" lack some
> > > > > critical information in the control-files e.g. the "Depends:"
> > > > > field. If one tries to install a fresh system with such a
> > > > > "linux-image" debootstrap or multistrap might try to install
> > > > > the kernel before its deps and the package hooks will fail.   =
=20
> > > >=20
> > > > I assume you're talking about those hook scripts being run while
> > > > the packages they belong to are only unpacked?  I hadn't thought
> > > > about this issue, but it seems to me that those hook scripts
> > > > generally ought to be fixed to handle this case properly.  Most
> > > > of the packages installing hook scripts for kernel packages are
> > > > not going to be dependencies of linux-image packages, so it will
> > > > never be safe for them to assume their package has been fully
> > > > installed. =20
> > >=20
> > > Yes these hook scripts fail when installing the kernel on another
> > > system. Indeed we seem to have a case where packages installed on
> > > the build-machine cause install-time deps for the package. =20
> >=20
> > Can you give an example?  I don't see how that would happen.
>=20
> Scripts in /etc/kernel/ will end up as hooks for the kernel-package, if
> you do not set KDEB_HOOKDIR. Looking at an example system that pulls in
> things like "pm-utils, grub-pc .. initramfs". With this mechanism any
> package placing a hook in /etc/kernel can influence the deps.
[...]

That is not a dependency.  That is an extension mechanism.

Ben.

--=20
Ben Hutchings
Lowery's Law:
        If it jams, force it. If it breaks, it needed replacing anyway.


--=-jPKZMKLogAjzQk13cUhx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlolXUMACgkQ57/I7JWG
EQltsBAApRytnlS1F1CZRGtqpJ4ik6hjKBMfK62xvnuR0ClsLcKUWoD86gg5Q1gO
t8kJfz/KAAObsfCc2Ji396uEIAKEyDzP0ax08cDUyPu5ck65TrRtr+9rbRhcikXp
kadmwXWA7YyniLsFAkRtnvFLgGzFu1vV8q1kkmqSfUPMYwxRLRoGx4iEyFuXWCXH
rsDILELIjMmG+b1weee4GOaXPzzQLYiHty2WLnxnX+4sOW60GeRfjp7pt9nnnBEi
A5MFtwg/6f0P3bDv436HBsyMdoKkHQ1BMha3PagsLM0sZXQk3FhWHINhKexO0cNg
FTngwPuY5Hm6IDCH1BlfGtPJ0ecrVe6EzQ8dUbrf9RUFGsRcFeUwMaKY9vXiJqvl
6rhvzSKxa9uEvDe/Yud+H4aQFsC7T/1O6pVkCNl0KaxUejxGZdB3o5Dg8iDAJIW3
Wa8wRSxRknGhN5KeWaLqOHD6O9B4PfxuYY6vt5JX07KRTgAeEPKWhptP05+2r9G7
3ohCDr5QIBnF5THhsYTGvk9FW6pzx/2Yd4u4rqN8nDvuIZsvz/Pt9LKujpbQVmWA
/sitZ9jpNqCbLmiT34FpoKI4Zh5FOEDz0fC+sqcc2jSD/fB4DTMMvpfMLdGmoxRp
QMbN9IHZmMqA8sAxS3afYxfNE3u/wJIp7pFNs6ngA0fJaT6zB+w=
=xKh8
-----END PGP SIGNATURE-----

--=-jPKZMKLogAjzQk13cUhx--
