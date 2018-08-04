Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:64044 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbeHDGsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Aug 2018 02:48:21 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] Kbuild: fix and clean-up arch/um/Makefile
Date: Sat,  4 Aug 2018 13:47:00 +0900
Message-Id: <1533358023-5801-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org


1/3 fixes the build failure reported by Randy.
(I may have seen a similar report before, but I cannot recall it.)

2/3 and 3/3 clean-up the Makefile a bit more.

I'd like to apply this series to kbuild tree.
Ack from UML folks are appreciated.



Masahiro Yamada (3):
  um: fix parallel building with O= option
  kbuild: add %asm-generic to no-dot-config-targets
  um: clean up archheaders recipe

 Makefile         | 2 +-
 arch/um/Makefile | 9 +--------
 2 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.7.4

