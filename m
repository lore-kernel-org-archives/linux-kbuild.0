Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34141 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750716AbdHAFbz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 01:31:55 -0400
Date: Tue, 1 Aug 2017 13:31:59 +0800
From: Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v7 08/15] RISC-V: Atomic and Locking Code
Message-ID: <20170801053159.h3ssqlznowicnsmg@tardis>
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-9-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dnai72hj6sg4ibfz"
Content-Disposition: inline
In-Reply-To: <20170801010009.3302-9-palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, patches@groups.riscv.org


--dnai72hj6sg4ibfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2017 at 06:00:02PM -0700, Palmer Dabbelt wrote:
> This contains all the code that directly interfaces with the RISC-V
> memory model.  While this code corforms to the current RISC-V ISA
> specifications (user 2.2 and priv 1.10), the memory model is somewhat
> underspecified in those documents.  There is a working group that hopes
> to produce a formal memory model by the end of the year, but my
> understanding is that the basic definitions we're relying on here won't
> change significantly.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/include/asm/atomic.h         | 328 ++++++++++++++++++++++++++=
++++++
>  arch/riscv/include/asm/barrier.h        |  68 +++++++
>  arch/riscv/include/asm/bitops.h         | 218 +++++++++++++++++++++
>  arch/riscv/include/asm/cacheflush.h     |  39 ++++
>  arch/riscv/include/asm/cmpxchg.h        | 134 +++++++++++++
>  arch/riscv/include/asm/io.h             | 303 ++++++++++++++++++++++++++=
+++
>  arch/riscv/include/asm/spinlock.h       | 165 ++++++++++++++++
>  arch/riscv/include/asm/spinlock_types.h |  33 ++++
>  arch/riscv/include/asm/tlb.h            |  24 +++
>  arch/riscv/include/asm/tlbflush.h       |  64 +++++++
>  10 files changed, 1376 insertions(+)
>  create mode 100644 arch/riscv/include/asm/atomic.h
>  create mode 100644 arch/riscv/include/asm/barrier.h
>  create mode 100644 arch/riscv/include/asm/bitops.h
>  create mode 100644 arch/riscv/include/asm/cacheflush.h
>  create mode 100644 arch/riscv/include/asm/cmpxchg.h
>  create mode 100644 arch/riscv/include/asm/io.h
>  create mode 100644 arch/riscv/include/asm/spinlock.h
>  create mode 100644 arch/riscv/include/asm/spinlock_types.h
>  create mode 100644 arch/riscv/include/asm/tlb.h
>  create mode 100644 arch/riscv/include/asm/tlbflush.h
>=20
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/ato=
mic.h
> new file mode 100644
> index 000000000000..ee3ab06e492b
> --- /dev/null
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -0,0 +1,328 @@
> +/*
> + * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017 SiFive
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */
> +
> +#ifndef _ASM_RISCV_ATOMIC_H
> +#define _ASM_RISCV_ATOMIC_H
> +
> +#ifdef CONFIG_GENERIC_ATOMIC64
> +# include <asm-generic/atomic64.h>
> +#else
> +# if (__riscv_xlen < 64)
> +#  error "64-bit atomics require XLEN to be at least 64"
> +# endif
> +#endif
> +
> +#include <asm/cmpxchg.h>
> +#include <asm/barrier.h>
> +
> +#define ATOMIC_INIT(i)	{ (i) }
> +static __always_inline int atomic_read(const atomic_t *v)
> +{
> +	return READ_ONCE(v->counter);
> +}
> +static __always_inline void atomic_set(atomic_t *v, int i)
> +{
> +	WRITE_ONCE(v->counter, i);
> +}
> +
> +#ifndef CONFIG_GENERIC_ATOMIC64
> +#define ATOMIC64_INIT(i) { (i) }
> +static __always_inline int atomic64_read(const atomic64_t *v)
                         ^^^^^

should be "long long"?

> +{
> +	return READ_ONCE(v->counter);
> +}
> +static __always_inline void atomic64_set(atomic64_t *v, int i)
                                                          ^^^^^
Ditto.

Have you ever run the selftest with CONFIG_ATOMIC64_SELFTEST=3Dy?

Regards,
Boqun

> +{
> +	WRITE_ONCE(v->counter, i);
> +}
> +#endif
> +
[...]

--dnai72hj6sg4ibfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAlmAEkoACgkQSXnow7UH
+rgRogf/QCzYx/AeWZGeYF/ItyMitBTD50zxJpccH6wuTe5kmiV7N2QRJ8ZZHf2O
TebD4PZd2v2bp5/a7vANsx6Ivo0qv6Ni4RF0n2BH+L2nULV45CExxpCHLfHtx3Og
nca+8N3gwM4jDss34ekmqxSuP5wVj3RNkVEn3BGscAiptsXrB0gOlZ8166NdUZUS
jHPS1kw6KPS8VOGwyScq4/nkUu/DvpJczs//MQRBbYFm/4f7yuv4yVxMrdcrIC2G
EkdyoorFe+tcrRX3NjJcF9CwVEOvvIiNyECOzW+A2iwVzQJBsePFfN1yjxKfcwLh
vKlQSgTxl8QeATKwSM7k76SgRflYzA==
=fDBJ
-----END PGP SIGNATURE-----

--dnai72hj6sg4ibfz--
