Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:57287 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751918AbdHCWZ1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2017 18:25:27 -0400
Date: Fri, 4 Aug 2017 00:22:50 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [patches] [PATCH v7 05/15] irqchip: New RISC-V PLIC Driver
Message-ID: <20170803221036.ijhv72w7pvjbp2jc@latitude>
References: <20170801010009.3302-1-palmer@dabbelt.com>
 <20170801010009.3302-6-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ylssuhhelsyymerl"
Content-Disposition: inline
In-Reply-To: <20170801010009.3302-6-palmer@dabbelt.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: patches@groups.riscv.org
Cc: peterz@infradead.org, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, Arnd Bergmann <arnd@arndb.de>, yamada.masahiro@socionext.com, mmarek@suse.com, albert@sifive.com, will.deacon@arm.com, boqun.feng@gmail.com, oleg@redhat.com, mingo@redhat.com, daniel.lezcano@linaro.org, gregkh@linuxfoundation.org, jslaby@suse.com, davem@davemloft.net, mchehab@kernel.org, hverkuil@xs4all.nl, rdunlap@infradead.org, viro@zeniv.linux.org.uk, mhiramat@kernel.org, fweisbec@gmail.com, mcgrof@kernel.org, dledford@redhat.com, bart.vanassche@sandisk.com, sstabellini@kernel.org, mpe@ellerman.id.au, rmk+kernel@armlinux.org.uk, paul.gortmaker@windriver.com, nicolas.dichtel@6wind.com, linux@roeck-us.net, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, geert@linux-m68k.org, akpm@linux-foundation.org, jiri@mellanox.com, vgupta@synopsys.com, airlied@redhat.com, jk@ozlabs.org, chris@chris-wilson.co.uk, Jason@zx2c4.com, paulmck@linux.vnet.ibm.com, ncardwell@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>


--ylssuhhelsyymerl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 31, 2017 at 05:59:59PM -0700, Palmer Dabbelt wrote:
> This patch adds a driver for the Platform Level Interrupt Controller
> (PLIC) specified as part of the RISC-V supervisor level ISA manual.
> The PLIC connocts global interrupt sources to the local interrupt

s/connocts/connects/

> controller on each hart.  A PLIC is present on all RISC-V systems.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
[...]
> +/*
> + * From the RISC-V Privlidged Spec v1.10:
> + *
> + * Global interrupt sources are assigned small unsigned integer identifi=
ers,
> + * beginning at the value 1.  An interrupt ID of 0 is reserved to mean =
=E2=80=9Cno
> + * interrupt=E2=80=9D.  Interrupt identifiers are also used to break tie=
s when two or
> + * more interrupt sources have the same assigned priority. Smaller value=
s of
> + * interrupt ID take precedence over larger values of interrupt ID.
> + *
> + * While the RISC-V supervisor spec doesn't define the maximum number of
> + * devices supported by the PLIC, the largest number supported by devices
> + * marked as 'riscv,plic0' (which is the only device type this driver su=
pports,
> + * and is the only extant PLIC as of now) is 1024.  As mentioned above, =
device
> + * 0 is defined to be non-existant so this device really only supports 1=
023
> + * devices.
> + */
> +#define MAX_DEVICES	1024
> +#define MAX_CONTEXTS	15872

How do you derive 15872 as the value of MAX_CONTEXTS?

> +
> +/*
> + * The PLIC consists of memory-mapped control registers, with a memory m=
ap as
> + * follows:
> + *
> + * base + 0x000000: Reserved (interrupt source 0 does not exist)
> + * base + 0x000004: Interrupt source 1 priority
> + * base + 0x000008: Interrupt source 2 priority
> + * ...
> + * base + 0x000FFC: Interrupt source 1023 priority
> + * base + 0x001000: Pending 0
> + * base + 0x001FFF: Pending

"Pending"?

> + * base + 0x002000: Enable bits for sources 0-31 on context 0
> + * base + 0x002004: Enable bits for sources 32-63 on context 0
> + * ...

> + * base + 0x0020FC: Enable bits for sources 992-1023 on context 0
> + * base + 0x002080: Enable bits for sources 0-31 on context 1

This seems to overlap. Are more than 512 sources per context actually
possible?

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
> + * base + 0xFFF008: Reserved

0xFFE004 and 0xFFF008 are 0x1004 bytes apart. Is 0xFFF008 a typo?

> + * ...
> + * base + 0xFFFFFC: Reserved

As far as I can see, given that the Priority threshold/Claim/complete
area begins at base+0x200000 and ends at base+0x1000000 (exclusive), and
the space occupied by one context is 0x1000 bytes, there should be space
for (0x1000000-0x200000)/0x1000 =3D 0xe00 =3D 3584, not 15872 contexts.
Am I missing something?


Jonathan Neusch=C3=A4fer

--ylssuhhelsyymerl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJZg6IwAAoJEAgwRJqO81/bvsQP/RKLRA3Ogi2jdnFxByNDVmm1
pyz/A28hNCyJWVMAYL42rhDG9RkiwWyakWs/UI67rZjPjYuYAQS4ECRyHsMYLScW
ihJefjVeAIW2FOn8rtmpwHKLbgLh/rKsZT9keqLbMehuuuOSeMvTJjToMcuRrkq4
kykn/2sQV5WESro4kLvQanm2SAPi8E3dj567hNqROaBn4lk+n7ne+93thWUT3Go2
SnG667zFxarxK0Kj42k2d3p6zSHL++y+d1XPHg5NkP6gQGwdBeoaD/zIKlrhJ3zg
Rkcw85tZLAgqw8hkRpMmVTnNDb5gor9loTeffEmB5eGWuYvNbp4N682b7KvpWuAr
zqIZ9ErwSPE9W58VJHLwWB9qwg68v/iRp82KM6sfDuCxLzFCIaW1tgSBB84hEU9t
vu98Oa/t1J82zjq18ap8D5BGKiHbObOwRdZJkK3jdBuqe7fJ8xw/KXRH4NlSmobI
JtRumC27oo7EAEqkUbXXTx5wqaoqXHsxVNedguZ7B0UHvOSyypcuvuUsHRhWR6Mr
7olboif9QKn3sj8u31HOTukYK6l7ns2g6j21Yq48Llm5TMVG6s7/N0rgQJGL1h86
gMytEtqBn+iWXGoIqzO80ja2v+drX0Y0OaCxVR3A/ZGujc43ysNIk/VBP54Nf5iB
k42Mt6IYnygKjYwmUwYY
=UASC
-----END PGP SIGNATURE-----

--ylssuhhelsyymerl--
