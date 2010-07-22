Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:40650 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752685Ab0GVMZD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jul 2010 08:25:03 -0400
Received: by wwj40 with SMTP id 40so3365667wwj.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jul 2010 05:25:02 -0700 (PDT)
From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: [PATCH] kconfig: make randconfig fair for booleans
Date: Thu, 22 Jul 2010 14:24:57 +0200
Message-Id: <1279801497-810-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, zippel@linux-m68k.org, mmarek@suse.cz, sam@ravnborg.org
Cc: Peter Korsgaard <jacmet@sunsite.dk>

Give boolean symbols a 50% chance of getting enabled, rather than 67%.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 scripts/kconfig/confdata.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c4dec80..210a49e 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -862,7 +862,8 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
-				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
+				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
+				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
 				break;
 			default:
 				continue;
-- 
1.7.1

