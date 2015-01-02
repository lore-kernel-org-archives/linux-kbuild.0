Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:51449 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751972AbbABUY0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 15:24:26 -0500
Message-ID: <1420230257.5686.127.camel@decadent.org.uk>
Subject: Re: [RFC] builddeb: Try to determine distribution
From: Ben Hutchings <ben@decadent.org.uk>
Date: Fri, 02 Jan 2015 20:24:17 +0000
In-Reply-To: <1420229669-5550-1-git-send-email-sedat.dilek@gmail.com>
References: <1420229669-5550-1-git-send-email-sedat.dilek@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-StAIIOEu/uEvTdczD01i"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: maximilian attems <max@stro.at>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


--=-StAIIOEu/uEvTdczD01i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2015-01-02 at 21:14 +0100, Sedat Dilek wrote:
[...]
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -217,9 +217,21 @@ else
>  fi
>  maintainer=3D"$name <$email>"
> =20
> +# Try to determine distribution
> +codename=3D$(lsb_release --codename --short)
[...]

This needs a '2> /dev/null' to suppress error messages when lsb_release
is missing (or doesn't support the options).

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
                                - John Levine, moderator of comp.compilers

--=-StAIIOEu/uEvTdczD01i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVKb+cee/yOyVhhEJAQr5ZA/8CU78DzFXWXYrTadE64qJGnw2VQRz7eID
mo1A0koydA20WBG0CtlfeEgJLEL0cP2G0ygscKhSuv9ZMTDu0L65H+nDkMopQeJu
XoAU5TjHttHS6+9l5HFa+/prPo86Q25PLX+UgwIDgcZkv4xqmRFWkbxpnmFiEnXX
1Bc+/vmzYDKH0TtrY7tH0jU12Wv/WA0q0RUGTOYGXWshU0DAKoRnO+Uj1YMG46i0
ISPFvIOk95+12YK6J6Z5RPJaaxkkkHi8Q17o+poXBoC3mjtY/rr0K7KwniVo0InQ
GrGwL24Jtf10VOcDYHQ8mICIJ05fcF8RdL2SjZ2+Z/724tAD0C1BcSk3/QzDlJ2o
QpSEgOb54TsrlR33SYSqoWeRsg7quxy4x4EJSQ2luH7t+/PpAuVcJqsmDQMIEvJ5
clPL8E5Zui+kLWrjYUIjidOAO77Mh0Novr+JSu8t0ZEg2PuIRnGIfYlOMZHAIaOU
pLr0jZ/wBvzMPLPmC9JgG/IP/VI2od2CTOo1pgwrNLVLqne9gDyjokxkdbqM9F3X
O/zx4FmS83laiPhAAk2nvUtJ6fj7O1y9tdaC9gsX+e4CnnzvYp8LGQ2YBB6kW0hN
4t3uva58mCI/IaLZbEZQZLSAfHTBL9n2vQ0IkY+TkfDdYVCuDDzATfveU0oxu6Nr
lW4JT4khPB0=
=GHqv
-----END PGP SIGNATURE-----

--=-StAIIOEu/uEvTdczD01i--
