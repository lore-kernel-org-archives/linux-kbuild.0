Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36970 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726189AbeIEUZi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 16:25:38 -0400
Subject: [PATCH 02/11] UAPI: keys: Fix use of C++ keywords as structural
 members
From: David Howells <dhowells@redhat.com>
Date: Wed, 05 Sep 2018 16:54:47 +0100
Message-ID: <153616288762.23468.17409226604948361939.stgit@warthog.procyon.org.uk>
In-Reply-To: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Mat Martineau <mathew.j.martineau@linux.intel.com>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The keyctl_dh_params struct uses a C++ keyword as structural members.  Fix
this by inserting an anonymous union that provides an alternative name and
then hide the reserved name in C++.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Mat Martineau <mathew.j.martineau@linux.intel.com>
cc: keyrings@vger.kernel.org
---

 include/uapi/linux/keyctl.h |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index 7b8c9e19bad1..170f015d1f25 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -65,7 +65,12 @@
 
 /* keyctl structures */
 struct keyctl_dh_params {
-	__s32 private;
+	union {
+#ifndef __cplusplus
+		__s32 private;
+#endif
+		__s32 dh_private;
+	};
 	__s32 prime;
 	__s32 base;
 };
