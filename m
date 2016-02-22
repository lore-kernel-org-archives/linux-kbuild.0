Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:40834 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754382AbcBVMSS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 07:18:18 -0500
Date: Mon, 22 Feb 2016 12:18:05 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/6] ARM: decompressor: several cleanups
Message-ID: <20160222121805.GD19428@n2100.arm.linux.org.uk>
References: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
 <20160222113625.GC19428@n2100.arm.linux.org.uk>
 <CAK7LNAQEwm=2bHX+kTxFVJTh-sFX+3MBgwuEmmNM-XoyvdbWRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQEwm=2bHX+kTxFVJTh-sFX+3MBgwuEmmNM-XoyvdbWRA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.cz>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Magnus Damm <damm+renesas@opensource.se>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roy Franz <roy.franz@linaro.org>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Mon, Feb 22, 2016 at 09:08:05PM +0900, Masahiro Yamada wrote:
> I did build-test, changing the configuration
> CONFIG_KERNEL_GZIP -> CONFIG_KERNEL_LZMA -> CONFIG_KERNEL_XZ -> ...
> 
> I confirmed zImage was created from the expected piggy.
> 
> For run-test, it worked fine too.

Okay, please drop them into the patch system, thanks.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
