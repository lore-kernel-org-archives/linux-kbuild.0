Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:53966 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934142AbeEIJuw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 May 2018 05:50:52 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] modpost: remove redundant is_vmlinux() test
Date: Wed,  9 May 2018 18:50:39 +0900
Message-Id: <1525859440-29583-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1525859440-29583-1-git-send-email-yamada.masahiro@socionext.com>
References: <1525859440-29583-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The second test of is_vmlinux() is redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 8606b6c..9e70a6a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1971,8 +1971,7 @@ static void read_symbols(char *modname)
 		handle_modversions(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
-	if (!is_vmlinux(modname) ||
-	     (is_vmlinux(modname) && vmlinux_section_warnings))
+	if (!is_vmlinux(modname) || vmlinux_section_warnings)
 		check_sec_ref(mod, modname, &info);
 
 	version = get_modinfo(&info, "version");
-- 
2.7.4

