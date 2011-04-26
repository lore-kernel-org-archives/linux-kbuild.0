Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:35420 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754205Ab1DZRFr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 13:05:47 -0400
From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH] kbuild: make KBUILD_NOCMDDEP=1 handle empty built-in.o
Date: Tue, 26 Apr 2011 22:36:04 +0530
Message-Id: <1303837564-18062-1-git-send-email-rabin@rab.in>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Rabin Vincent <rabin@rab.in>

Fix building with KBUILD_NOCMDDEP=1, which currently does not work
because it does not build built-in.o with no dependencies:

  LD      fs/notify/built-in.o
ld: cannot find fs/notify/dnotify/built-in.o: No such file or directory
ld: cannot find fs/notify/inotify/built-in.o: No such file or directory
ld: cannot find fs/notify/fanotify/built-in.o: No such file or directory

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 scripts/Kbuild.include |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index ed2773e..fd31781 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -187,6 +187,10 @@ ifneq ($(KBUILD_NOCMDDEP),1)
 # User may override this check using make KBUILD_NOCMDDEP=1
 arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
                     $(filter-out $(cmd_$@),   $(cmd_$(1))) )
+else
+# Ensure that files with no dependencies are built.
+built-check = $(filter $(origin cmd_$@), undefined)
+arg-check = $(if $(strip $(obj-y)),,$(built-check))
 endif
 
 # >'< substitution is for echo to work,
-- 
1.7.4.1

