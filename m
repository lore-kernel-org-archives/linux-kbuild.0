Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:16178 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934204AbeFVQlB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 12:41:01 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Date: Fri, 22 Jun 2018 16:40:55 +0000
Message-ID: <TY1PR01MB15627B7B0BE8BABD439724A78A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180618141905.7789-1-gerg@linux-m68k.org>
 <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr>
 <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
 <20180622161101.GW17671@n2100.armlinux.org.uk>
In-Reply-To: <20180622161101.GW17671@n2100.armlinux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

> That is actually incorrect - you're too used to the dynamic fixup of
> virt_to_phys() and friends now!
>=20
> Given that XIP is typically used in environments where the kernel text
> is very much unmodifyable, we disable CONFIG_ARM_PATCH_PHYS_VIRT.  When
> disabled, we use a constant translation, based upon the build-time
> CONFIG_PHYS_OFFSET and CONFIG_PAGE_OFFSET settings.

CONFIG_PHYS_OFFSET (RAM address) and CONFIG_XIP_PHYS_ADDR (ROM address)=20
are set today in kconfig.

Instead of having them hard coded, they could be global variables set=20
during boot.

CONFIG_XIP_PHYS_ADDR could be determined by looking at the value of the=20
PC.

CONFIG_PHYS_OFFSET is still the issue because that has to be passed in=20
via boot register.


> I suppose someone who was sufficiently motivated could write assembly-
> based parsing of DT to extract the memory regions and work out what the
> right settings are.  Is there really the motivation to do that - there
> was a burst of XIP interest a few releases ago but it seems to have
> tailed off.

Because at least for me, by simply removing the !ARCH_MULTIPLATFORM=20
dependency for setting XIP_KERNEL works perfectly fine for building and=20
running kernels.

So, it's hard to justify doing a lot more work than what can be done=20
today with just 1 line edit.

I still test every kernel release to make XIP_KERNEL still works.

Actually, I just tested 4.18.0-rc1 this morning.


Chris

