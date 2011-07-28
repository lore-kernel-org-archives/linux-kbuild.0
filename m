Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54508 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755248Ab1G1Pwc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:52:32 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 16/40] UAPI: Fix sigset_t ordering problem [ver #3]
Date: Thu, 28 Jul 2011 16:51:56 +0100
Message-ID: <20110728155156.16618.34530.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

There's an ordering problem around the definition of sigset_t: the definition
in the kernel-specific header is referred to in the user-specific header data
structures, at least for x86.  When compiling userspace, the user-specific
header provides an alternate version of sigset_t.

To get around this problem, place a marker specifically to indicate the point
at which the UAPI header should be included in the kernel-specific file.  The
marker will be deleted later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/x86/include/asm/signal.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/signal.h b/arch/x86/include/asm/signal.h
index 598457c..40ef827 100644
--- a/arch/x86/include/asm/signal.h
+++ b/arch/x86/include/asm/signal.h
@@ -40,6 +40,8 @@ typedef unsigned long sigset_t;
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 
+// DISINTEGRATE: INCLUDE UAPI HERE
+
 #define SIGHUP		 1
 #define SIGINT		 2
 #define SIGQUIT		 3

