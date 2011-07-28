Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:17394 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753537Ab1G1Puq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:50:46 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 08/40] UAPI: ac_etime in linux/acct.h must keep its __KERNEL__
 guards [ver #3]
Date: Thu, 28 Jul 2011 16:50:41 +0100
Message-ID: <20110728155041.16618.70965.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

ac_etime in linux/acct.h must keep its __KERNEL__ guards.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/acct.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/acct.h b/include/linux/acct.h
index d537aa0..55e88b5 100644
--- a/include/linux/acct.h
+++ b/include/linux/acct.h
@@ -81,7 +81,7 @@ struct acct_v3
 	__u32		ac_pid;			/* Process ID */
 	__u32		ac_ppid;		/* Parent Process ID */
 	__u32		ac_btime;		/* Process Creation Time */
-#ifdef __KERNEL__
+#ifdef __KERNEL__ // DISINTEGRATE: RETAIN
 	__u32		ac_etime;		/* Elapsed Time */
 #else
 	float		ac_etime;		/* Elapsed Time */

