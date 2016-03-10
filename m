Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:55680 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752795AbcCJUuI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Mar 2016 15:50:08 -0500
Date: Thu, 10 Mar 2016 20:50:04 +0000
From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH] ld-version: Fix awk regex compile failure
Message-ID: <20160310205004.GB31414@jhogan-linux.le.imgtec.org>
References: <1457455673-12219-1-git-send-email-james.hogan@imgtec.com>
 <56E1B3C5.7040204@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EH85xkKza2NXtwkF"
Content-Disposition: inline
In-Reply-To: <56E1B3C5.7040204@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michal Marek <mmarek@suse.com>, Andi Kleen <ak@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "Michael S. Tsirkin" <mst@redhat.com>, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

--EH85xkKza2NXtwkF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 11:19:57PM +0530, Sudip Mukherjee wrote:
> On Tuesday 08 March 2016 10:17 PM, James Hogan wrote:
> > The ld-version.sh script fails on some versions of awk with the
> > following error, resulting in build failures for MIPS:
> >
> > awk: scripts/ld-version.sh: line 4: regular expression compile failed (=
missing '(')
> >
> > This is due to the regular expression ".*)", meant to strip off the
> > beginning of the ld version string up to the close bracket, however
> > brackets have a meaning in regular expressions, so lets escape it so
> > that awk doesn't expect a corresponding open bracket.
> >
> > Fixes: ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion ...")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: James Hogan <james.hogan@imgtec.com>
>=20
> This error was only coming in my gitlab builds but was not showing in=20
> the build of travis-ci. Maybe it depends on the version of awk also.
> Build log at: https://gitlab.com/sudipm/linux-next/builds/839573
>=20
> Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

Great, that looks pretty conclusive. Thanks for testing Sudip and
Michael.

Ralf: is it too late to get this into v4.5 via MIPS tree?

Cheers
James

--EH85xkKza2NXtwkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW4d38AAoJEGwLaZPeOHZ64ysP/RVG0eQAAPvheI/yCFhjWUDo
Tor55GMAMBF8Wd/XExW77EVSRSpPBGc/UWaIv1LHXdCRciNIvU/awY7J4rEKYQTL
tpQIfoIwUG5oXneWFQGKVtt0W93KYOAtTQooIaBJ+tPvY4sjqLvrtI02hdbHnVzg
mzpK9Xdxy1C0aAjtZMyL9+0gAdL/ijCet2TUmvK478KvMNPp2VbFOgocMIYpC60S
MGY91pvNY8uHhMKnz30KgRFy1f/YGxkH6zcSKmW99xhUNh03PtE501Fagp8mH+24
aMI0s6qYGJxA66l28QCurZzt2l41gBGDl3DSx2MnYJp9xmTcciTJRFdrasgfF3mR
MFStIDJ2c8ilEpiVLWRKmE9HuVEbFav/mGtQYs0Y7KI2smO9CTV9AmLL86eXnD2B
wSBTOwEteCjDNrdwx8pAQp7ZwkTV0sAxkODZUXvWdEB9nJRIX2GhUNmCziBu8Tpw
X8gs7h4KFeSSgByRF+mE7sZdPwYNSf9QywX4OIOPTN43OrusrSvo/MYr18oorClm
dqLolsgo6zXLzsJiM8RaQ3XCT6ZeaVvAjq1bRH7rmJpeipDJZBte6XRqPnyvoqCi
Q5MCONCaad3K+ZqGnQTRBZPHqe/96MsQPrdlIOtYOc7w8IQBsjrIkAyHvRINIxFT
+nsPpa1GjHKeEJ5G2s9E
=FOWj
-----END PGP SIGNATURE-----

--EH85xkKza2NXtwkF--
