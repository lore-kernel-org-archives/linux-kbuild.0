Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57766 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752657AbeBPSlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 13:41:18 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/23] kconfig: set SYMBOL_AUTO to the symbol marked with defconfig_list
Date: Sat, 17 Feb 2018 03:38:32 +0900
Message-Id: <1518806331-7101-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The 'defconfig_list' is a weird attribute.  If the '.config' is
missing, conf_read_simple() iterates over all visible defaults,
then it uses the first one for which fopen() succeeds.

config DEFCONFIG_LIST
	string
	depends on !UML
	option defconfig_list
	default "/lib/modules/$UNAME_RELEASE/.config"
	default "/etc/kernel-config"
	default "/boot/config-$UNAME_RELEASE"
	default "$ARCH_DEFCONFIG"
	default "arch/$ARCH/defconfig"

However, like other symbols, the first visible default is always
written out to the .config file.  This might be different from what
has been actually used.

For example, on my machine, the third one "/boot/config-$UNAME_RELEASE"
is opened, like follows:

  $ rm .config
  $ make oldconfig 2>/dev/null
  scripts/kconfig/conf  --oldconfig Kconfig
  #
  # using defaults found in /boot/config-4.4.0-112-generic
  #
  *
  * Restart config...
  *
  *
  * IRQ subsystem
  *
  Expose irq internals in debugfs (GENERIC_IRQ_DEBUGFS) [N/y/?] (NEW)

However, the resulted .config file contains the first one since it is
visible:

  $ grep CONFIG_DEFCONFIG_LIST .config
  CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"

In order to stop confusing people, prevent this CONFIG option from
being written to the .config file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I'd like to fix the root case of this weirdness later.
(and other 'option' attributes as well)

But, this series is focusing a more important work in a bigger picture.

For now, I decided to just hide CONFIG_DEFCONFIG_LIST
from the .config file.


 scripts/kconfig/menu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 9922285..36cd3e1 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -212,6 +212,7 @@ void menu_add_option(int token, char *arg)
 			sym_defconfig_list = current_entry->sym;
 		else if (sym_defconfig_list != current_entry->sym)
 			zconf_error("trying to redefine defconfig symbol");
+		sym_defconfig_list->flags |= SYMBOL_AUTO;
 		break;
 	case T_OPT_ENV:
 		prop_add_env(arg);
-- 
2.7.4

