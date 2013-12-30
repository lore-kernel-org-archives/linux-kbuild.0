Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:49611 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752770Ab3L3Bcz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Dec 2013 20:32:55 -0500
Message-ID: <52C0CD3F.7080808@zytor.com>
Date: Sun, 29 Dec 2013 17:32:47 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: KCONFIG_ALLCONFIG + allmodconfig = brokenness
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

When KCONFIG_ALLCONFIG is used with "make allmodconfig", the result ends
up being largely the same as "make allyesconfig", because the resulting
kernel ends up with CONFIG_MODULES=n:

How to reproduce:

: tazenda 125 ; make O=../o.test allmodconfig
  GEN     /home/hpa/kernel/o.test/Makefile
scripts/kconfig/conf --allmodconfig Kconfig
#
# configuration written to .config
#
: tazenda 126 ; grep CONFIG_MODULES ../o.test/.config
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_MODULES=y
: tazenda 127 ; env KCONFIG_ALLCONFIG=/dev/null make O=../o.test
allmodconfig
  GEN     /home/hpa/kernel/o.test/Makefile
scripts/kconfig/conf --allmodconfig Kconfig
#
# configuration written to .config
#
: tazenda 128 ; grep CONFIG_MODULES ../o.test/.config
CONFIG_MODULES_USE_ELF_RELA=y
# CONFIG_MODULES is not set
