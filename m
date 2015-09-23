Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58506 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751654AbbIWFkj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 01:40:39 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 2/2] powerpc: Add ppc64le_defconfig
Date: Wed, 23 Sep 2015 15:40:35 +1000
Message-Id: <1442986835-13985-2-git-send-email-mpe@ellerman.id.au>
In-Reply-To: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, mmarek@suse.com

Based directly on ppc64_defconfig using merge_config.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index b9b4af2af9a5..3704db45a832 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -288,6 +288,10 @@ PHONY += pseries_le_defconfig
 pseries_le_defconfig:
 	$(call merge_into_defconfig,pseries_defconfig,le)
 
+PHONY += ppc64le_defconfig
+ppc64le_defconfig:
+	$(call merge_into_defconfig,ppc64_defconfig,le)
+
 PHONY += mpc85xx_defconfig
 mpc85xx_defconfig:
 	$(call merge_into_defconfig,mpc85xx_basic_defconfig,\
-- 
2.1.4

