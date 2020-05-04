Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:25563 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgEDII3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 04:08:29 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: remove misleading stale FIXME comment
Date: Mon,  4 May 2020 17:08:06 +0900
Message-Id: <20200504080807.126396-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

This comment was added by commit ("kbuild: Restore build nr, improve
vmlinux link") [1].

It was talking about if_changed_rule at that time. Now, it is unclear
what to fix.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ea52ca1b3e3882b499cc6c043f384958b88b62ff
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 9ff00bfe0575..ffd80afcd0bb 100644
--- a/Makefile
+++ b/Makefile
@@ -1827,9 +1827,6 @@ tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
 	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
 
-# FIXME Should go into a make.lib or something
-# ===========================================================================
-
 quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
       cmd_rmdirs = rm -rf $(rm-dirs)
 
-- 
2.25.1
