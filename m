Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:46361 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753183Ab1LFW0u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Dec 2011 17:26:50 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] unifdef: drop unused errno.h include
Date: Tue,  6 Dec 2011 17:26:50 -0500
Message-Id: <1323210410-27111-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org

This is the only header on my system that ends up requiring kernel
headers, so if the kernel headers aren't available, we end up being
unable to install kernel headers :).

Since this file doesn't actually use anything from errno.h, drop
the include so it at least makes us a bit more robust on glibc.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/unifdef.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/scripts/unifdef.c b/scripts/unifdef.c
index 7493c0e..c5dfae5 100644
--- a/scripts/unifdef.c
+++ b/scripts/unifdef.c
@@ -48,7 +48,6 @@
 
 #include <ctype.h>
 #include <err.h>
-#include <errno.h>
 #include <stdarg.h>
 #include <stdbool.h>
 #include <stdio.h>
-- 
1.7.6.1

