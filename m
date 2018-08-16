Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:18388 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730404AbeHPKqN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 06:46:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: suppress "configuration written to .config" for syncconfig
Date: Thu, 16 Aug 2018 16:48:26 +0900
Message-Id: <1534405706-18467-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The top-level Makefile invokes "make syncconfig" when necessary.
Then, Kconfig displays the following message when .config is updated.

  #
  # configuration written to .config
  #

It is distracting because "make syncconfig" happens during the build
stage, and does nothing important in most cases.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index b35cc93..7b2b372 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -508,6 +508,11 @@ int main(int ac, char **av)
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
 		case syncconfig:
+			/*
+			 * syncconfig is invoked during the build stage.
+			 * Suppress distracting "configuration written to ..."
+			 */
+			conf_set_message_callback(NULL);
 			sync_kconfig = 1;
 			break;
 		case defconfig:
-- 
2.7.4
