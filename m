Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:53207 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbeG3Sa7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Jul 2018 14:30:59 -0400
Date: Mon, 30 Jul 2018 18:59:25 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [kbuild:kconfig2 1/10] arch/um/Kconfig:3: can't open file
        "arch/x86_64/um/Kconfig"
Message-ID: <20180730165925.GA29494@lst.de>
References: <201807281506.H8XSZLgK%fengguang.wu@intel.com> <CAK7LNAS6vY1SMcos_VOaqPUrLUJqgsH9jQ4aKodx5yesCPSCBQ@mail.gmail.com> <20180730094241.GA19128@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180730094241.GA19128@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kbuild test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>

What do you think of the patch below?  This reuses the HEADER_ARCH
variable that uml already needs to setup anyway:

diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index dd4b67131105..6b9938919f0b 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -63,7 +63,7 @@ config NR_CPUS
 	range 1 1
 	default 1
 
-source "arch/$(SUBARCH)/um/Kconfig"
+source "arch/$(HEADER_ARCH)/um/Kconfig"
 
 config STATIC_LINK
 	bool "Force a static link"
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 0207f6316d71..a88b40ee0332 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -174,4 +174,4 @@ endef
 include/generated/user_constants.h: $(HOST_DIR)/um/user-offsets.s
 	$(call filechk,gen-asm-offsets)
 
-export SUBARCH USER_CFLAGS CFLAGS_NO_HARDENING OS DEV_NULL_PATH
+export HEADER_ARCH USER_CFLAGS CFLAGS_NO_HARDENING OS DEV_NULL_PATH
