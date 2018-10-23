Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41941 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJbt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:31:49 -0400
Date: Mon, 22 Oct 2018 22:10:42 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v2 3/5] Creates macro to avoid variable shadowing
Message-ID: <20181023011042.GA6582@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Creates DEF_FIELD_ADDR_VAR as a more generic version of the DEF_FIELD_ADD
macro, allowing usage of a variable name other than the struct element name.
Also, sets DEF_FIELD_ADDR as a specific usage of DEF_FILD_ADDR_VAR in which
the var name is the same as the struct element name.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 scripts/mod/file2alias.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 7be43697ff84..3015c0bdecb2 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -95,12 +95,20 @@ extern struct devtable *__start___devtable[], *__stop___devtable[];
  */
 #define DEF_FIELD(m, devid, f) \
 	typeof(((struct devid *)0)->f) f = TO_NATIVE(*(typeof(f) *)((m) + OFF_##devid##_##f))
+
+/* Define a variable v that holds the address of field f of struct devid
+ * based at address m.  Due to the way typeof works, for a field of type
+ * T[N] the variable has type T(*)[N], _not_ T*.
+ */
+#define DEF_FIELD_ADDR_VAR(m, devid, f, v) \
+	typeof(((struct devid *)0)->f) *v = ((m) + OFF_##devid##_##f)
+
 /* Define a variable f that holds the address of field f of struct devid
  * based at address m.  Due to the way typeof works, for a field of type
  * T[N] the variable has type T(*)[N], _not_ T*.
  */
 #define DEF_FIELD_ADDR(m, devid, f) \
-	typeof(((struct devid *)0)->f) *f = ((m) + OFF_##devid##_##f)
+	DEF_FIELD_ADDR_VAR(m, devid, f, f)
 
 /* Add a table entry.  We test function type matches while we're here. */
 #define ADD_TO_DEVTABLE(device_id, type, function) \
@@ -641,25 +649,27 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 	unsigned int i;
 
 	device_id_check(mod->name, "pnp", size, id_size, symval);
+	DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
+	typeof(devs) devs_last;
 
 	for (i = 0; i < count; i++) {
 		unsigned int j;
-		DEF_FIELD_ADDR(symval + i*id_size, pnp_card_device_id, devs);
+		devs_last = devs + i * id_size;
 
 		for (j = 0; j < PNP_MAX_DEVICES; j++) {
-			const char *id = (char *)(*devs)[j].id;
-			int i2, j2;
+			const char *id = (char *)(*devs_last)[j].id;
+			int j2;
 			int dup = 0;
 
 			if (!id[0])
 				break;
 
 			/* find duplicate, already added value */
-			for (i2 = 0; i2 < i && !dup; i2++) {
-				DEF_FIELD_ADDR(symval + i2*id_size, pnp_card_device_id, devs);
+			while ((devs_last -= id_size) >= devs && !dup) {
 
 				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
-					const char *id2 = (char *)(*devs)[j2].id;
+					const char *id2 =
+						(char *)(*devs_last)[j2].id;
 
 					if (!id2[0])
 						break;
-- 
2.19.1
