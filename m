Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp08.uk.ibm.com ([195.75.94.104]:60184 "EHLO
	e06smtp08.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752799AbbKULAH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Nov 2015 06:00:07 -0500
Received: from localhost
	by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Sat, 21 Nov 2015 11:00:05 -0000
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH 2/2] s390: compile head.s always with -march=z900
Date: Sat, 21 Nov 2015 11:59:59 +0100
Message-Id: <1448103599-6660-3-git-send-email-heiko.carstens@de.ibm.com>
In-Reply-To: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
References: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

head.s on s390 contains some sanity checks if the kernel will run on a
machine or if the machine is too old, e.g. if the kernel contains
instructions not available on the machine. If so, it will emit an error
message to the console before it stops execution.

Therefore head.s contains only instructions which are availanble with the
earliest machine generation (z900).  In order to make sure we don't
accidently add instructions which are not available on z900, always compile
with -march=z900. This makes sure compilation will fail if wrong
instructions are used.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/kernel/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
index dc167a23b920..a53755e37e3d 100644
--- a/arch/s390/kernel/Makefile
+++ b/arch/s390/kernel/Makefile
@@ -34,8 +34,10 @@ CFLAGS_sysinfo.o += -w
 #
 CFLAGS_REMOVE_sclp.o = $(CC_FLAGS_FTRACE)
 ifneq ($(CC_FLAGS_MARCH),-march=z900)
-CFLAGS_REMOVE_sclp.o += $(CC_FLAGS_MARCH)
-CFLAGS_sclp.o	+= -march=z900
+CFLAGS_REMOVE_sclp.o 	+= $(CC_FLAGS_MARCH)
+CFLAGS_sclp.o		+= -march=z900
+AFLAGS_REMOVE_head.o	+= $(CC_FLAGS_MARCH)
+AFLAGS_head.o		+= -march=z900
 endif
 GCOV_PROFILE_sclp.o := n
 
-- 
2.3.9

