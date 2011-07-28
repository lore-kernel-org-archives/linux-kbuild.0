Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59714 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755872Ab1G1Pxq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:53:46 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 24/40] UAPI: Fix SNDRV_*_ENDIAN ordering problem [ver #3]
Date: Thu, 28 Jul 2011 16:53:10 +0100
Message-ID: <20110728155310.16618.62631.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

There's an ordering problem around the definition of SNDRV_*_ENDIAN: the
definition in the kernel-specific header is referred to in the user-specific
header data structures.

To get around this problem, place a marker specifically to indicate the point
at which the UAPI header should be included in the kernel-specific file.  The
marker will be deleted later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/sound/asound.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/sound/asound.h b/include/sound/asound.h
index 5d6074f..e4918f6 100644
--- a/include/sound/asound.h
+++ b/include/sound/asound.h
@@ -40,6 +40,7 @@
 #endif
 #endif
 
+// DISINTEGRATE: INCLUDE UAPI HERE
 #endif /* __KERNEL__ **/
 
 /*

