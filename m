Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DF6C4332F
	for <linux-kbuild@archiver.kernel.org>; Thu, 24 Nov 2022 03:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbiKXDVE (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 23 Nov 2022 22:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiKXDVE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2022 22:21:04 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C18DCFA5D;
        Wed, 23 Nov 2022 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=XMTSR7SDwyNd3oXIu5/PkAuvtrfQZfl5dbS6vm4yTUI=; b=tMziuvtrcGOA34JUGsJyUuX66T
        YaKMCojjOU7Wpq4ZvqkWfbqDOAE9hHvglTE+wByjBtL11vOKLcoT3kkKRupc/l/zyk+o3twQd+iG4
        iuJsAKm6J/e7MGTipWEQIiaHwLykmpVMo1yK+auGinokxew560S/TaHFSeShvtRMA5jSXDfplqJAy
        JeY4R+AGHhrBjS1tBj4TisFzDySQCfHDy5frtwKI3Hx2atPOoTzLwFoQcez2oCc9pTaWjBvGiu0em
        mEiREoooWLpPKboWJ9yunH1hpyPurs8KGLfg0Em85Z2Lxep7vHaS1XSuF/luXTgZO1dTSHt/GjXNZ
        G6r2rXYQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oy2nR-008KrZ-IR; Thu, 24 Nov 2022 03:21:06 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] nios2: add FORCE for vmlinuz.gz
Date:   Wed, 23 Nov 2022 19:20:53 -0800
Message-Id: <20221124032053.10627-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add FORCE to placate a warning from make:

arch/nios2/boot/Makefile:24: FORCE prerequisite is missing

Fixes: 2fc8483fdcde ("nios2: Build infrastructure")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
---
 arch/nios2/boot/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/arch/nios2/boot/Makefile b/arch/nios2/boot/Makefile
--- a/arch/nios2/boot/Makefile
+++ b/arch/nios2/boot/Makefile
@@ -20,7 +20,7 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 $(obj)/vmlinux.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
 
-$(obj)/vmImage: $(obj)/vmlinux.gz
+$(obj)/vmImage: $(obj)/vmlinux.gz FORCE
 	$(call if_changed,uimage)
 	@$(kecho) 'Kernel: $@ is ready'
 
