Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:48225 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762977AbYF3Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Jun 2008 17:34:32 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 08/24] kbuild: make clean removes *.o.* as well
Date: Mon, 30 Jun 2008 23:35:02 +0200
Message-Id: <1214861718-32626-8-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080630213155.GA32479@uranus.ravnborg.org>
References: <20080630213155.GA32479@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

From: Alexey Dobriyan <adobriyan@gmail.com>

Those are left presumably from aborted ccache(1) compilations:

	arch/x86/kernel/.tmp_io_apic_64.o.T5veul
	arch/x86/kvm/.tmp_x86.o.SZWn69
	arch/x86/mm/.tmp_pgtable.o.sL1LTf
	drivers/ieee1394/.tmp_ieee1394_transactions.o.bUj6o1
	drivers/infiniband/hw/mlx4/.tmp_main.o.vy0ep6

BTW, with git there is nice way to check for such nuisainces:

	make mrproper
	git-ls-files -o

should give empty output.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 2f087df..572ecfb 100644
--- a/Makefile
+++ b/Makefile
@@ -1144,7 +1144,8 @@ clean: archclean $(clean-dirs)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
-		-o -name '*.symtypes' -o -name 'modules.order' \) \
+		-o -name '*.symtypes' -o -name 'modules.order'	\
+		-o -name '*.o.*' \) \
 		-type f -print | xargs rm -f
 
 # mrproper - Delete all generated files, including .config
-- 
1.5.6.1.93.gef98

