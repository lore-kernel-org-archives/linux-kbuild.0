Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37354 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404699AbfHHWfX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:35:23 -0400
Date: Thu, 8 Aug 2019 23:35:12 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190808223512.GT3795@sirena.co.uk>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cUjMc5fB5G+GsIM6"
Content-Disposition: inline
In-Reply-To: <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Guenter Roeck <linux@roeck-us.net>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, kernel@collabora.com


--cUjMc5fB5G+GsIM6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 11:06:52PM +0200, Guillaume Tucker wrote:

> @@ -412,7 +412,7 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  # Make variables (CC, etc...)
>  AS		= $(CROSS_COMPILE)as
>  LD		= $(CROSS_COMPILE)ld
> -CC		= $(CROSS_COMPILE)gcc
> +CC	       ?= $(CROSS_COMPILE)gcc
>  CPP		= $(CC) -E
>  AR		= $(CROSS_COMPILE)ar
>  NM		= $(CROSS_COMPILE)nm

Why only for CC and not for anything else here?

--cUjMc5fB5G+GsIM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Mo58ACgkQJNaLcl1U
h9BaLAf/e7MJPA4HRxrJPnjXl318Leh2xBrAYLIYTNOL0fJw4Ta9QJ973EnCm6pr
GIxR0FAF4wD6mYhAKP79hFm9WjAxFB+kWkHAURytsReoxppp8fI/z6X3I7GETz5Q
kxzDulHxtWtkB5VCa/v+iaiN+PcS5hFFz/4IKl9nfu9o5ExqeaoJVZ8Uvsc0A3Uc
2+VUP2BBa0fWzEFUcXMD0py2K6KJL97XAMoDQWK7Gg+nsJDCjcepKZqJaS65co+X
B6orfTZ2bJ2kuQPvIgG95ElGopkY99lYP+ZHsn8OvUtcQOVi59xAxqv5m0jGPmHt
xfM/qUeX/YK5OZoeYECYlfnBnODqCA==
=FXa8
-----END PGP SIGNATURE-----

--cUjMc5fB5G+GsIM6--
