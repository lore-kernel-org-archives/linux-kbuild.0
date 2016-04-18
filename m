Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:35004 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751669AbcDRPFl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2016 11:05:41 -0400
Date: Mon, 18 Apr 2016 17:05:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] tools: Use builtin $(abspath ...) instead of $(shell cd
 ... && pwd)
Message-ID: <20160418150535.GA22979@ulmo.ba.sec>
References: <1460106959-6684-1-git-send-email-thierry.reding@gmail.com>
 <5714F35D.5050603@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <5714F35D.5050603@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 04:46:53PM +0200, Michal Marek wrote:
> On 2016-04-08 11:15, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Avoid forking off a shell to resolve the absolute path of the output
> > directory when make's builtin $(abspath ...) function will do an
> > adequate job.
>=20
> The abspath function is not available in make 3.80.

Do we really support make 3.80? It was released in 2002 and 3.81
followed in April 2006. That makes it a decade old now. I'd be surprised
if anyone was still using it to build recent kernels.

Is there a formal process for increasing the dependencies listed in
Documentation/Changes? Should I simply make that change as part of this
patch? Do we need broad approval?

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFPe9AAoJEN0jrNd/PrOhWikQAJs5WCGjSbMECE21vnrbXjkl
/IxbObcPfGsNshlZq6/osk/bswKXdUVPTNmETVvYrs8A4dGfTtlcfTDXJPmGworB
7BOF4fgSNbiAOTGx6TKPFeWLzwLH09VYgSe9NyAx+TqNpTDwX7aQLCBCgtlmU3kp
Aj5NfJBOpDKRTsXLFwvDf/0xkHmbEhym0G3Vdwq/YHkymLea4glvQ5t0R9Kd74yb
lK+PeX8BaCpmDYF7vp6/sJfcznJEtPsZ3A+Hh8+llfL3gFpwLTmCzH3Ss1G8YZPs
vNbf5cvjRNFZxglRn/qAmSs7KCaPws0m3Ewg4jpbWv3MDmGGU5Mqt1lwDCmATMii
HcXQQkcgxY/CuQuq7wPy0Z5l9YM+UVGdehq4xzizxx87xSZUOAH4mhgwZyOczyen
llPQH3H0HQsP5kDr0PthaI+FXOa4ejhfW/LC1tTGKG/5p69VRrYf49poDqNN0S8L
HuVU3HYtS4DWXilXxabmBadjHHY89zxZfSCQwS/oL3uDsCYiNrUxg6Pc11Eul10J
1+HOXHcrPZqZyWa5nXkaZ8x9qjc+sqi17tnHB02DnjnQdN41I/Hgo1ZGBpvtnnWK
faxdUwcp2CkP55hT8PEYKi/mJ264/3ZC/ctWR4PUYofoC6RXbU+ANzAc61y9C5lp
yGzCK5ElSFasFSUtPzS8
=jpRc
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
