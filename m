Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:22642 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753532AbeAJG51 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 01:57:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] kconfig: hide irrelevant menu for oldconfig
Date: Wed, 10 Jan 2018 15:56:14 +0900
Message-Id: <1515567374-12722-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Marc Herbert <marc.herbert@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Historically, "make oldconfig" has changed its behavior several times,
quieter or louder.  (I attached the history below.)  Currently, it is
not as quiet as it should be.  This commit addresses it.

  Test Case
  ---------

---------------------------(Kconfig)----------------------------
menu "menu"

config FOO
        bool "foo"

menu "sub menu"

config BAR
        bool "bar"

endmenu

endmenu

menu "sibling menu"

config BAZ
        bool "baz"

endmenu
----------------------------------------------------------------

---------------------------(.config)----------------------------
CONFIG_BAR=y
CONFIG_BAZ=y
----------------------------------------------------------------

With the Kconfig and .config above, "make silentoldconfig" and
"make oldconfig" work differently as follows:

  $ make silentoldconfig
  scripts/kconfig/conf  --silentoldconfig Kconfig
  *
  * Restart config...
  *
  *
  * menu
  *
  foo (FOO) [N/y] (NEW) y
  #
  # configuration written to .config
  #

  $ make oldconfig
  scripts/kconfig/conf  --oldconfig Kconfig
  *
  * Restart config...
  *
  *
  * menu
  *
  foo (FOO) [N/y] (NEW) y
  *
  * sub menu
  *
  bar (BAR) [Y/n] y
  #
  # configuration written to .config
  #

Both hide "sibling node" since it is irrelevant.  The difference is
that silentoldconfig hides "sub menu" whereas oldconfig does not.
The behavior of silentoldconfig is preferred since the "sub menu"
does not contain any new symbol.

The root cause is in conf().  There are three input modes that can
call conf(); oldaskconfig, oldconfig, and silentoldconfig.

Everytime conf() encounters a menu entry, it calls check_conf() to
check if it contains new symbols.  If no new symbol is found, the
menu is just skipped.

Currently, this happens only when input_mode == silentoldconfig.
The oldaskconfig enters into the check_conf() loop as silentoldconfig,
so oldaskconfig works likewise for the second loop or later, but it
never happens for oldconfig.  So, irrelevant sub-menus are shown for
oldconfig.

Change the test condition to "input_mode != oldaskconfig".  This is
false only for the first loop of oldaskconfig; it must ask the user
all symbols, so no need to call check_conf().

  History of oldconfig
  --------------------

[0] Originally, "make oldconfig" was as loud as "make config"  (It
    showed the entire .config file)

[1] Commit cd9140e1e73a ("kconfig: make oldconfig is now less chatty")
    made oldconfig quieter, but it was still less quieter than
    silentoldconfig.  (oldconfig did not hide sub-menus)

[2] Commit 204c96f60904 ("kconfig: fix silentoldconfig") changed
    the input_mode of oldconfig to "ask_silent" from "ask_new".
    So, oldconfig really became as quiet as silentoldconfig.
    (oldconfig hided irrelevant sub-menus)

[3] Commit 4062f1a4c030 ("kconfig: use long options in conf") made
    oldconfig as loud as [0] due to misconversion.

[4] Commit 14828349719a ("kconfig: fix make oldconfig") addressed
    the misconversion of [3], but it made oldconfig quieter only to
    the same level as [1], not [2].

This commit is restoring the behavior of [2].

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1d2ed3e..8b9cdf4 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -368,8 +368,7 @@ static void conf(struct menu *menu)
 
 		switch (prop->type) {
 		case P_MENU:
-			if (input_mode == silentoldconfig &&
-			    rootEntry != menu) {
+			if (input_mode != oldaskconfig && rootEntry != menu) {
 				check_conf(menu);
 				return;
 			}
@@ -660,7 +659,7 @@ int main(int ac, char **av)
 	case oldaskconfig:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
-		input_mode = silentoldconfig;
+		input_mode = oldconfig;
 		/* fall through */
 	case oldconfig:
 	case listnewconfig:
-- 
2.7.4

