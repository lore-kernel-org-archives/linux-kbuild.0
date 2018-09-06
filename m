Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49930 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728110AbeIFNxb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 09:53:31 -0400
Subject: [PATCH 05/11] UAPI: coda: Move kernel internals out of public view
 [ver #2]
From: David Howells <dhowells@redhat.com>
Date: Thu, 06 Sep 2018 10:18:57 +0100
Message-ID: <153622553762.14298.10096062467394188420.stgit@warthog.procyon.org.uk>
In-Reply-To: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
References: <153622549721.14298.8116794954073122489.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Yann Droneaud <ydroneaud@opteya.com>Yann Droneaud <ydroneaud@opteya.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The upc_req struct and the CODA_REQ_* constants are kernel internals and
shouldn't have been exposed to userspace.  Indeed, the upc_req struct
contains other kernel internal structs.

Move them to include/linux/coda_psdev.h.

Suggested-by: Yann Droneaud <ydroneaud@opteya.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Yann Droneaud <ydroneaud@opteya.com>
cc: Jan Harkes <jaharkes@cs.cmu.edu>
cc: coda@cs.cmu.edu
cc: codalist@coda.cs.cmu.edu
cc: linux-fsdevel@vger.kernel.org
---

 include/linux/coda_psdev.h      |   18 +++++++++++++++++-
 include/uapi/linux/coda_psdev.h |   18 ------------------
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/include/linux/coda_psdev.h b/include/linux/coda_psdev.h
index 15170954aa2b..c61e70b97319 100644
--- a/include/linux/coda_psdev.h
+++ b/include/linux/coda_psdev.h
@@ -8,6 +8,23 @@
 
 struct kstatfs;
 
+/* messages between coda filesystem in kernel and Venus */
+struct upc_req {
+	struct list_head    uc_chain;
+	caddr_t	            uc_data;
+	u_short	            uc_flags;
+	u_short             uc_inSize;  /* Size is at most 5000 bytes */
+	u_short	            uc_outSize;
+	u_short	            uc_opcode;  /* copied from data to save lookup */
+	int		    uc_unique;
+	wait_queue_head_t   uc_sleep;   /* process' wait queue */
+};
+
+#define CODA_REQ_ASYNC  0x1
+#define CODA_REQ_READ   0x2
+#define CODA_REQ_WRITE  0x4
+#define CODA_REQ_ABORT  0x8
+
 /* communication pending/processing queues */
 struct venus_comm {
 	u_long		    vc_seq;
@@ -19,7 +36,6 @@ struct venus_comm {
 	struct mutex	    vc_mutex;
 };
 
-
 static inline struct venus_comm *coda_vcp(struct super_block *sb)
 {
 	return (struct venus_comm *)((sb)->s_fs_info);
diff --git a/include/uapi/linux/coda_psdev.h b/include/uapi/linux/coda_psdev.h
index aa6623efd2dd..3dacb7fad66a 100644
--- a/include/uapi/linux/coda_psdev.h
+++ b/include/uapi/linux/coda_psdev.h
@@ -7,22 +7,4 @@
 #define CODA_PSDEV_MAJOR 67
 #define MAX_CODADEVS  5	   /* how many do we allow */
 
-
-/* messages between coda filesystem in kernel and Venus */
-struct upc_req {
-	struct list_head    uc_chain;
-	caddr_t	            uc_data;
-	u_short	            uc_flags;
-	u_short             uc_inSize;  /* Size is at most 5000 bytes */
-	u_short	            uc_outSize;
-	u_short	            uc_opcode;  /* copied from data to save lookup */
-	int		    uc_unique;
-	wait_queue_head_t   uc_sleep;   /* process' wait queue */
-};
-
-#define CODA_REQ_ASYNC  0x1
-#define CODA_REQ_READ   0x2
-#define CODA_REQ_WRITE  0x4
-#define CODA_REQ_ABORT  0x8
-
 #endif /* _UAPI__CODA_PSDEV_H */
