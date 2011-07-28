Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49699 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755811Ab1G1Pz5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:55:57 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 38/40] UAPI: Fix the page-types query program in the docs [ver
 #3]
Date: Thu, 28 Jul 2011 16:55:23 +0100
Message-ID: <20110728155523.16618.65767.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Fix the page-types query program in Documentation/vm/ as that refers to the
magic numbers header file directly, but the magic numbers are now in the UAPI
headers.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/vm/page-types.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/vm/page-types.c b/Documentation/vm/page-types.c
index 7445caa..8d6a54f 100644
--- a/Documentation/vm/page-types.c
+++ b/Documentation/vm/page-types.c
@@ -34,7 +34,7 @@
 #include <sys/fcntl.h>
 #include <sys/mount.h>
 #include <sys/statfs.h>
-#include "../../include/linux/magic.h"
+#include "../../include/uapi/linux/magic.h"
 
 
 #ifndef MAX_PATH

