Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53510 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732636AbeHFP0z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Aug 2018 11:26:55 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w76DE7AC074485
        for <linux-kbuild@vger.kernel.org>; Mon, 6 Aug 2018 09:17:51 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2kpppdh4m3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Aug 2018 09:17:51 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Mon, 6 Aug 2018 14:17:49 +0100
Date: Mon, 6 Aug 2018 15:17:42 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH 1/4] trace: handle CC_FLAGS_FTRACE more accurately
References: <cover.thread-aa7b8d.your-ad-here.call-01533557518-ext-9465@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-aa7b8d.your-ad-here.call-01533557518-ext-9465@work.hours>
Message-Id: <patch-1.thread-aa7b8d.git-42971afe87de.your-ad-here.call-01533557518-ext-9465@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

CC_FLAGS_FTRACE is exported and later used to remove ftrace relevant
build flags from files which should be built without ftrace support.
For that reason add -mfentry to CC_FLAGS_FTRACE as well. That fixes
a problem with vdso32 build on s390, where -mfentry could not be used
together with -m31 flag.

At the same time flags like -pg and -mfentry are not relevant for asm
files, so avoid adding them to KBUILD_AFLAGS.

Introduce CC_FLAGS_USING instead of CC_USING_FENTRY to collect
-DCC_USING_FENTRY (and future alike) which are relevant for both
KBUILD_CFLAGS and KBUILD_AFLAGS.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 7a3c4548162b..503f533277c7 100644
--- a/Makefile
+++ b/Makefile
@@ -743,12 +743,15 @@ ifdef CONFIG_FUNCTION_TRACER
 ifndef CC_FLAGS_FTRACE
 CC_FLAGS_FTRACE := -pg
 endif
-export CC_FLAGS_FTRACE
 ifdef CONFIG_HAVE_FENTRY
-CC_USING_FENTRY	:= $(call cc-option, -mfentry -DCC_USING_FENTRY)
+  ifeq ($(call cc-option-yn, -mfentry),y)
+    CC_FLAGS_FTRACE	+= -mfentry
+    CC_FLAGS_USING	+= -DCC_USING_FENTRY
+  endif
 endif
-KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_USING_FENTRY)
-KBUILD_AFLAGS	+= $(CC_USING_FENTRY)
+export CC_FLAGS_FTRACE
+KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
+KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
 ifdef CONFIG_DYNAMIC_FTRACE
 	ifdef CONFIG_HAVE_C_RECORDMCOUNT
 		BUILD_C_RECORDMCOUNT := y
-- 
2.18.0.13.gd42ae10

