Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37450 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758082AbYAXWEO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:14 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id 92B9E801E21
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:51 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 59/77] kbuild: fix so modpost can now check any .o file
Date: Thu, 24 Jan 2008 23:03:40 +0100
Message-Id: <1201212238-4369-59-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

It is very convinient to say:
scripts/mod/modpost mm/built-in.o

to check if any section mismatch errors occured
in mm/ (as an example).
Fix it so this is possible again.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 696d2a5..46660a4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1299,7 +1299,8 @@ static void read_symbols(char *modname)
 		handle_modversions(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
-	if (is_vmlinux(modname) && vmlinux_section_warnings) {
+	if (!is_vmlinux(modname) ||
+	     (is_vmlinux(modname) && vmlinux_section_warnings)) {
 		check_sec_ref(mod, modname, &info, init_section, init_section_ref_ok);
 		check_sec_ref(mod, modname, &info, exit_section, exit_section_ref_ok);
 	}
-- 
1.5.4.rc3.14.g44397

