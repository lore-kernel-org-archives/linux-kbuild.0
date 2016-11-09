Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36681 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751783AbcKIEeT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2016 23:34:19 -0500
Received: by mail-pf0-f193.google.com with SMTP id n85so22014517pfi.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Nov 2016 20:34:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] kbuild: be more careful about matching preprocessed asm ___EXPORT_SYMBOL
Date: Wed,  9 Nov 2016 15:34:05 +1100
Message-Id: <20161109043405.16344-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?q?Philip=20M=C3=BCller?= <philm@manjaro.org>, Adam Borowski <kilobyte@angband.pl>, linux-kbuild@vger.kernel.org

The CRC code for asm exports grabs the preprocessed asm, finds the
___EXPORT_SYMBOL and turns those into EXPORT_SYMBOL in a C program
that can be preprocessed and parsed to create the CRC signatures from
the type.

The existing regex matching and replacement is too strict, and doesn't
deal well with whitespace among other things. The line
" EXPORT_SYMBOL(sym)" in a .S file would not match due to initial
whitespace, for example, which resulted in x86's ___preempt_schedule
failing to get CRCs.

Reported-by: Philip Müller <philm@manjaro.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3e223c2..7675d11 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -332,8 +332,8 @@ cmd_gensymtypes_S =                                                         \
     (echo "\#include <linux/kernel.h>" ;                                    \
      echo "\#include <asm/asm-prototypes.h>" ;                              \
     $(CPP) $(a_flags) $< |                                                  \
-     grep ^___EXPORT_SYMBOL |                                               \
-     sed 's/___EXPORT_SYMBOL \([a-zA-Z0-9_]*\),.*/EXPORT_SYMBOL(\1);/' ) |  \
+     grep "\<___EXPORT_SYMBOL\>" |                                          \
+     sed 's/.*___EXPORT_SYMBOL[[:space:]]*\([a-zA-Z0-9_]*\)[[:space:]]*,.*/EXPORT_SYMBOL(\1);/' ) | \
     $(CPP) -D__GENKSYMS__ $(c_flags) -xc - |                                \
     $(GENKSYMS) $(if $(1), -T $(2))                                         \
      $(patsubst y,-s _,$(CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX))             \
-- 
2.10.2

