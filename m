Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:37146 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752121AbbKULAH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Nov 2015 06:00:07 -0500
Received: from localhost
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Sat, 21 Nov 2015 11:00:05 -0000
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH 1/2] kbuild: add AFLAGS_REMOVE_(basename).o option
Date: Sat, 21 Nov 2015 11:59:58 +0100
Message-Id: <1448103599-6660-2-git-send-email-heiko.carstens@de.ibm.com>
In-Reply-To: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
References: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

It is already possible to remove CFLAGS with the CFLAGS_REMOVE option
that was introduced with commit 656ee82cc855 ("kbuild: create new
CFLAGS_REMOVE_(basename).o option").  However it is not possible to
remove AFLAGS for assembler files.

So this patch just adds the AFLAGS_REMOVE option which works the same
like CFLAGS_REMOVE.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 scripts/Makefile.lib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e86613712f..26a48d76eb9d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -104,8 +104,9 @@ modname_flags  = $(if $(filter 1,$(words $(modname))),\
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(basetarget).o)
 _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(orig_c_flags))
-_a_flags       = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
+orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
                  $(asflags-y) $(AFLAGS_$(basetarget).o)
+_a_flags       = $(filter-out $(AFLAGS_REMOVE_$(basetarget).o), $(orig_a_flags))
 _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(@F))
 
 #
-- 
2.3.9

