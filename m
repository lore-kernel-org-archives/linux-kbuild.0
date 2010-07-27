Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:40428 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098Ab0G0TWa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Jul 2010 15:22:30 -0400
Date: Tue, 27 Jul 2010 21:27:27 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: [PATCH 2.6.35-rc6] kconfig: fix MODULES-related bug in case of no
 .config
Message-ID: <20100727192727.GA17954@ulf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

There seems to be a kconfig bug due to MODULES not always being evaluated if no
.config is found. Take the following Kconfig as an example:

config MODULES
	def_bool y

config FOO
	def_tristate m

With no .config, the following configuration is generated:

CONFIG_MODULES=y
CONFIG_FOO=y

With an empty .config, the following:

CONFIG_MODULES=y
CONFIG_FOO=m

Tristate choice statements can also exhibit the problem, due to having an
implicit rev_dep (select) containing "m".

The problem is that MODULES is never evaluted in conf_read_simple() unless
there's a .config. The following patch fixes this.

Signed-off-by: Ulf Magnusson <ulfalizer.lkml@gmail.com>

diff -uNr linux.vanilla/scripts/kconfig/confdata.c linux.new/scripts/kconfig/confdata.c
--- linux.vanilla/scripts/kconfig/confdata.c	2010-07-27 16:47:43.443006287 +0200
+++ linux.new/scripts/kconfig/confdata.c	2010-07-27 16:50:19.795005537 +0200
@@ -170,8 +170,10 @@
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list)
+		if (!sym_defconfig_list) {
+			sym_calc_value(modules_sym);
 			return 1;
+		}
 
 		for_all_defaults(sym_defconfig_list, prop) {
 			if (expr_calc_value(prop->visible.expr) == no ||
