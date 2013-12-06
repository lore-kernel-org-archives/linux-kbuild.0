Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:35869 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751257Ab3LFBkx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 20:40:53 -0500
Message-ID: <1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 06 Dec 2013 01:40:39 +0000
In-Reply-To: <CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
	 <CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tmbU+rwe0CVsXCF7KHZT"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Niew, Sh." <shniew@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org


--=-tmbU+rwe0CVsXCF7KHZT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-12-06 at 09:35 +0800, Niew, Sh. wrote:
> On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk> wrot=
e:
> > builddeb generates a control file that says the linux-headers package
> > can only be built for the build system primary architecture.  This
> > breaks cross-building configurations.  We should use $debarch for this
> > instead.
> >
> > Since $debarch is not yet set when generating the control file, set
> > Architecture: any and use control file variables to fill in the
> > description.
> >
> > Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pkg')
> > Reported-by: "Niew, Sh." <shniew@gmail.com>
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
[...]
> I can't patch this to my linux-3.2.y tree which i clone from linux-stable
> I check that the patches number line are different...
> What i missed?

This is for mainline; it should apply cleanly to 3.12.

Ben.

--=20
Ben Hutchings
Knowledge is power.  France is bacon.

--=-tmbU+rwe0CVsXCF7KHZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIVAwUAUqErF+e/yOyVhhEJAQrqFQ//fILTLXl9daBbdjgskYpIgvsRH0INRYdp
xxSLv/4XUI64ATGfHLZliWbrKlOwUO4JQ9exDdlLp5Pl6gMu80zrvolyxszgEryT
JMVMUnXOYOfIRNIY7pt42dNGrm5GC2KOeeRIWmKXRGfVxZxLy151/1qzxl5M3S1z
AoehYfkHm+IBOTCj7GfF6kx4Rqy5eAjZ3MzeItzpbonTJSiBx2HdoqVJ2tM4k42g
8bzPFDExt0r+s9dcqlOxRmQmpFRgfn3V1FujMU9xdeFo2rhyoAzVzcRXQ9k5Zebx
vUjfqnW6WvY1oVdAjWA4m8XDGT39XcucuMIjwD+6AflofHTQw7Lu2iScVpqgD/Br
wK+v8N7azQu6XeMzBUDW04Rjb39n8B4fM16FBUfhPXRQzk8SdDCkCz81BTKxYadV
oOTs05hD0+7gElWPspdWqc7vpFCnP+QPWd7nfsclDu1CBswekTqUe3M44a0P3ODs
5ANfKc+h4Iu127hhNMqlTRGs1cH5cUP1Pa8daGAa4mpSZFOo3/34NtaMIx3FG60f
d0aMlcFQf+v3nNeUCev/KcTGRy588YANN45fuHbMamZ3Y8Wt7OU0ZwYc1VV18/LK
pjRnXzjQY7EgoDfWaPfJdVmRWHRePGPUEBiUZWiiB9BSjNi1FcnC5teZVmyRyCvT
boZJ4sOfbAc=
=YcZd
-----END PGP SIGNATURE-----

--=-tmbU+rwe0CVsXCF7KHZT--
