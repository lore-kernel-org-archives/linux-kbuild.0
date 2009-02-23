Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.188]:24359 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753478AbZBWPKR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 10:10:17 -0500
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 0/6] [KBUILD] configuration system improvements
Date: Mon, 23 Feb 2009 23:09:58 +0800
Message-Id: <1235401804-8136-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, cr_quan@163.com

This group of patches improve the usability of kernel configuration system,
mainly,

1. add symbol's value shown accompanied in config item's help message;
2. move the real plumbing functions code from mconf.c to menu.c, make them
   be able to be shared with other configuration methods;
3. add "symbol's value shown" support for gconfig/xconfig/config;

  0001--KBUILD-add-symbol-value-to-help-find-the-real-depe.patch
  0002--KBUILD-add-menu_get_ext_help-function-to-display-m.patch
  0003--KBUILD-menuconfig-improvements.patch
  0004--KBUILD-make-use-of-menu_get_ext_help-in-gconfig.patch
  0005--KBUILD-make-use-of-menu_get_ext_help-in-qconfig.patch
  0006--KBUILD-make-use-of-menu_get_ext_help-in-make-conf.patch

I found gconfig still lack of "search by symbol" support, and that would be
in another patch.

Request for comments, thanks.

--
Cheng Renquan, Shenzhen, China
