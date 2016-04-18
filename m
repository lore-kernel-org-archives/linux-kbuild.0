Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36616 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751943AbcDRPcO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2016 11:32:14 -0400
Date: Mon, 18 Apr 2016 17:32:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd
 ... && pwd)
Message-ID: <20160418153211.GB22979@ulmo.ba.sec>
References: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
 <5714F35D.5050603@suse.com>
 <20160418150535.GA22979@ulmo.ba.sec>
 <alpine.LFD.2.20.1604181609540.28036@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1604181609540.28036@eddie.linux-mips.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 04:17:26PM +0100, Maciej W. Rozycki wrote:
> On Mon, 18 Apr 2016, Thierry Reding wrote:
>=20
> > > > Avoid forking off a shell to resolve the absolute path of the output
> > > > directory when make's builtin $(abspath ...) function will do an
> > > > adequate job.
> > >=20
> > > The abspath function is not available in make 3.80.
> >=20
> > Do we really support make 3.80? It was released in 2002 and 3.81
> > followed in April 2006. That makes it a decade old now. I'd be surprised
> > if anyone was still using it to build recent kernels.
> >=20
> > Is there a formal process for increasing the dependencies listed in
> > Documentation/Changes? Should I simply make that change as part of this
> > patch? Do we need broad approval?
>=20
>  Hmm, what problem are you trying to solve here?  Your proposal looks to=
=20
> me like a gratuitous requirement for users to upgrade their tool (its age=
=20
> doesn't matter), which is often a burden and in any case requires extra=
=20
> time which could be used for something else.  Don't fix what ain't broke!

Fine.

Thierry

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFP34AAoJEN0jrNd/PrOhlbwP/ihn8J9v6jSj98pO0A1Y4r98
Uy4HxRZJcJnwY3Eqrzq3ba4H3dex4woxWPeU+HqEuBDux3R1fNlrmeHkoCdnz8Wi
U39dvGb3pysCRH2svH4JZUaMBzlf668ddWLpA8cSn78rKxy82Ra7A0OGGzI3mySw
PHeK1/RUW86rh1pK/fVhY9TGB9JmtnoEa5jOrauevmbQfeF2JwybWgZ6tcpWXepI
HwSCXDBh3agnVZ73H5hVyOFAEGvhnQcGVbmQh2KQY/edFgme9dGyosBwiNUFQcmu
baKn61BeuFYsZLafwXF/9dZeMH5wEBc2Xdk+IYfvngovMLo23txcgJ44bR9ieVJF
WlIpwhOY0Sn58DDCbRSfDr5nOtxPUeILVBvKMbhNXhl9j9pKSD6B+2xNQYx+XnxX
G0qkaa1t4+XFfpldwOrDXttXoBvszsQovnGdHneFPcRlw7AiXeUA2I5tlcNcr7h7
/o4Ety5C8qvWOUQt5UxA/wbsTt0jDAwpdE+pkpA4ludNuFMgS646C4dz7KhbESJE
zOuM16N7NX6uQFzn8811DkDS0N0WknOLpNmRKBr0nksfZU6exjlxf6DjQAtGNQl6
OShgOdlAOKsjKOBv5h0KuCTgFv+JgJolYXAXgaUpSWHfPZgDO4jtNLO5XQKuVaqx
pAArmh+dGq8V40VfCYVW
=sXJI
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
