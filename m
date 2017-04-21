Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:58617 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035747AbdDUGWR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 02:22:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/2] kbuild: cleanup asm-offset generation, and make it work with clang
Date: Fri, 21 Apr 2017 15:21:09 +0900
Message-Id: <1492755671-19005-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Matthias Kaehlcke <mka@chromium.org>, David Howells <dhowells@redhat.com>, Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Jan Beulich <JBeulich@novell.com>, Alexander van Heukelum <heukelum@fastmail.fm>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jeroen Hofstee <jeroen@myspectrum.nl>, linux-kernel@vger.kernel.org

1/2 is a trivial cleanup of sed script

2/2 imports clang work-around from U-Boot.


Changes in v2:
  - V1 did not work with LLVM's integrated assembler because
    it uses <tab> instead of <space> around the .ascii string.
    Restore [:space:].

Jeroen Hofstee (1):
  kbuild: fix asm-offset generation to work with clang

Masahiro Yamada (1):
  kbuild: consolidate redundant sed script ASM offset generation

 include/linux/kbuild.h | 6 +++---
 scripts/Makefile.lib   | 9 ++++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.7.4

