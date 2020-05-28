Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405041AbgE1Rei (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 May 2020 13:34:38 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] kbuild: modpost: fix a message typo
Message-ID: <085ad1e6-f9a1-06ee-c8f1-7ac6b6ae8552@infradead.org>
Date: Thu, 28 May 2020 10:34:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

From: Randy Dunlap <rdunlap@infradead.org>

Fix typo/spello:

WARNING: modpost: Symbol dump file is missing. Modules may not have dependencies or movversions.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/mod/modpost.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200528.orig/scripts/mod/modpost.c
+++ linux-next-20200528/scripts/mod/modpost.c
@@ -2600,7 +2600,7 @@ int main(int argc, char **argv)
 		read_symbols_from_files(files_source);
 
 	if (missing_dump_file)
-		warn("Symbol dump file is missing. Modules may not have dependencies or movversions.\n");
+		warn("Symbol dump file is missing. Modules may not have dependencies or modversions.\n");
 
 	/*
 	 * When there's no vmlinux, don't print warnings about
