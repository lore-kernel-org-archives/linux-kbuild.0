Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:15570 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932721AbeFVRXO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 13:23:14 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Date: Fri, 22 Jun 2018 17:23:09 +0000
Message-ID: <TY1PR01MB1562C54E8DD3942F40F8CBBD8A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180618141905.7789-1-gerg@linux-m68k.org>
 <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr>
 <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
 <TY1PR01MB15624342267F973525BF45698A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <nycvar.YSQ.7.76.1806221244490.16670@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1806221244490.16670@knanqh.ubzr>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Friday, June 22, 2018, Nicolas Pitre wrote:
> > So, why do we feel that XIP_KERNEL needs a warm safety blanket around
> > it?
>=20
> Because we simply try not to create invalid kernel configurations.
> XIP_KERNEL is not more special than other symbols in that respect.

Then here's a question.

To be clear, the discussion is around

  "Being able to build a kernel that will not boot"

So which one of these is more important: build or boot?

Meaning what if you can select multiple platforms in kconfig, but then=20
there is a .c file that does more sanity checking that then prevents the=20
full build using a #error.

In that case you can never "build" a kernel that has no chance of=20
booting on all the selected platforms.

There are configs options today that you can select, but unless some=20
external criteria is  met during build time, the build will fail (like
with a "missing .h file" message or something)


Chris
