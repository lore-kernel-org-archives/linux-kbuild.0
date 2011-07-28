Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54336 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755248Ab1G1Pwm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:52:42 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 17/40] UAPI: Fix E820_X_MAX ordering problem [ver #3]
Date: Thu, 28 Jul 2011 16:52:07 +0100
Message-ID: <20110728155206.16618.8462.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

There's an ordering problem around the definition of E820_X_MAX: the definition
in the kernel-specific header is referred to in the user-specific header data
structures, at least for x86.  When compiling userspace, the user-specific
header provides an alternate version of E820_X_MAX.

To get around this problem, place a marker specifically to indicate the point
at which the UAPI header should be included in the kernel-specific file.  The
marker will be deleted later.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/x86/include/asm/e820.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/e820.h b/arch/x86/include/asm/e820.h
index 908b969..e02512f 100644
--- a/arch/x86/include/asm/e820.h
+++ b/arch/x86/include/asm/e820.h
@@ -45,6 +45,8 @@
 #define E820_NVS	4
 #define E820_UNUSABLE	5
 
+// DISINTEGRATE: INCLUDE UAPI HERE
+
 /*
  * reserved RAM used by kernel itself
  * if CONFIG_INTEL_TXT is enabled, memory of this type will be

