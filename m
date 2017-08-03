Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:54728 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751010AbdHCNLq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2017 09:11:46 -0400
Date: Thu, 3 Aug 2017 15:07:33 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [patches] Re: [PATCH v7 01/15] MAINTAINERS: Add RISC-V
Message-ID: <20170803130733.2ivsoo347qbvbore@latitude>
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-2-palmer@dabbelt.com>
 <1501592608.29303.321.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="q3prgldx62wb47jl"
Content-Disposition: inline
In-Reply-To: <1501592608.29303.321.camel@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: patches@groups.riscv.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


--q3prgldx62wb47jl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2017 at 04:03:28PM +0300, Andy Shevchenko wrote:
> On Mon, 2017-07-31 at 17:59 -0700, Palmer Dabbelt wrote:
> > From: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >=20
> > RISC-V needs a MAINTAINERS entry. Let's add one.
> >=20
>=20
> Have you checked this by a brand new script (*) from Linus?=C2=A0
>=20
> (*) parse-maintainers.pl

I've checked the git version of this patch[0], and parse-maintainers.pl
doesn't move the RISC-V entry. (After fixing an unrelated error: SYNC
FILE FRAMEWORK is listed twice.)

[0]: https://github.com/riscv/riscv-linux/commit/281ce9f11e462f6d603516d56a=
02a9565d81587d


Jonathan Neusch=C3=A4fer

--q3prgldx62wb47jl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJZgyALAAoJEAgwRJqO81/b3oYQAK4gaA26yynnC+cin5xrFNdY
83mSgF3eYa5k+V5imLNXPe5pR5f6q7kgBUDVIQM4mHZBROYPRlZtEjKqlpPhr9mD
aseXARugqqDFRHZZnh+n+B+XJNyWbVraVmnPMkYDkPHYU6JSl1HCJ3nbWqgfbG0g
GR6rxNKEmpdBfYdezn5uxEEpotA35v7HNNzxQaXdx2XcqUyaLlS7L4gwwMI2JtWA
8OCugLrRdJp5gEyvRuZ2ZhvMXYTQWUPZ++nUNe1hzmV4UjZaZnTwu0h+jFNRynUY
2S0nJjZnIWVtnMQlwEtLRbS68KYbYTu7yn81ITQ7X7/jfMmC+IB+w2/wqCFD5Kjq
NAoDwKOPuTLKix4NOABtYaptVox/xTINCdrmYCICbHiSoeKtEmd/tiPJVxnu/+0u
pQ+0Z/6qa9ExsPSdPapJ8/sHTaus+OWX3wnOt9jU9ktisv83uh4G84vvM6iOGZij
RSRANcsUvCx2Vs16n/p3zT1FOqHZEMaRaaOgWulaWK3l3RoAeNTmXD/07WcVLYv3
CGBLeZToYikKWqfteb2M2KSVg0+fcrZ0TEKmXFeK2gDvY/WV4DZwrI/KmCyn6y3z
XrrxcSguib7PsFxUDf0B2RZIrx+w5A6EYtxaCS7ADyOaHQyGBNV7PJKKaLNX++/0
BFlwKDf5yYpEoyT7rom8
=18gL
-----END PGP SIGNATURE-----

--q3prgldx62wb47jl--
