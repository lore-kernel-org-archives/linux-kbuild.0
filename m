Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57920 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751255Ab3BSFj5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2013 00:39:57 -0500
Message-ID: <1361252386.5374.564.camel@deadeye.wl.decadent.org.uk>
Subject: Re: Bug#636029: [PATCH] kbuild: Fix missing '\n' for NEW symbols in
 yes "" | make oldconfig >conf.new
From: Ben Hutchings <ben@decadent.org.uk>
Date: Tue, 19 Feb 2013 05:39:46 +0000
In-Reply-To: <20130219002426.GA19381@nt1.in>
References: <20130219002426.GA19381@nt1.in>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AVeIorLnZK/BfoxV6uy3"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Regid Ichira <regid23@nt1.in>, 636029@bugs.debian.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Jonathan Nieder <jrnieder@gmail.com>


--=-AVeIorLnZK/BfoxV6uy3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-02-19 at 02:24 +0200, Regid Ichira wrote:
> From: Ben Hutchings <ben@decadent.org.uk>
>=20
> According to Documentation/kbuild/kconfig.txt, the commands:
>=20
>     yes "" | make oldconfig >conf.new
>     grep "(NEW)" conf.new
>=20
> should list the new config symbols with their default values.
> However, currently there is no line break after each new symbol.  When
> kconfig is interactive the user will type a new-line at this point,
> but when non-interactive kconfig must print it.
>=20
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---

Don't put a '---' here, as the following pseudo-headers should go into
the commit message.

> Reference: http://bugs.debian.org/636029
> Reported-by: 636029-submitter@bugs.debian.org

Well that's you, isn't it?

> [regid23@nt1.in: Adjusted Ben's work to apply cleanly to this tree]
> Tested-by: Regid Ichira <regid23@nt1.in>
[...]

So it should be Reported-and-tested-by: Regid Ichira <regid23@nt1.in>

Anyway, thanks for moving this forward.

Ben.

--=20
Ben Hutchings
Sturgeon's Law: Ninety percent of everything is crap.

--=-AVeIorLnZK/BfoxV6uy3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUSMQIue/yOyVhhEJAQpUGQ/9G3QhGn69D9aIqSfmSjNB14p4bTrKpVK0
QJ9UxzY+4etSsS5XDfhLqUinE/WusCWDibxAza2Cwwe+lhRi95V7wNHwXhWrL8jr
o7dXzokf/f09rBlVEMn/4WjPb2HL48GSGNNZiriv/FX5tXEEpNTZ5BDr9DNRhd3s
owznDnARC0QqKeG/zGPWFscJhuLhQVGFJpH/rm3XtbwO/gXnvOiv4OE6NGFO996O
xAzaGPkXnxJ05hsTyHZgBht9KoPcXB6Oe7mHQ8z3VyiviuERFfwp4uKZRxgfymWC
huDI6Ccsq9Cn2DNk1tkvwy6CJRSTYfMzHdApjvhlYJon6WwLNp4ueI1BlmP79+Nq
z0TloP/tlCDAJciPmg29rCzvSNbzxzp4OhmUqm0fbqoIZ87SOF/K0OruTps75z2O
rMOKxsREdXWApmfPMEBIax1TqJdGPUjgSABy9KdQ8ov0XpXcqkvlm+aH881iP546
rgRD17f/zHKnEujNKlaAG8Sr+RksNCZMv/WOWFtQNHlOHH+uCOdgSq7kVrP7SwK5
nBPQRNoPdvAvVWILivwb1hIluLS3l2pLYw0KLr7L4J/QWdfqYfuqwMHU9E80EpK8
Gh4aT4CPrNIGleNvZklVYlLs9F2ZVQsQxC+ckoStrBrcFxkQHrTya+3J/UOwabho
O6Fjl8RZziw=
=ZrFS
-----END PGP SIGNATURE-----

--=-AVeIorLnZK/BfoxV6uy3--
