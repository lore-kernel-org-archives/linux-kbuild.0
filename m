Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from proxy04.fsdata.se ([89.221.252.227]:50327 "EHLO
        mail-gw01.fsdata.se" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727125AbfBGMqK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 07:46:10 -0500
From: Mattias Jacobsson <2pi@mok.nu>
Subject: [PATCH] modpost: file2alias: define size of alias
Date: Thu, 7 Feb 2019 13:30:22 +0100
Message-ID: <20190207123022.7961-1-2pi@mok.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: 2pi@mok.nu, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The size of the variable alias provided to do_entry functions are
currently not readily available. Thus hindering do_entry functions to
perform bounds checking.

Define the macro ALIAS_SIZE containing the size of the variable alias.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---

Related discussion: [1] and [2] (around the first answer line)

[1]: https://lore.kernel.org/lkml/20190128150909.4r3tje5l34u5t2xs@mok.nu/
[2]: https://lore.kernel.org/lkml/CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com/

---

 scripts/mod/file2alias.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index a37af7d71973..afe22af20d7d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -50,6 +50,9 @@ struct devtable {
 	int (*do_entry)(const char *filename, void *symval, char *alias);
 };
 
+/* Size of alias provided to do_entry functions */
+#define ALIAS_SIZE 500
+
 /* Define a variable f that holds the value of field f of struct devid
  * based at address m.
  */
@@ -1303,7 +1306,7 @@ static void do_table(void *symval, unsigned long size,
 		     struct module *mod)
 {
 	unsigned int i;
-	char alias[500];
+	char alias[ALIAS_SIZE];
 
 	device_id_check(mod->name, device_id, size, id_size, symval);
 	/* Leave last one: it's the terminator. */
-- 
2.20.1
