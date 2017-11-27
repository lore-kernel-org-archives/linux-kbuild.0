Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:14694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751921AbdK0Vea (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:30 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 02/21] afs: Fix const confusion in AFS
Date: Mon, 27 Nov 2017 13:34:04 -0800
Message-Id: <20171127213423.27218-3-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, dhowells@redhat.com

From: Andi Kleen <ak@linux.intel.com>

A trace point string cannot be const because the underlying special
section is not marked const. An LTO build complains about the
section attribute mismatch. Fix it by not marking the trace point
string in afs const.

Cc: dhowells@redhat.com
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 fs/afs/cmservice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index 41e277f57b20..0e9ea0f8d620 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -31,7 +31,7 @@ static void SRXAFSCB_ProbeUuid(struct work_struct *);
 static void SRXAFSCB_TellMeAboutYourself(struct work_struct *);
 
 #define CM_NAME(name) \
-	const char afs_SRXCB##name##_name[] __tracepoint_string =	\
+	char afs_SRXCB##name##_name[] __tracepoint_string =	\
 		"CB." #name
 
 /*
-- 
2.13.6

