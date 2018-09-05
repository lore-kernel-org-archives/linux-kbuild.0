Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45326 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726189AbeIEUZ7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 16:25:59 -0400
Subject: [PATCH 05/11] UAPI: coda: Don't use internal kernel structs in UAPI
From: David Howells <dhowells@redhat.com>
Date: Wed, 05 Sep 2018 16:55:10 +0100
Message-ID: <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk>
In-Reply-To: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

The size and layout of internal kernel structures may not be relied upon
outside of the kernel and may even change in a containerised environment if
a container image is frozen and shifted to another machine.

Excise these from Coda's upc_req struct.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jan Harkes <jaharkes@cs.cmu.edu>
cc: coda@cs.cmu.edu
cc: codalist@coda.cs.cmu.edu
cc: linux-fsdevel@vger.kernel.org
---

 include/uapi/linux/coda_psdev.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/coda_psdev.h b/include/uapi/linux/coda_psdev.h
index aa6623efd2dd..9c3acde393cd 100644
--- a/include/uapi/linux/coda_psdev.h
+++ b/include/uapi/linux/coda_psdev.h
@@ -10,14 +10,18 @@
 
 /* messages between coda filesystem in kernel and Venus */
 struct upc_req {
+#ifdef __KERNEL__
 	struct list_head    uc_chain;
+#endif
 	caddr_t	            uc_data;
 	u_short	            uc_flags;
 	u_short             uc_inSize;  /* Size is at most 5000 bytes */
 	u_short	            uc_outSize;
 	u_short	            uc_opcode;  /* copied from data to save lookup */
 	int		    uc_unique;
+#ifdef __KERNEL__
 	wait_queue_head_t   uc_sleep;   /* process' wait queue */
+#endif
 };
 
 #define CODA_REQ_ASYNC  0x1
