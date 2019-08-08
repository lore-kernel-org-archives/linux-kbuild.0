Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41622 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732796AbfHHWyj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:54:39 -0400
Date: Thu, 8 Aug 2019 23:54:28 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190808225428.GU3795@sirena.co.uk>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MjBORTcaENZKFEO1"
Content-Disposition: inline
In-Reply-To: <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <linux@roeck-us.net>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel@collabora.com


--MjBORTcaENZKFEO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 03:42:32PM -0700, Nick Desaulniers wrote:

> are you trying to fix the case where you do:

> $ make CC=clang ...
> <no HOSTCC set>
> when GCC is not installed?  Because if so, I think it would be easier
> to just specify HOSTCC=clang, but maybe I'm misunderstanding the
> issue?

It's that merge_config.sh calls make as part of its work.  When doing
that you can't use command line overrides, merge_config.sh would need to
pass them through explicitly which is probably more trouble than it's
worth so it doesn't.  Instead you need to set environment variables but
you then need to use ?= instead of = so make will use them.

--MjBORTcaENZKFEO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MqCMACgkQJNaLcl1U
h9AQjQf/RK71sDtUw6GScX0kPV2hSgw+bgYGqrR4Gv6fjuYBknRDgj19MyqXVRln
vYsIyGuZqOFNcm0ttCu7R/qgThY+X197H5wPdTjdLQFoUEWbwMwsGdIiWVYL3ixx
zlLcGX0hMetO/iMAhf3AJNwJzzYoiVGQLe9IU5WN7qJF58lOO9gCdWbV1RLz9ibY
h4hcp2Jdrp0dYsy+qlgHpbF+9wJLfX97CbtPbbt4PKCVK7CADpDMsVQOZ2BNEFZL
8quIK4EkVu4TtsFwavuPE9TcYWnItauREhPAgOwm//zhaJ3Bs/CgTIT6/fXzSRHi
vvEsiTOJAIGO4PmCVD2S9E2tRUpOeA==
=h7Of
-----END PGP SIGNATURE-----

--MjBORTcaENZKFEO1--
