Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:39126 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731021AbgBJNTc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 08:19:32 -0500
Received: by mail-pg1-f201.google.com with SMTP id r192so5423282pgr.6
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 05:19:30 -0800 (PST)
Date: Mon, 10 Feb 2020 05:19:25 -0800
Message-Id: <20200210131925.145463-1-samitolvanen@google.com>
Mime-Version: 1.0
Subject: [PATCH] kbuild: remove duplicate dependencies from .mod files
From: Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>

With CONFIG_TRIM_UNUSED_SYMS, if a module has enough dependencies to
exceed the default xargs command line size limit, the output is split
into multiple lines, which can result in used symbols getting trimmed.

This change removes duplicate dependencies, which will reduce the
probability of this happening and makes .mod files smaller and easier
to read.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a1730d42e5f3..a083bcec19d3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -257,7 +257,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo
 else
 cmd_undef_syms = echo
 endif

base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
-- 
2.25.0.341.g760bfbb309-goog
