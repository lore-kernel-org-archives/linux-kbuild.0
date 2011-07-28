Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:28057 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755736Ab1G1PxA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:53:00 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 19/40] UAPI: Fix linux/input.h inclusion order [ver #3]
Date: Thu, 28 Jul 2011 16:52:23 +0100
Message-ID: <20110728155223.16618.82167.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix linux/input.h inclusion order to make sure that the inclusion of the
user-specific file happens after the inclusion of the header file that
provides struct timeval.

To get around this problem, place a marker specifically to indicate the point
at which the UAPI header should be included in the kernel-specific file.  The
marker will be deleted later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/input.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/input.h b/include/linux/input.h
index 068784e..b785703 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -19,6 +19,8 @@
 #include <linux/types.h>
 #endif
 
+// DISINTEGRATE: INCLUDE UAPI HERE
+
 /*
  * The event structure itself
  */

