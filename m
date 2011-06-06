Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34179 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757457Ab1FFS6s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jun 2011 14:58:48 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 5/9] kconfig: add missing <stdlib.h> inclusion
Date: Mon,  6 Jun 2011 14:58:27 -0400
Message-Id: <1307386711-8866-6-git-send-email-lacombar@gmail.com>
In-Reply-To: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This header is needed when using {m,re}alloc(3) and free(3) function family.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/util.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index e07d557..d0b8b23 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -6,6 +6,7 @@
  */
 
 #include <stdarg.h>
+#include <stdlib.h>
 #include <string.h>
 #include "lkc.h"
 
-- 
1.7.3.4.574.g608b.dirty

