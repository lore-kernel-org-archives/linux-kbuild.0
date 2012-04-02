Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:51066 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab2DBOGN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Apr 2012 10:06:13 -0400
Received: by bkcik5 with SMTP id ik5so2514445bkc.19
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Apr 2012 07:06:11 -0700 (PDT)
From: Andrej Krutak <andree@andree.sk>
Subject: [PATCH] Fix build failure on cygwin.
Date: Mon,  2 Apr 2012 16:05:35 +0200
Message-Id: <1333375535-6589-1-git-send-email-andree@andree.sk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Andrej Krutak <andree@andree.sk>

The _B macro is defined by cygwin in ctype.h.
Move the inclusion to avoid build failure.

Signed-off-by: Andrej Krutak <andree@andree.sk>
---
 scripts/dtc/dtc.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h
index f37c97e..7aa3cc6 100644
--- a/scripts/dtc/dtc.h
+++ b/scripts/dtc/dtc.h
@@ -27,13 +27,13 @@
 #include <stdint.h>
 #include <stdarg.h>
 #include <assert.h>
-#include <ctype.h>
 #include <errno.h>
 #include <unistd.h>
 
 #include <libfdt_env.h>
 #include <fdt.h>
 
+#include <ctype.h>
 #include "util.h"
 
 #ifdef DEBUG
-- 
1.7.4.1

