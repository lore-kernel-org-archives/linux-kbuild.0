Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728365AbgEUU1W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 16:27:22 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4388AC061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 13:27:22 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 207so6747027ybl.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 13:27:22 -0700 (PDT)
Date: Thu, 21 May 2020 13:27:16 -0700
Message-Id: <20200521202716.193316-1-samitolvanen@google.com>
Mime-Version: 1.0
Subject: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
From: Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>

Instead of linking all compilation units again each time vmlinux_link is
called, reuse vmlinux.o from modpost_link.

With x86_64 allyesconfig, vmlinux_link is called three times and reusing
vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
in the time spent in vmlinux_link).

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/link-vmlinux.sh | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d09ab4afbda4..c6cc4305950c 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -77,11 +77,8 @@ vmlinux_link()
 
 	if [ "${SRCARCH}" != "um" ]; then
 		objects="--whole-archive			\
-			${KBUILD_VMLINUX_OBJS}			\
+			vmlinux.o				\
 			--no-whole-archive			\
-			--start-group				\
-			${KBUILD_VMLINUX_LIBS}			\
-			--end-group				\
 			${@}"
 
 		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\

base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
-- 
2.27.0.rc0.183.gde8f92d652-goog
