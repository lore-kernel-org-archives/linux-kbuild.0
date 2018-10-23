Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43926 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJlj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:41:39 -0400
Date: Mon, 22 Oct 2018 22:20:31 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH 1/1] Changes style to look more like list iteration.
Message-ID: <20181023012031.GA6920@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Changes the code in order to make it looks more like its a list iteration.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---

It's a remainer from a patch from the -Wshadow patchset.
Since it doesn't really belongs to that patchset anymore, 
I decided to release it just as a code refactor for
file2alias.c

I fixed it after Koike's suggestion (&&!dup added)

IMHO it reads better this way, and no drastic change has been made.

Thanks.

---
 scripts/mod/file2alias.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 3015c0bdecb2..b957279c4117 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -650,26 +650,26 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 
 	device_id_check(mod->name, "pnp", size, id_size, symval);
 	DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
-	typeof(devs) devs_last;
+	DEF_FIELD_ADDR_VAR(symval, pnp_card_device_id, devs, devs_aux);
 
 	for (i = 0; i < count; i++) {
 		unsigned int j;
-		devs_last = devs + i * id_size;
+		devs_aux = devs + i * id_size;
 
 		for (j = 0; j < PNP_MAX_DEVICES; j++) {
-			const char *id = (char *)(*devs_last)[j].id;
+			const char *id = (char *)(*devs_aux)[j].id;
 			int j2;
 			int dup = 0;
 
 			if (!id[0])
 				break;
 
-			/* find duplicate, already added value */
-			while ((devs_last -= id_size) >= devs && !dup) {
+			/* find duplicate on previous devs*/
+			while ((devs_aux -= id_size) >= devs && !dup) {
 
 				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
 					const char *id2 =
-						(char *)(*devs_last)[j2].id;
+						(char *)(*devs_aux)[j2].id;
 
 					if (!id2[0])
 						break;
-- 
2.19.1
