Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:65114 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751693AbcLHLzO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 06:55:14 -0500
From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Subject: [PATCH 2/2] recordmcount: fix mcount recording with -ffunction-sections
Date: Thu, 8 Dec 2016 12:55:07 +0100
Message-ID: <1481198107-17019-3-git-send-email-marcin.nowakowski@imgtec.com>
In-Reply-To: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1481198107-17019-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: Paul Burton <paul.burton@imgtec.com>, linux-kbuild@vger.kernel.org

When CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled, each function is
added to its own new section called .text.functionname.
As described in vmlinux.lds.h, "those enabling
LD_DEAD_CODE_DATA_ELIMINATION must ensure they don't have conflicting
section names, and must pull in .text.[0-9a-zA-Z_]*", add a similar
pattern matching to recordmcount script for section detection.

To simplify the basic C implementation, replace the regex with a string
match on the prefix and a single character match following the '.text.'
prefix.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 scripts/Makefile       |  5 +++++
 scripts/recordmcount.c | 26 +++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 1d80897..9b88250 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -23,6 +23,11 @@ hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
 
 HOSTCFLAGS_sortextable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
+
+ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+HOSTCFLAGS_recordmcount.o = -DMCOUNT_INCLUDE_FUNCTION_SECTIONS
+endif
+
 HOSTLOADLIBES_sign-file = -lcrypto
 HOSTLOADLIBES_extract-cert = -lcrypto
 
diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
index aeb3422..bb517ef 100644
--- a/scripts/recordmcount.c
+++ b/scripts/recordmcount.c
@@ -32,6 +32,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <ctype.h>
 
 /*
  * glibc synced up and added the metag number but didn't add the relocations.
@@ -408,9 +409,31 @@ static uint32_t (*w)(uint32_t);
 static uint32_t (*w2)(uint16_t);
 
 /* Names of the sections that could contain calls to mcount. */
+#ifdef MCOUNT_INCLUDE_FUNCTION_SECTIONS
+static int
+is_mcounted_function_section_name(char const *const txtname)
+{
+	const size_t len = strlen(".text.");
+
+	return	strncmp(".text.", txtname, len) == 0 &&
+		strlen(txtname) > len &&
+		(isalnum(txtname[len]) || txtname[len] == '_');
+}
+#else
+static int
+is_mcounted_function_section_name(char const *const txtname)
+{
+	return 0;
+}
+#endif
+
+
 static int
 is_mcounted_section_name(char const *const txtname)
 {
+	int ffunc_section =
+		is_mcounted_function_section_name(txtname);
+
 	return strcmp(".text",           txtname) == 0 ||
 		strcmp(".ref.text",      txtname) == 0 ||
 		strcmp(".sched.text",    txtname) == 0 ||
@@ -419,7 +442,8 @@ is_mcounted_section_name(char const *const txtname)
 		strcmp(".softirqentry.text", txtname) == 0 ||
 		strcmp(".kprobes.text", txtname) == 0 ||
 		strcmp(".cpuidle.text", txtname) == 0 ||
-		strcmp(".text.unlikely", txtname) == 0;
+		strcmp(".text.unlikely", txtname) == 0 ||
+		ffunc_section;
 }
 
 /* 32 bit and 64 bit are very similar */
-- 
2.7.4

