Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36764 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390340AbfHHWSQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:18:16 -0400
Date: Thu, 8 Aug 2019 23:17:54 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 0/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190808221754.GP3795@sirena.co.uk>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Content-Disposition: inline
In-Reply-To: <cover.1565297255.git.guillaume.tucker@collabora.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <linux@roeck-us.net>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, kernel@collabora.com


--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 11:06:51PM +0200, Guillaume Tucker wrote:

> While this fix seems like a very obvious thing to do, it's equally
> surprising that it hasn't been done before.  This is why I'm sending this
> as an RFC; there may be a very good reason why the compiler variables
> still need to be hard-coded with gcc in the top-level Makefile.

Probably the few people building kernels who didn't have GCC installed
and ran into this just went and installed it when they saw the error.

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Mn5IACgkQJNaLcl1U
h9DY1Af+NqU3cOOFQVhT9tHvETuiNHGUGmHdw+yNH2FL0oD+g/TnIDUwt/LzUXv5
f1ZbtgZjdjQWsKzmhZCrPC5im8DngacGB1SUF3gZP09voM6xJ6GcaD/kpGk3+jDW
Xqlfc7Z2s1t73CAAJ1E8+vh20kRVnzZD326f2XBIP7i72gVjB2NbwMJidkvLEANO
1G7YgkXtxG8C7jfyif+3HIbq65G9sgcHj0WBhCoEn/Vh1kPgYIiGf7E7ebdwlYIW
aoWBYxAiMDLoPq2QxC2Kw6P2tQMdUgOimmrkPbRCX+JhCfKeJw4EySGbcCedt0vL
uVbmpSx17MVaxjRzQEsWapcMATznGA==
=1asF
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
