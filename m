Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:57496 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752568AbdDNFvG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 01:51:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] kbuild: cleanup asm-offset generation, and make it work with clang
Date: Fri, 14 Apr 2017 14:50:01 +0900
Message-Id: <1492149003-19136-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Matthias Kaehlcke <mka@chromium.org>, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jeroen Hofstee <jeroen@myspectrum.nl>, linux-kernel@vger.kernel.org

1/2 is a trivial cleanup of sed script
2/2 imports clang work-around from U-Boot.


Jeroen Hofstee (1):
  kbuild: fix asm-offset generation to work with clang

Masahiro Yamada (1):
  kbuild: consolidate redundant sed script ASM offset generation

 include/linux/kbuild.h | 6 +++---
 scripts/Makefile.lib   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.7.4

