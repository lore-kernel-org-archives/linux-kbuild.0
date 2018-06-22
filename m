Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:45553 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934049AbeFVQVf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 12:21:35 -0400
Received: by mail-qt0-f193.google.com with SMTP id i18-v6so6371484qtp.12
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Jun 2018 09:21:35 -0700 (PDT)
Date: Fri, 22 Jun 2018 12:21:33 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
In-Reply-To: <20180622161101.GW17671@n2100.armlinux.org.uk>
Message-ID: <nycvar.YSQ.7.76.1806221218230.16670@knanqh.ubzr>
References: <20180618141905.7789-1-gerg@linux-m68k.org> <20180618141905.7789-5-gerg@linux-m68k.org> <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com> <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr> <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr> <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com> <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr> <20180622161101.GW17671@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Chris Brandt <Chris.Brandt@renesas.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, 22 Jun 2018, Russell King - ARM Linux wrote:

> On Fri, Jun 22, 2018 at 11:57:32AM -0400, Nicolas Pitre wrote:
> > That is no longer a kernel config/build issue if you the system 
> > integrator put an XIP kernel on a target with the wrong DT.
> > 
> > The XIP kernel does require that you provide the actual memory base 
> > address as a constant to the build system but that could be extracted 
> > directly from the DT data if having a kconfig prompt for that is too 
> > unwieldy. The new kconfig macro language in mainline could even be 
> > leveraged to do that at config time.
> 
> That is actually incorrect - you're too used to the dynamic fixup of
> virt_to_phys() and friends now!
> 
> Given that XIP is typically used in environments where the kernel text
> is very much unmodifyable, we disable CONFIG_ARM_PATCH_PHYS_VIRT.  When
> disabled, we use a constant translation, based upon the build-time
> CONFIG_PHYS_OFFSET and CONFIG_PAGE_OFFSET settings.
> 
> The early assembler relies upon these settings - which must be known
> before we enable the MMU.  As such, DT parsing is not available to us
> at that point (as we can't run any C code, because we won't be calling
> it at the address it was linked for.)

I think you got me wrong.  I meant DT parsing at config or build time, 
not at run time.

Latest mainline allows kconfig files to call out to external programs 
now.


Nicolas
