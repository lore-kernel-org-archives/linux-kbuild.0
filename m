Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53242 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755525Ab1G1Pxx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:53:53 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 25/40] UAPI: Fix u_quad_t ordering problem in linux/coda.h
 [ver #3]
Date: Thu, 28 Jul 2011 16:53:19 +0100
Message-ID: <20110728155318.16618.81445.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

There's an ordering problem around the definition of u_quad_t in linux/coda.h:
the definition in the kernel-specific header is referred to in the
user-specific header data structures.  When compiling userspace, the
user-specific header provides an alternate version of u_quad_t.

To get around this problem, place a marker specifically to indicate the point
at which the UAPI header should be included in the kernel-specific file.  The
marker will be deleted later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/coda.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/coda.h b/include/linux/coda.h
index 96c8769..5a2c1a0 100644
--- a/include/linux/coda.h
+++ b/include/linux/coda.h
@@ -111,6 +111,7 @@ typedef unsigned long long u_quad_t;
 #else
 #define cdev_t dev_t
 #endif
+// DISINTEGRATE: INCLUDE UAPI HERE
 
 #ifdef __CYGWIN32__
 struct timespec {

