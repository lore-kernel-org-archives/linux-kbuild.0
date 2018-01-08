Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:39454 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756871AbeAHLWp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jan 2018 06:22:45 -0500
Date: Mon, 8 Jan 2018 11:22:01 +0000
From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] tools: fix cross-compile var clobbering
Message-ID: <20180108112201.GB11698@sirena.org.uk>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107214028.23771-1-martin@martingkelly.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <20180107214028.23771-1-martin@martingkelly.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Kelly <martin@martingkelly.com>
Cc: linux-kbuild@vger.kernel.org, Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, Linus Walleij <linus.walleij@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Robert Moore <robert.moore@intel.com>, Lv Zheng <lv.zheng@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 07, 2018 at 01:40:28PM -0800, Martin Kelly wrote:
> From: Martin Kelly <martin@martingkelly.com>
>=20
> Currently a number of Makefiles break when used with toolchains that pass
> extra flags in CC and other cross-compile related variables (such as
> --sysroot). Thus we get this error when we use a toolchain that puts
> --sysroot in the CC var:

Acked-by: Mark Brown <broonie@kernel.org>

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpTVFgACgkQJNaLcl1U
h9ADmgf/WmuvV5JevHZich7pRhl2G4aaGMSDCSbP8nPy0+qKSM2MrU1OV9P8YfPi
4Z2QFM+ceOJ3K9MnaR0JDDU63W4tsHRXovo9UoqNpmquhW5DN8NFBjPrQ9Flni8f
0rjA6er7InJw96mYMubjSWJiXYCYkZwcUIZ3p3ucsF46SH9VcaNWubHa3Vh1z+jh
A12e1AZA9Vbiz86y6iUN1HY8JM3SbZ7mEQ7NnDnzhtdlLzj1sWhq9IsjOpGCu+NE
7U6+87skSmCpi6AqKbrnnpizMPcS1zL0daJOu7BnkvxmGrjqpaq+AgEFliNYQXoD
6lzXMbYVbPeLFefKSBHU7Ab1v++Mhg==
=o63r
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
