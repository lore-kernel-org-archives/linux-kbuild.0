Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:42896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfD0Dqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 23:46:52 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: mini.config with defconfig
Message-ID: <95724704-6bc7-d8d7-7d6c-88d316be0e61@infradead.org>
Date: Fri, 26 Apr 2019 20:46:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi,

Is the "defconfig" target supported when using a mini.config file?

I am trying to use this mini.config file with x86_64 defconfig:

# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# CONFIG_UNWINDER_GUESS is not set


but the generated .config file always has:
CONFIG_UNWINDER_ORC=y
# CONFIG_UNWINDER_FRAME_POINTER is not set


command:
make KCONFIG_ALLCONFIG=mini.config ARCH=x86_64 O=MINI defconfig


thanks.
-- 
~Randy
