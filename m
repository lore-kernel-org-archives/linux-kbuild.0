Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:45740 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751228AbdJHRgP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:36:15 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 0/3] kconfig: Fix expression memory leaks
Date: Sun,  8 Oct 2017 19:35:43 +0200
Message-Id: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Hello,

This patchset plugs all memory leaks that are due to expressions not being
freed, when parsing the x86 Kconfigs (and likely the other ARCHes too). 336 KB
are leaked in total.

Together with the memory leaks plugged in the parser in
https://lkml.org/lkml/2017/10/8/126, this plugs all memory leaks when parsing
the x86 Kconfigs.

As a reminder, the parsers can be rebuilt like this:

	$ make REGENERATE_PARSERS=1 conf

Here's an easy way to run Valgrind on menuconfig (nothing seems to look at
KERNELVERSION, so just set it to avoid a warning):

	$ ARCH=x86 SRCARCH=x86 KERNELVERSION=4.14.0-rc2 valgrind --leak-check=full scripts/kconfig/mconf Kconfig

Cheers,
Ulf

Ulf Magnusson (3):
  kconfig: Fix automatic menu creation mem leak
  kconfig: Fix expr_free() E_NOT leak
  kconfig: Fix choice symbol expression leak

 scripts/kconfig/expr.c | 2 +-
 scripts/kconfig/menu.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.7.4

