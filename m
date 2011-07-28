Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56257 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755215Ab1G1PvD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:51:03 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 10/40] UAPI: Don't have a #elif clause in a __KERNEL__ guard
 in linux/soundcard.h [ver #3]
Date: Thu, 28 Jul 2011 16:50:58 +0100
Message-ID: <20110728155058.16618.32513.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Don't have a #elif clause in a __KERNEL__ guard in linux/soundcard.h to make
parsing easier.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/soundcard.h |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/include/linux/soundcard.h b/include/linux/soundcard.h
index fe204fe..dfcf86f 100644
--- a/include/linux/soundcard.h
+++ b/include/linux/soundcard.h
@@ -198,7 +198,8 @@ typedef struct seq_event_rec {
 #  else
 #    error "could not determine byte order"
 #  endif
-#elif defined(__BYTE_ORDER)
+#else
+# if defined(__BYTE_ORDER)
 #  if __BYTE_ORDER == __BIG_ENDIAN
 #    define AFMT_S16_NE AFMT_S16_BE
 #  elif __BYTE_ORDER == __LITTLE_ENDIAN
@@ -206,6 +207,7 @@ typedef struct seq_event_rec {
 #  else
 #    error "could not determine byte order"
 #  endif
+# endif
 #endif
 
 /*

