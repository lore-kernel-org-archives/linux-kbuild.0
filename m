Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37793 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754740AbeDZV3d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Apr 2018 17:29:33 -0400
Received: by mail-pg0-f66.google.com with SMTP id a13so12435670pgu.4
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Apr 2018 14:29:33 -0700 (PDT)
From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] kbuild: gcov: enable -fno-tree-loop-im if supported
Date: Thu, 26 Apr 2018 14:28:07 -0700
Message-Id: <20180426212807.196279-1-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Prasad Sodagudi <psodagud@quicinc.com>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Clang does not recognize this compiler option.

Reported-by: Prasad Sodagudi <psodagud@quicinc.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 83b6c541565a..7f653c924c18 100644
--- a/Makefile
+++ b/Makefile
@@ -623,7 +623,9 @@ all: vmlinux
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
 KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disable-warning,maybe-uninitialized,)
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
+	$(call cc-option,-fno-tree-loop-im) \
+	$(call cc-disable-warning,maybe-uninitialized,)
 export CFLAGS_GCOV CFLAGS_KCOV
 
 # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
-- 
2.17.0.441.gb46fe60e1d-goog

