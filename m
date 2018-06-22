Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:43982 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753072AbeFVQL3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 12:11:29 -0400
Date: Fri, 22 Jun 2018 17:11:01 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCHv4 4/4] ARM: versatile: support configuring versatile
 machine for no-MMU
Message-ID: <20180622161101.GW17671@n2100.armlinux.org.uk>
References: <20180618141905.7789-1-gerg@linux-m68k.org>
 <20180618141905.7789-5-gerg@linux-m68k.org>
 <CAMuHMdUyCEq0U_CJindwcSEF+0dR-SJc1v8zGT-CcUqVkdOeVw@mail.gmail.com>
 <nycvar.YSQ.7.76.1806211212010.16670@knanqh.ubzr>
 <20180622110145.GU17671@n2100.armlinux.org.uk>
 <nycvar.YSQ.7.76.1806221110140.16670@knanqh.ubzr>
 <CAMuHMdWZPM3Q9fVXWiw1bMVWNRCYGoQa-XukJka-2xsP-=HmVQ@mail.gmail.com>
 <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1806221146140.16670@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Chris Brandt <Chris.Brandt@renesas.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Fri, Jun 22, 2018 at 11:57:32AM -0400, Nicolas Pitre wrote:
> That is no longer a kernel config/build issue if you the system 
> integrator put an XIP kernel on a target with the wrong DT.
> 
> The XIP kernel does require that you provide the actual memory base 
> address as a constant to the build system but that could be extracted 
> directly from the DT data if having a kconfig prompt for that is too 
> unwieldy. The new kconfig macro language in mainline could even be 
> leveraged to do that at config time.

That is actually incorrect - you're too used to the dynamic fixup of
virt_to_phys() and friends now!

Given that XIP is typically used in environments where the kernel text
is very much unmodifyable, we disable CONFIG_ARM_PATCH_PHYS_VIRT.  When
disabled, we use a constant translation, based upon the build-time
CONFIG_PHYS_OFFSET and CONFIG_PAGE_OFFSET settings.

The early assembler relies upon these settings - which must be known
before we enable the MMU.  As such, DT parsing is not available to us
at that point (as we can't run any C code, because we won't be calling
it at the address it was linked for.)

I suppose someone who was sufficiently motivated could write assembly-
based parsing of DT to extract the memory regions and work out what the
right settings are.  Is there really the motivation to do that - there
was a burst of XIP interest a few releases ago but it seems to have
tailed off.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
