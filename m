Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:53895 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751058AbZGLILz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jul 2009 04:11:55 -0400
From: Cheng Renquan <crq@kernel.org>
Subject: [PATCH 0/6] kbuild configuration system improvements
Date: Sun, 12 Jul 2009 16:11:42 +0800
Message-Id: <1247386308-19628-1-git-send-email-crq@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com

From: Cheng Renquan <crquan@gmail.com>

These patches improve usability of kernel configuration system,

1. add symbol's value shown accompanied in config item's help message;
2. move the real plumbing functions code from mconf.c to menu.c, make them
   be able to be shared with other configuration methods;
3. add "symbol's value shown" support for gconfig/xconfig/config;

    0001-add-symbol-value-to-help-find-the-real-depend.patch
    0002-add-menu_get_ext_help-function-to-display-more-infor.patch
    0003-menuconfig-improvements.patch
    0004-make-use-of-menu_get_ext_help-in-gconfig.patch
    0005-make-use-of-menu_get_ext_help-in-qconfig.patch
    0006-make-use-of-menu_get_ext_help-in-make-config.patch

--
Cheng Renquan
