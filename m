Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:40207 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752771AbZIBTfi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2009 15:35:38 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e39.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n82JUSe3016194
	for <linux-kbuild@vger.kernel.org>; Wed, 2 Sep 2009 13:30:28 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n82JZXWd165376
	for <linux-kbuild@vger.kernel.org>; Wed, 2 Sep 2009 13:35:35 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n82JZXFf013382
	for <linux-kbuild@vger.kernel.org>; Wed, 2 Sep 2009 13:35:33 -0600
Received: from linux.ibm.com (imap.raleigh.ibm.com [9.37.253.145])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id n82JZVoh013323
	for <linux-kbuild@vger.kernel.org>; Wed, 2 Sep 2009 13:35:31 -0600
Message-ID: <20090902153531.8tgab38an4kgg4cs@imap.linux.ibm.com>
Date: Wed,  2 Sep 2009 15:35:31 -0400
From: cndougla@linux.vnet.ibm.com
Subject: [PATCH] Makefile: make clean keep bounds.h and asm-offsets.h
	(previous patch had ws issues)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
	DelSp=Yes	format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

make clean is supposed to leave the kernel in a state such that  
modules may be built against it. However, currently make clean deletes  
include/linux/bounds.h and include/asm/asm-offsets.h, which are needed  
to build kernel modules. The following patch filters these two files  
from the targets to be cleaned.

Signed-off-by: Chase Douglas <cndougla@linux.vnet.ibm.com>

diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 6f89fbb..1ad01f8 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -40,10 +40,11 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
  # build a list of files to remove, usually relative to the current
  # directory

-__clean-files	:= $(extra-y) $(always)                  \
+__clean-files	:= $(filter-out $(bounds-file) $(offsets-file), \
+		   $(extra-y) $(always)                  \
  		   $(targets) $(clean-files)             \
  		   $(host-progs)                         \
-		   $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
+		   $(hostprogs-y) $(hostprogs-m) $(hostprogs-))

  # as clean-files is given relative to the current directory, this adds
  # a $(obj) prefix, except for absolute paths


