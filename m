Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.11.71.1]:43525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfESXw3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 19:52:29 -0400
Date: Mon, 20 May 2019 09:51:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
Message-ID: <20190520095147.2021c218@canb.auug.org.au>
In-Reply-To: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A_/Ly4YcWk_rggvMudJw4JL"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Bernd Petrovitsch <bernd@petrovitsch.priv.at>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

--Sig_/A_/Ly4YcWk_rggvMudJw4JL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Sat, 18 May 2019 01:07:15 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>
> It checks not only real modules, but also built-in modules (i.e.
> controlled by tristate CONFIG option, but currently compiled with =3Dy).
> Non-unique names for built-in modules also cause problems because
> /sys/modules/ would fall over.
>=20
> I tested allmodconfig on the latest kernel, and it detected the
> following:

A powerpc ppc64_defconfig produces:

warning: same basename if the following are built as modules:
  arch/powerpc/platforms/powermac/nvram.ko
  drivers/char/nvram.ko

Which is a false positive since
arch/powerpc/platforms/powermac/Makefile has

# CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
# need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=3Dm is really
# CONFIG_NVRAM=3Dy
obj-$(CONFIG_NVRAM:m=3Dy)         +=3D nvram.o

Which means that this nvram.o will never be built as a module.
--=20
Cheers,
Stephen Rothwell

--Sig_/A_/Ly4YcWk_rggvMudJw4JL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzh7BMACgkQAVBC80lX
0GyXcgf9EHJI02d2q9r16RMZuwm83yJam/fLG3wWJjYoNeqZN1QuJCMSh/CtISaw
5K2E78DMOAx7Y0FnYqNXNL7AfMATfcXJ33hfHwSu3fN9ImLt7lx7vFPKjruguAT/
KsUQRp4NWg8nlsJCDQNtzisn/vQzOzKI5kxCeExTWExBAvlgQLTebfS7JOc7srYo
1tS139kml2TScMTpaCI9bFGsIfd991j83eKttcDAJODcb2EJwaC+kuOH1hp6eg9z
upbDSjJtkQvyvEo4acV5hlDVF+sMfHoJFPCXfzR8XNAAuALwuoz1fzCYN+28h7zM
a1xxsfX5ZUMnufVrPRp+O7o34QFn8Q==
=9a7G
-----END PGP SIGNATURE-----

--Sig_/A_/Ly4YcWk_rggvMudJw4JL--
