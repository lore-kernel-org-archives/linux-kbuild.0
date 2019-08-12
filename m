Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47776 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfHLKnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 06:43:37 -0400
Date: Mon, 12 Aug 2019 11:43:33 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] merge_config.sh: Check error codes from make
Message-ID: <20190812104333.GC4592@sirena.co.uk>
References: <20190808222705.35973-1-broonie@kernel.org>
 <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Guillaume Tucker <guillaume.tucker@collabora.com>


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2019 at 06:11:10PM +0900, Masahiro Yamada wrote:
> On Fri, Aug 9, 2019 at 7:27 AM Mark Brown <broonie@kernel.org> wrote:

> > When we execute make after merging the configurations we ignore any
> > errors it produces causing whatever is running merge_config.sh to be
> > unaware of any failures.  This issue was noticed by Guillaume Tucker

> I am not a big fan of this way of fixing.

> [1] 'set -e' is useful to catch any error in this script.

Right, that was actually my first thought but since there was a handler
and it was already being called directly this must be a deliberate style
so I did things this way in order to fit in with the existing style :/

> [2] I think trapping only EXIT is smarter.
>     The clean() help will be invoked when this script exits
>     for whatever reason; the temporary files will be cleaned up
>     when the script is interrupted, errors-out, or finishes
>     successfully.

> I would change like follows:

That works for me,=20

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RQtQACgkQJNaLcl1U
h9CP1gf/XX+eXOYHMI9aH70hZlG2FXdfrke5+ZDdtFbM7OI+pEBwVxe6gpnkeBYY
0OVXegZeeeM+aLnb3zIXXkX88i0VFlwuEFGDEhyds5eHQOwXljK9JddMwaUKf2Qk
47jRgLYyKmIukt9WV45V5fhcz4FxujzEH+gHTYFqKaDEk+WvvUKe0NvuicGCqEzA
oqV9R4A9aYunhJdSkY9mIYSorP67Z9jBNeLYCYEbZx2Uj01kxCAh2rekAPUZOd4w
yf1jXsuIO2Osz0f3ZmEpGpxyLQvBlpZeo92/K2dHovxz2LitGlnugQcDMth/8fS+
hoHqfgbVF4iONB4gM4cNweJdpu7KZg==
=kLUK
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
