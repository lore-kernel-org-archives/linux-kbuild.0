Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f202.google.com ([209.85.221.202]:39239 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgB1RU3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 12:20:29 -0500
Received: by mail-vk1-f202.google.com with SMTP id t126so1591882vkg.6
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 09:20:27 -0800 (PST)
Date: Fri, 28 Feb 2020 17:20:15 +0000
In-Reply-To: <20200228172015.44369-1-qperret@google.com>
Message-Id: <20200228172015.44369-4-qperret@google.com>
Mime-Version: 1.0
References: <20200228172015.44369-1-qperret@google.com>
Subject: [PATCH v6 3/3] kbuild: generate autoksyms.h early
From: Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, nico@fluxnic.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org, qperret@google.com

When doing a cold build, autoksyms.h starts empty, and is updated late
in the build process to have visibility over the symbols used by in-tree
drivers. But since the symbol whitelist is known upfront, it can be used
to pre-populate autoksyms.h and maximize the amount of code that can be
compiled to its final state in a single pass, hence reducing build time.

Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
creating an empty file.

Acked-by: Nicolas Pitre <nico@fluxnic.net>
Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 Makefile                 | 7 +++++--
 scripts/gen_autoksyms.sh | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 1a1a0d271697..c690a838d537 100644
--- a/Makefile
+++ b/Makefile
@@ -1063,9 +1063,12 @@ endif
 
 autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
 
+quiet_cmd_autoksyms_h = GEN     $@
+      cmd_autoksyms_h = mkdir -p $(dir $@); \
+			$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
+
 $(autoksyms_h):
-	$(Q)mkdir -p $(dir $@)
-	$(Q)touch $@
+	$(call cmd,autoksyms_h)
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index ef46200c366b..16c0b2ddaa4c 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -39,7 +39,8 @@ cat > "$output_file" << EOT
 
 EOT
 
-sed 's/ko$/mod/' modules.order |
+[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
+sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-- 
2.25.1.481.gfbce0eb801-goog
