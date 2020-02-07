Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f74.google.com ([209.85.221.74]:36358 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBGSIJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:08:09 -0500
Received: by mail-wr1-f74.google.com with SMTP id t6so54754wru.3
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2020 10:08:08 -0800 (PST)
Date: Fri,  7 Feb 2020 18:07:55 +0000
In-Reply-To: <20200207180755.100561-1-qperret@google.com>
Message-Id: <20200207180755.100561-4-qperret@google.com>
Mime-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com>
Subject: [PATCH v3 3/3] kbuild: generate autoksyms.h early
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

Signed-off-by: Quentin Perret <qperret@google.com>
---
 Makefile                 | 2 +-
 scripts/gen_autoksyms.sh | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6a01b073915e..e5c389d189f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1065,7 +1065,7 @@ autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
 
 $(autoksyms_h):
 	$(Q)mkdir -p $(dir $@)
-	$(Q)touch $@
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index ce0919c3791a..ae033ab03a4a 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -32,7 +32,8 @@ cat > "$output_file" << EOT
 
 EOT
 
-sed 's/ko$/mod/' modules.order |
+[[ -f modules.order ]] && modlist=modules.order || modlist=/dev/null
+sed 's/ko$/mod/' $modlist |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 cat - "$ksym_wl" |
 sort -u |
-- 
2.25.0.341.g760bfbb309-goog
