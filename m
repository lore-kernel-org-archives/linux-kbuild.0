Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21377 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755872Ab1G1Pxf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:53:35 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 23/40] UAPI: sound/sound_core.c should include linux/fs.h [ver
 #3]
Date: Thu, 28 Jul 2011 16:53:02 +0100
Message-ID: <20110728155302.16618.93625.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

sound/sound_core.c should include linux/fs.h to get the definition of struct
file_operations.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 sound/sound_core.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 6ce2778..b6bc127 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/kdev_t.h>
 #include <linux/major.h>
+#include <linux/fs.h>
 #include <sound/core.h>
 
 #ifdef CONFIG_SOUND_OSS_CORE

