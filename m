Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:53288 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751784AbdINLGx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2017 07:06:53 -0400
Date: Thu, 14 Sep 2017 13:04:06 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [patches] [PATCH v8 08/18] irqchip: New RISC-V PLIC Driver
Message-ID: <20170914110406.nwn2yaqaubmidvph@latitude>
References: <20170912215715.4186-1-palmer@dabbelt.com>
 <20170912215715.4186-9-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fhjitk4sl7kx6uvj"
Content-Disposition: inline
In-Reply-To: <20170912215715.4186-9-palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: patches@groups.riscv.org
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, dmitriy@oss-tech.org, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>


--fhjitk4sl7kx6uvj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 12, 2017 at 02:57:05PM -0700, Palmer Dabbelt wrote:
> This patch adds a driver for the Platform Level Interrupt Controller
> (PLIC) specified as part of the RISC-V supervisor level ISA manual.
> The PLIC connocts global interrupt sources to the local interrupt

s/connocts/connects/?

> controller on each hart.  A PLIC is present on all RISC-V systems.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
[...]
> +/*
> + * The PLIC consists of memory-mapped control registers, with a memory m=
ap as
> + * follows:

This memory map is mostly still as confusing as before (see my email in
the v7 thread).

> + *
> + * base + 0x000000: Reserved (interrupt source 0 does not exist)
> + * base + 0x000004: Interrupt source 1 priority
> + * base + 0x000008: Interrupt source 2 priority
> + * ...
> + * base + 0x000FFC: Interrupt source 1023 priority
> + * base + 0x001000: Pending 0
> + * base + 0x001FFF: Pending
> + * base + 0x002000: Enable bits for sources 0-31 on context 0
> + * base + 0x002004: Enable bits for sources 32-63 on context 0
> + * ...
> + * base + 0x0020FC: Enable bits for sources 992-1023 on context 0
> + * base + 0x002080: Enable bits for sources 0-31 on context 1
> + * ...
> + * base + 0x002100: Enable bits for sources 0-31 on context 2
> + * ...
> + * base + 0x1F1F80: Enable bits for sources 992-1023 on context 15871
> + * base + 0x1F1F84: Reserved
> + * ...              (higher context IDs would fit here, but wouldn't fit
> + *                   inside the per-context priority vector)
> + * base + 0x1FFFFC: Reserved
> + * base + 0x200000: Priority threshold for context 0
> + * base + 0x200004: Claim/complete for context 0
> + * base + 0x200008: Reserved
> + * ...
> + * base + 0x200FFC: Reserved
> + * base + 0x201000: Priority threshold for context 1
> + * base + 0x201004: Claim/complete for context 1
> + * ...
> + * base + 0xFFE000: Priority threshold for context 15871
> + * base + 0xFFE004: Claim/complete for context 15871
> + * base + 0xFFE008: Reserved
> + * ...
> + * base + 0xFFFFFC: Reserved
> + */


Jonathan Neusch=C3=A4fer

--fhjitk4sl7kx6uvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJZumIdAAoJEAgwRJqO81/bfqgQAM2j2x9v6V2d+NKHS7/UEJ2h
K2vGgSbsskYaSRp4ZuWYYVrur9kvebf19wnDZWrVFmQfPmW8PI68qGteZxQ8UkgN
jP2D2cRggSPsz+VeTRpZdKClnml3ckCj6MzTwYvaYrJ7amm7ph9Y/ND/c+DaGg5U
v7VOtHIJOy+8jfVtr5Njp7nj4OTaYHDXUdqu5OhqszhohQQpkPOLtTlqgj2OXnYp
UtiF6eODQeO6iyw/w9Hc1UNxY668ru4/lj95/FblADpdu1JWJiaWsdUSFMdKcXAV
XDBa7SRKfo4jI7xNzrt7082XUKkFkLLS9a+UoNjMqlZC3ZX26g0kkvcFGK+Usp3/
IQDOtuUBXCSZPxsilfpVXvIqZiRNqVelRzJG70D8bzKP6udV3KrBFzOcdXiRK+Go
Mz7cRqNpJxb/H/Zzx2mZlZzPCUDMewPcx1MJmzRT6cy68C2+9rLNC9FYaf4cJkzs
7j9nSLJWM/p7otn0LbbkziD1NM8SpGZ+AGP4qr9rZZa37df/7RBbuVMX8dNixDr6
M5Qj1/0gyf3eZ5UtmcCFiIuAoVQ0/GUPEzdJi5J9zwiJZZRK3+AyCM8gTdOD3jdV
pCs74A8MhPehqvHMeQNCfNSJelhBGpnL65Z9QW+dilY48q8I2QvlUKrFuEzUhbLG
/I9AjYdVgKacXAY64LPN
=nP49
-----END PGP SIGNATURE-----

--fhjitk4sl7kx6uvj--
