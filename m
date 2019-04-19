Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36740 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfDSTMh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Apr 2019 15:12:37 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [PATCH 1/1] kconfig: Terminate menu blocks with a newline in the generated config
Date: Fri, 19 Apr 2019 13:29:33 +0300
Message-Id: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Popov <alex.popov@linux.com>

Currently menu blocks start with a pretty header but end with nothing in
the generated config. So next config options stick together with the
options from the menu block.

Let's terminate menu blocks with a newline in the generated config.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 scripts/kconfig/confdata.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 08ba146..1459153 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -888,6 +888,8 @@ int conf_write(const char *name)
 		if (menu->next)
 			menu = menu->next;
 		else while ((menu = menu->parent)) {
+			if (!menu->sym && menu_is_visible(menu))
+				fprintf(out, "\n");
 			if (menu->next) {
 				menu = menu->next;
 				break;
-- 
2.7.4
