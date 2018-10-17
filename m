Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43659 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeJQICn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 04:02:43 -0400
Date: Tue, 16 Oct 2018 21:09:43 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH 4/4] Changes macro usage to avoid shadowing a variable.
Message-ID: <20181017000943.GA21382@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Changes the usage of DEF_FIELD_ADDR in this function to create a
reference and operate over it using an aux variable.
It also changes the loop logic used to find duplicates, to avoid
creating another variable.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 scripts/mod/file2alias.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 7be43697ff84..9ea1db2aefdb 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -641,25 +641,27 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
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
+			while ((devs_last -= id_size) >= devs) {
 
 				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
-					const char *id2 = (char *)(*devs)[j2].id;
+					const char *id2 =
+						(char *)(*devs_last)[j2].id;
 
 					if (!id2[0])
 						break;
-- 
2.19.1
