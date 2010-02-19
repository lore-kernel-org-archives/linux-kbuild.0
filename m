Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:54792 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886Ab0BSLo1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Feb 2010 06:44:27 -0500
From: Thomas Weber <weber@corscience.de>
Subject: [PATCH] Trivial: Scripts: kconfig: util: Fix typo in comment
Date: Fri, 19 Feb 2010 12:43:44 +0100
Message-Id: <1266579824-14706-1-git-send-email-weber@corscience.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: trivial@kernel.org
Cc: Thomas Weber <weber@corscience.de>, Roman Zippel <zippel@linux-m68k.org>, Markus Heidelberg <markus.heidelberg@web.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

sting replaced with string

Signed-off-by: Thomas Weber <weber@corscience.de>
---
 scripts/kconfig/util.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index b6b2a46..25d1ec4 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -72,7 +72,7 @@ int file_write_dep(const char *name)
 }
 
 
-/* Allocate initial growable sting */
+/* Allocate initial growable string */
 struct gstr str_new(void)
 {
 	struct gstr gs;
-- 
1.6.4.4

