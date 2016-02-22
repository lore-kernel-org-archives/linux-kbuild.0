Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:32914 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753569AbcBVHcF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 02:32:05 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/6] ARM: decompressor: several cleanups
Date: Mon, 22 Feb 2016 16:31:11 +0900
Message-Id: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Magnus Damm <damm+renesas@opensource.se>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Roy Franz <roy.franz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>




Masahiro Yamada (6):
  ARM: decompressor: drop unneeded assignments to "targets"
  ARM: decompressor: drop more unneeded assignments to "targets"
  ARM: decompressor: use clean-files instead of extra-y to clean files
  ARM: decompressor: drop redundant FORCE in Makefile
  ARM: decompressor: merge piggy.*.S and simplify Makefile
  ARM: decompressor: rename suffix_y to compress-y

 arch/arm/boot/compressed/.gitignore                |  6 +----
 arch/arm/boot/compressed/Makefile                  | 31 ++++++++++------------
 arch/arm/boot/compressed/{piggy.gzip.S => piggy.S} |  2 +-
 arch/arm/boot/compressed/piggy.lz4.S               |  6 -----
 arch/arm/boot/compressed/piggy.lzma.S              |  6 -----
 arch/arm/boot/compressed/piggy.lzo.S               |  6 -----
 arch/arm/boot/compressed/piggy.xzkern.S            |  6 -----
 7 files changed, 16 insertions(+), 47 deletions(-)
 rename arch/arm/boot/compressed/{piggy.gzip.S => piggy.S} (67%)
 delete mode 100644 arch/arm/boot/compressed/piggy.lz4.S
 delete mode 100644 arch/arm/boot/compressed/piggy.lzma.S
 delete mode 100644 arch/arm/boot/compressed/piggy.lzo.S
 delete mode 100644 arch/arm/boot/compressed/piggy.xzkern.S

-- 
1.9.1

