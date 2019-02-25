Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41850 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbfBYQxd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Feb 2019 11:53:33 -0500
Date: Mon, 25 Feb 2019 16:53:14 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] [v2] kasan: turn off asan-stack for clang-8 and earlier
Message-ID: <20190225165314.GC13898@sirena.org.uk>
References: <20190222222950.3997333-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <20190222222950.3997333-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Qian Cai <cai@lca.pw>, Kostya Serebryany <kcc@google.com>, Andrey Konovalov <andreyknvl@google.com>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 22, 2019 at 11:29:10PM +0100, Arnd Bergmann wrote:
> Building an arm64 allmodconfig kernel with clang results in over 140 warnings
> about overly large stack frames, the worst ones being:

Reviewed-by: Mark Brown <broonie@kernel.org>

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlx0HXkACgkQJNaLcl1U
h9DxnAf/V+F2ebTkIHA0IRg4ScHkk50z/xCZpeaBXpk9t8DTI49Ih9Vd0DvsiHik
VWhvyGOVDr5Rth/JKnY22vICnYzL6IspKHLOtNeGamI7xvgT17dVpoiijht7vlyX
/tzpD8c++a8DcpEkSmMAJSKX3fJpPbljmzyRNCpAVy97WYUBq6wfvpf/KT8b3PIe
PdZxRoBSMPcGzHi2rD/6Pl7xdXcgavH0ywMEdgC7joTD62MHOl7Xv3jN26gRTiYJ
4ynuCsf8pdM3SaDp1f2eJqgD/Jgo0UKmRjmj1B4qcmVMVqxn97TNBSEC2y2CNBMw
ppDkjsJn6uLnP8k9gZSqt+I1MczF7w==
=2CZ+
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
