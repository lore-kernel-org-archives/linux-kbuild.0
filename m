Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:39897 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754625Ab0KHXcH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Nov 2010 18:32:07 -0500
Received: by eye27 with SMTP id 27so3237671eye.19
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Nov 2010 15:32:05 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] scripts/genksyms: fix header usage
Date: Mon,  8 Nov 2010 18:31:53 -0500
Message-Id: <1289259113-16758-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

FreeBSD does not like <malloc.h> when __STDC__ is defined, use the standard
<stdlib.h> instead.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/genksyms/parse.c_shipped |    2 +-
 scripts/genksyms/parse.y         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/parse.c_shipped b/scripts/genksyms/parse.c_shipped
index eaee44e..809b949 100644
--- a/scripts/genksyms/parse.c_shipped
+++ b/scripts/genksyms/parse.c_shipped
@@ -160,7 +160,7 @@
 
 
 #include <assert.h>
-#include <malloc.h>
+#include <stdlib.h>
 #include "genksyms.h"
 
 static int is_typedef;
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 10d7dc7..09a265c 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -24,7 +24,7 @@
 %{
 
 #include <assert.h>
-#include <malloc.h>
+#include <stdlib.h>
 #include "genksyms.h"
 
 static int is_typedef;
-- 
1.7.2.30.gc37d7.dirty

