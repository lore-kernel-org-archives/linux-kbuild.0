Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40427 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387562AbgAIQQm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:16:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so8001121wrn.7
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:16:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2] kconfig: fix an "implicit declaration of function" warning
Date: Thu,  9 Jan 2020 17:16:36 +0100
Message-Id: <20200109161636.9362-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

strncasecmp() & strcasecmp() functions are declared in strings.h, not
string.h. On most environments the former is implicitly included by
the latter but on some setups, building menuconfig results in the
following warning:

  HOSTCC  scripts/kconfig/mconf.o
scripts/kconfig/mconf.c: In function ‘search_conf’:
scripts/kconfig/mconf.c:423:6: warning: implicit declaration of function ‘strncasecmp’ [-Wimplicit-function-declaration]
  if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
      ^~~~~~~~~~~
scripts/kconfig/mconf.c: In function ‘main’:
scripts/kconfig/mconf.c:1021:8: warning: implicit declaration of function ‘strcasecmp’ [-Wimplicit-function-declaration]
   if (!strcasecmp(mode, "single_menu"))
        ^~~~~~~~~~

Fix it by explicitly including strings.h.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 scripts/kconfig/gconf.c | 1 +
 scripts/kconfig/mconf.c | 1 +
 scripts/kconfig/nconf.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e36b342f1065..5527482c3077 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -18,6 +18,7 @@
 
 #include <stdio.h>
 #include <string.h>
+#include <strings.h>
 #include <unistd.h>
 #include <time.h>
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 49c26ea9dd98..4063dbc1b927 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -15,6 +15,7 @@
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
+#include <strings.h>
 #include <signal.h>
 #include <unistd.h>
 
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b7c1ef757178..daf1c1506ec4 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -8,6 +8,7 @@
 #define _GNU_SOURCE
 #endif
 #include <string.h>
+#include <strings.h>
 #include <stdlib.h>
 
 #include "lkc.h"
-- 
2.23.0
