Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44375 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934321AbcKVVfl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2016 16:35:41 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 5/6] unicore32: Use full path in KBUILD_IMAGE definition
Date: Tue, 22 Nov 2016 22:34:33 +0100
Message-Id: <20161122213434.14788-5-mmarek@suse.com>
In-Reply-To: <20161122213434.14788-1-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>

The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
expect it to point to the image file in the build directory. The
builddeb script has a workaround for architectures which only provide
the basename, but let's provide a clean interface for packaging tools.

Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 arch/unicore32/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/Makefile b/arch/unicore32/Makefile
index b6f5c4c1eaf9..98a5ca43ae87 100644
--- a/arch/unicore32/Makefile
+++ b/arch/unicore32/Makefile
@@ -43,9 +43,9 @@ boot			:= arch/unicore32/boot
 
 # Default defconfig and target when executing plain make
 KBUILD_DEFCONFIG	:= $(ARCH)_defconfig
-KBUILD_IMAGE		:= zImage
+KBUILD_IMAGE		:= $(boot)/zImage
 
-all:	$(KBUILD_IMAGE)
+all:	zImage
 
 zImage Image uImage: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-- 
2.10.0

