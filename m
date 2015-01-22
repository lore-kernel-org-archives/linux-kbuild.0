Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50873 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751979AbbAVOTu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 09:19:50 -0500
Message-ID: <1421936376.31046.211.camel@decadent.org.uk>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Thu, 22 Jan 2015 14:19:36 +0000
In-Reply-To: <54C0FDDD.10805@suse.cz>
References: <20150114123201.434698327@rtp-net.org>
		 <20150114123658.185884720@rtp-net.org>
		 <1421239885.19708.82.camel@decadent.org.uk>
		 <87lhkyictc.fsf@lebrac.rtp-net.org>
	 <1421769898.31046.194.camel@decadent.org.uk> <54C0FDDD.10805@suse.cz>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Aqk4+yOLFKc8/Kn2rl7g"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Patard <arnaud.patard@rtp-net.org>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>


--=-Aqk4+yOLFKc8/Kn2rl7g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-01-22 at 14:40 +0100, Michal Marek wrote:
> On 2015-01-20 17:04, Ben Hutchings wrote:
> > On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
> >> Ben Hutchings <ben@decadent.org.uk> writes:
> >>> Only arm and arm64 support that target.  You should maybe run somethi=
ng
> >>> like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
> >>> target is defined.
> >>
> >> There's a 'set -e' on top of the script so using make -n will likely
> >> result in the script failing, which wouldn't be so nice imho.
> > [...]
> >=20
> > That's why you use it with the if statement:
> >=20
> > # Only some architectures with OF support have this target
> > if make -n dtbs_install >/dev/null 2>&1; then
>=20
> The problem is that kbuild does not support make -n and some of the
> commands are always executed. So the command will silently build the
> blobs and just not install them.

If the dtbs_install target is defined, they should already have been
built at this point.  If the target is not defined, why would it do
anything?

Of course it should be $MAKE not make.

> Better do
>=20
> if grep -q dtbs_install "arch/$SRCARCH/Makefile"; then
>   ...
>=20
> and hope that there won't be any comment causing a false positive.
> Another option is to grep 'make help' output.

Ugh.

Ben.

--=20
Ben Hutchings
I haven't lost my mind; it's backed up on tape somewhere.

--=-Aqk4+yOLFKc8/Kn2rl7g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVMEG/ee/yOyVhhEJAQrPog/9EPwaaePLsICakzki/i+/qkVnwyZiXHp2
73dQc67Qlrj0utlMOjGpV/6sTX56GeevhiINxvaIBVU3ZhH8ektLIIDJ2ixeV5aJ
D0SySFjL6oU/lBV+VObl7xqrDqBMIBjf/gp3xbKqHn1+a69Dgcf2ubMayKfslx3j
dsnzZfKl8kQEY8nIJ6+4zZlhlV/WMOA3sJxp2wu9IODN6iLNsZGz6+N7tGziIcP0
B4Z+tPWclpsAlUfafXIVFWRemR2bs7Ta7TyPLJKpowsrT4qq+uI/sPuKwnqLGwsp
XfHsB1F4uVEgKJD4tjtX+lgtLkIL1F0Y1vNgHLyTjQrjZpo+8kguxmKGjnG7itJ/
Aeu85qZdcw6Ucoa0d5HJY4io1Uvet+wq/liSkcR2r3kqDqbKqWlivf7QZtwaefPC
xpbfFOsByXWjnixPWhLw5WMLJbhEhUSOsoFSZudaMjSYXbenJWuKthJokimXjFsE
52WT1LQErqrCYePqM7bm6vcg/XxSTqVof+WQZi/qhiHM/NyoRVS/0iMGwKrKSp8w
qJJQQgS7/hzO/HxqaZIqyOdI4mE+OU0YxPrZc1Eb05zFrHioX5zebxXCdA+8wPYA
pJMPtgZdFIIjw3Fg0zXDRPoLMTk28DTDmtxehZNuFXDWDkrL4wX7gmfmQfoQXby2
24Kanf5wImk=
=5boV
-----END PGP SIGNATURE-----

--=-Aqk4+yOLFKc8/Kn2rl7g--
