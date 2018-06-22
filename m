Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:44748 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934164AbeFVQoI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 12:44:08 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Date: Fri, 22 Jun 2018 16:44:04 +0000
Message-ID: <TY1PR01MB15624342267F973525BF45698A750@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180618141905.7789-1-gerg@linux-m68k.org>
 <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr>
 <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Friday, June 22, 2018 1, Nicolas Pitre wrote:
> All that is possible already. But config symbol mutual exclusion is not.

I still don't understand why we need some false sense of security for=20
only selecting 1 platform.

There are probably plenty of kernel config options that you could enable
that would break any number of systems.

So, why do we feel that XIP_KERNEL needs a warm safety blanket around=20
it?

Chris
