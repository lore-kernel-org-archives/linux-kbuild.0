Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35534 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933088Ab1BZAom (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Feb 2011 19:44:42 -0500
Message-ID: <4D684CF6.30002@suse.com>
Date: Fri, 25 Feb 2011 19:44:38 -0500
From: Jeff Mahoney <jeffm@suse.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] kconfig: Use /proc/config.gz as a configuration source
References: <4D671556.80607@suse.com> <20110225060706.GA12723@merkur.ravnborg.org>
In-Reply-To: <20110225060706.GA12723@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

 This patch uses the type handlers to add /proc/config.gz as a configuration
 source when 'make oldconfig' is used with a missing .config

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---

 init/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/init/Kconfig
+++ b/init/Kconfig
@@ -26,6 +26,7 @@ config DEFCONFIG_LIST
 	depends on !UML
 	option defconfig_list
 	default "/lib/modules/$UNAME_RELEASE/.config"
+	default "/proc/config.gz"
 	default "/etc/kernel-config"
 	default "/boot/config-$UNAME_RELEASE"
 	default "$ARCH_DEFCONFIG"

-- 
Jeff Mahoney
SUSE Labs
