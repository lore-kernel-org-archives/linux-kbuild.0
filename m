Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:41816 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfE0OiN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:38:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] kconfig: add static qualifier to expand_string()
Date: Mon, 27 May 2019 23:37:23 +0900
Message-Id: <20190527143725.12542-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now expand_string() is only used in preprocess.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/lkc_proto.h  | 1 -
 scripts/kconfig/preprocess.c | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 86c267540ccc..38a32b1c1a28 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -58,7 +58,6 @@ void env_write_dep(FILE *f, const char *auto_conf_name);
 void variable_add(const char *name, const char *value,
 		  enum variable_flavor flavor);
 void variable_all_del(void);
-char *expand_string(const char *in);
 char *expand_dollar(const char **str);
 char *expand_one_token(const char **str);
 
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 592dfbfa9fb3..0243086fb168 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -15,6 +15,7 @@
 #define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
 
 static char *expand_string_with_args(const char *in, int argc, char *argv[]);
+static char *expand_string(const char *in);
 
 static void __attribute__((noreturn)) pperror(const char *format, ...)
 {
@@ -550,7 +551,7 @@ static char *expand_string_with_args(const char *in, int argc, char *argv[])
 	return __expand_string(&in, is_end_of_str, argc, argv);
 }
 
-char *expand_string(const char *in)
+static char *expand_string(const char *in)
 {
 	return expand_string_with_args(in, 0, NULL);
 }
-- 
2.17.1
