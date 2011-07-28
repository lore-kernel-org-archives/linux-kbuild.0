Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:64589 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755737Ab1G1Pye (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:54:34 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 29/40] UAPI: Fix linux/ncp.h [ver #3]
Date: Thu, 28 Jul 2011 16:53:55 +0100
Message-ID: <20110728155355.16618.61095.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix linux/coda.h to retain the #ifdef __KERNEL__ in struct nw_info_struct in
the userspace struct rather than splitting that member out into a separate
header.

This is done by placing a marker to manually control the splitter script.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/ncp.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/ncp.h b/include/linux/ncp.h
index 99f0ade..4717262 100644
--- a/include/linux/ncp.h
+++ b/include/linux/ncp.h
@@ -155,7 +155,7 @@ struct nw_info_struct {
 	__u8 nameLen;
 	__u8 entryName[256];
 	/* libncp may depend on there being nothing after entryName */
-#ifdef __KERNEL__
+#ifdef __KERNEL__ // DISINTEGRATE: RETAIN
 	struct nw_nfs_info nfs;
 #endif
 } __attribute__((packed));

