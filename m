Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:20645 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753119AbeCPHhn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Mar 2018 03:37:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 2/7] kbuild: remove wrong 'touch' in adjust_autoksyms.sh
Date: Fri, 16 Mar 2018 16:37:10 +0900
Message-Id: <1521185836-19120-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1521185836-19120-1-git-send-email-yamada.masahiro@socionext.com>
References: <1521185836-19120-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

The comment mentions it creates autoksyms.h in case it is missing,
but the actual code touches it when it does exists.

The build system creates it anyway because <linux/export.h> and
<asm-generic/export.h> need it.

The code would not have worked as intended, and people have not
noticed it.  This is a proof that we can simply remove it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Nicolas Pitre <nico@linaro.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Remove the code instead of fixing it

 scripts/adjust_autoksyms.sh | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index a162258..e0dd0d5 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,9 +48,6 @@ case "${KCONFIG_CONFIG}" in
 	. "./${KCONFIG_CONFIG}"
 esac
 
-# In case it doesn't exist yet...
-if [ -e "$cur_ksyms_file" ]; then touch "$cur_ksyms_file"; fi
-
 # Generate a new ksym list file with symbols needed by the current
 # set of modules.
 cat > "$new_ksyms_file" << EOT
-- 
2.7.4

