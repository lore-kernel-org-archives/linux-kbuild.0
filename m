Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:40742 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754552AbcBVLgu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 06:36:50 -0500
Date: Mon, 22 Feb 2016 11:36:25 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/6] ARM: decompressor: several cleanups
Message-ID: <20160222113625.GC19428@n2100.arm.linux.org.uk>
References: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Roy Franz <roy.franz@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>

On Mon, Feb 22, 2016 at 04:31:11PM +0900, Masahiro Yamada wrote:
> Masahiro Yamada (6):
>   ARM: decompressor: drop unneeded assignments to "targets"
>   ARM: decompressor: drop more unneeded assignments to "targets"
>   ARM: decompressor: use clean-files instead of extra-y to clean files
>   ARM: decompressor: drop redundant FORCE in Makefile
>   ARM: decompressor: merge piggy.*.S and simplify Makefile
>   ARM: decompressor: rename suffix_y to compress-y

Most of this looks fine to me, but I've a question about how thoroughly
patch 5 has been tested: iow, do we get correct behaviour if only the
compression method is changed?

Thanks.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
