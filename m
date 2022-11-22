Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF69C4332F
	for <linux-kbuild@archiver.kernel.org>; Tue, 22 Nov 2022 14:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbiKVOjN (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 22 Nov 2022 09:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbiKVOjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2022 09:39:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9834387A;
        Tue, 22 Nov 2022 06:39:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC2B861731;
        Tue, 22 Nov 2022 14:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA1FC433D6;
        Tue, 22 Nov 2022 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669127949;
        bh=I3jJNAP9ZLch/e8adpMqIVPvk8KRS4yFg2lWfNILhjg=;
        h=From:To:Cc:Subject:Date:From;
        b=T1UzJAAqt+v+4ejnYmUHMqsOuC6IH3EjiaZO+A4MwdEKgfQcqUYoZapo8tRgI6PZQ
         Rq4smgDoWP93yQjDB3YwT4qtSuJXbflyMXRNH0jxmh0rrLMsnJ8has26f/oYp4N/+T
         TEl54sk9lyrE+1//7xB9CGcgIUIS8mkHLj8rfhGbwnjKV1yT+eKVoSisL7HHFXgrTI
         SNxKNZBi+tRn0Ytk+OYTFEl0Ukgf19ZlzvIJ5XlZk0dKGMRAwihagS3N7ZK7SutgKg
         2kslH3IhqTW9j2Lbhugw3fje8Sk22BKLrRt83Kl5SqQi2WrhiCwcmSKUFRSGc20Dmw
         OI5HM3AJ/Jw7Q==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] kbuild: fix "cat: .version: No such file or directory"
Date:   Tue, 22 Nov 2022 23:39:02 +0900
Message-Id: <20221122143902.272330-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 2df8220cc511 ("kbuild: build init/built-in.a just once"),
the .version file is not touched at all when KBUILD_BUILD_VERSION is
given.

If KBUILD_BUILD_VERSION is specified and the .version file is missing
(for example right after 'make mrproper'), "No such file or director"
is shown. Even if the .version exists, it is irrelevant to the version
of the current build.

  $ make -j$(nproc) KBUILD_BUILD_VERSION=100 mrproper defconfig all
    [ snip ]
    BUILD   arch/x86/boot/bzImage
  cat: .version: No such file or directory
  Kernel: arch/x86/boot/bzImage is ready  (#)

Show KBUILD_BUILD_VERSION if it is given.

Fixes: 2df8220cc511 ("kbuild: build init/built-in.a just once")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/microblaze/Makefile | 4 ++--
 arch/x86/boot/Makefile   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 3f8a86c4336a..02e6be9c5b0d 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -67,12 +67,12 @@ linux.bin.ub linux.bin.gz: linux.bin
 linux.bin: vmlinux
 linux.bin linux.bin.gz linux.bin.ub:
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'$(or $(KBUILD_BUILD_VERSION),`cat .version`)')'
 
 PHONY += simpleImage.$(DTB)
 simpleImage.$(DTB): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(addprefix $(boot)/$@., ub unstrip strip)
-	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'$(or $(KBUILD_BUILD_VERSION),`cat .version`)')'
 
 define archhelp
   echo '* linux.bin    - Create raw binary'
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9860ca5979f8..9e38ffaadb5d 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -83,7 +83,7 @@ cmd_image = $(obj)/tools/build $(obj)/setup.bin $(obj)/vmlinux.bin \
 
 $(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin $(obj)/tools/build FORCE
 	$(call if_changed,image)
-	@$(kecho) 'Kernel: $@ is ready' ' (#'`cat .version`')'
+	@$(kecho) 'Kernel: $@ is ready' ' (#'$(or $(KBUILD_BUILD_VERSION),`cat .version`)')'
 
 OBJCOPYFLAGS_vmlinux.bin := -O binary -R .note -R .comment -S
 $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
-- 
2.34.1

