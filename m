Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:32425 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755638Ab2JIWqj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Oct 2012 18:46:39 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 3/3] kconfig: get CONFIG_ prefix from the environment
Date: Wed, 10 Oct 2012 00:46:33 +0200
Message-Id: <1349822793-1227-4-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
References: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, the CONFIG_ prefix is hard-coded in the kconfig frontends
executables. This means that two projects that use kconfig with
different prefixes can not share the same kconfig frontends.

Instead of hard-coding the prefix in the frontends, get it from the
environment, and revert back to hard-coded value if not found.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/gconf.c |    2 +-
 scripts/kconfig/lkc.h   |    2 ++
 scripts/kconfig/nconf.c |    1 +
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index adc2306..f2bee70 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -10,6 +10,7 @@
 #  include <config.h>
 #endif
 
+#include <stdlib.h>
 #include "lkc.h"
 #include "images.c"
 
@@ -22,7 +23,6 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
-#include <stdlib.h>
 
 //#define DEBUG
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 25862fd..afa592a 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -41,6 +41,8 @@ extern "C" {
 #define __stringify(x...)	__stringify_1(x)
 static inline const char *CONFIG_prefix(void)
 {
+	if( getenv( "CONFIG_" ) )
+		return getenv( "CONFIG_" );
 	return __stringify(CONFIG_);
 }
 #ifdef CONFIG_
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 8854fd1..1bb76f4 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -7,6 +7,7 @@
  */
 #define _GNU_SOURCE
 #include <string.h>
+#include <stdlib.h>
 
 #include "lkc.h"
 #include "nconf.h"
-- 
1.7.2.5

