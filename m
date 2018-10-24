Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41772 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbeJXMaf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 08:30:35 -0400
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v3 3/5] Creates macro to avoid variable shadowing
Date: Wed, 24 Oct 2018 01:03:52 -0300
Message-Id: <20181024040354.24879-4-leobras.c@gmail.com>
In-Reply-To: <20181024040354.24879-1-leobras.c@gmail.com>
References: <20181024040354.24879-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Creates DEF_FIELD_ADDR_VAR as a more generic version of the DEF_FIELD_ADD
macro, allowing usage of a variable name other than the struct element name.
Also, sets DEF_FIELD_ADDR as a specific usage of DEF_FILD_ADDR_VAR in which
the var name is the same as the struct element name.
Then, makes use of DEF_FIELD_ADDR_VAR to create a variable of another name,
in order to avoid variable shadowing.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 scripts/mod/file2alias.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 7be43697ff84..ed468313ddeb 100644
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
@@ -644,7 +652,7 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 
 	for (i = 0; i < count; i++) {
 		unsigned int j;
-		DEF_FIELD_ADDR(symval + i*id_size, pnp_card_device_id, devs);
+		DEF_FIELD_ADDR(symval + i * id_size, pnp_card_device_id, devs);
 
 		for (j = 0; j < PNP_MAX_DEVICES; j++) {
 			const char *id = (char *)(*devs)[j].id;
@@ -656,10 +664,13 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 
 			/* find duplicate, already added value */
 			for (i2 = 0; i2 < i && !dup; i2++) {
-				DEF_FIELD_ADDR(symval + i2*id_size, pnp_card_device_id, devs);
+				DEF_FIELD_ADDR_VAR(symval + i2 * id_size,
+						   pnp_card_device_id,
+						   devs, devs_dup);
 
 				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
-					const char *id2 = (char *)(*devs)[j2].id;
+					const char *id2 =
+						(char *)(*devs_dup)[j2].id;
 
 					if (!id2[0])
 						break;
-- 
2.19.1
