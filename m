Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21408 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753537Ab1G1Pui (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:50:38 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 07/40] UAPI: Fix AHZ multiple inclusion when __KERNEL__ is
 removed [ver #3]
Date: Thu, 28 Jul 2011 16:50:31 +0100
Message-ID: <20110728155031.16618.33620.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/acct.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/linux/acct.h b/include/linux/acct.h
index 3e4737f..d537aa0 100644
--- a/include/linux/acct.h
+++ b/include/linux/acct.h
@@ -146,6 +146,9 @@ extern void acct_exit_ns(struct pid_namespace *);
  *
  */
 
+#undef ACCT_VERSION
+#undef AHZ
+
 #ifdef CONFIG_BSD_PROCESS_ACCT_V3
 #define ACCT_VERSION	3
 #define AHZ		100

