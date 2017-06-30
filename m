Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51654 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752967AbdF3W6Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jun 2017 18:58:25 -0400
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] kbuild: modpost: Warn about references from rodata to __init text
Date: Fri, 30 Jun 2017 15:58:22 -0700
Message-Id: <20170630225822.25349-1-sboyd@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>

If we have a structure that's marked const it will be placed
into the .rodata section but it could reference an init section
function. Include the read only data section in the check we have
for read/write data sections referencing init sections so we can
find this class of problems. This exposes quite a few places
where const marked structures are referencing __init functions and
__init data that we were previously ignoring.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Making this change leads to quite a few other errors even on the
multi_v7_defconfig for ARM[1]. I still need to do a build of the
allmodconfig to see how many other errors there, but it seems to
be quite a few. I suppose those will need to be fixed before we can
merge this?

[1] https://www.irccloud.com/pastebin/zzqfWGQY/

 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 48397feb08fb..4f2be5c6727d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -903,7 +903,7 @@ static void check_section(const char *modname, struct elf_info *elf,
 #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
 #define ALL_EXIT_SECTIONS EXIT_SECTIONS, ALL_XXXEXIT_SECTIONS
 
-#define DATA_SECTIONS ".data", ".data.rel"
+#define DATA_SECTIONS ".rodata", ".data", ".data.rel"
 #define TEXT_SECTIONS ".text", ".text.unlikely", ".sched.text", \
 		".kprobes.text", ".cpuidle.text"
 #define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text", \
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

