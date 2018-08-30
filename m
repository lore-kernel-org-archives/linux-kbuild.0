Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33187 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbeH3NU3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Aug 2018 09:20:29 -0400
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] kconfig: remove a spurious self-assignment
Date: Thu, 30 Aug 2018 11:18:42 +0200
Message-Id: <1535620722-14689-1-git-send-email-lukas.bulwahn@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The self assignment was probably introduced by an automated code
refactoring in
commit 694c49a7c01c ("kconfig: drop localization support").

The issue was identified by a self-assign warning when running
make menuconfig with clang.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 scripts/kconfig/mconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 83b5836..143c05f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -490,7 +490,6 @@ static void build_conf(struct menu *menu)
 			switch (prop->type) {
 			case P_MENU:
 				child_count++;
-				prompt = prompt;
 				if (single_menu_mode) {
 					item_make("%s%*c%s",
 						  menu->data ? "-->" : "++>",
-- 
2.7.4
