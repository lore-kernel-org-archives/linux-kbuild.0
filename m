Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:33706 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754539AbdJIOhF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 10:37:05 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] ARM, hexagon, c6x: build: fix usage of CFLAGS_MODULE, LDFLAGS_MODULE
Date: Mon,  9 Oct 2017 23:35:12 +0900
Message-Id: <1507559715-30918-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Salter <msalter@redhat.com>, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, Richard Kuo <rkuo@codeaurora.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org

CFLAGS_MODULE, AFLAGS_MODULE, and LDFLAGS_MODULE are supposed
to be set by users.

In-kernel Makefile must use KBUILD_ prefixed variables.

This is explained in Documentation/kbuild/{kbuild.txt, makefiles.txt}

Most of architectures follow the rule, but I found violations
in ARM, hexagone, and c6x.

Fix them.



Masahiro Yamada (3):
  ARM: add KBUILD_ prefix to CFLAGS_MODULE, LDFLAGS_MODULE
  hexagon: add KBUILD_ prefix to CFLAGS_MODULE, LDFLAGS_MODULE
  c6x: add KBUILD_ prefix to CFLAGS_MODULE

 arch/arm/Makefile     | 6 +++---
 arch/c6x/Makefile     | 2 +-
 arch/hexagon/Makefile | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.7.4

