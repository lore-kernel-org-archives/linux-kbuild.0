Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40663 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752336AbdKMKbg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:31:36 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/6] kbuild: filter-out PHONY targets from "targets"
Date: Mon, 13 Nov 2017 19:29:36 +0900
Message-Id: <1510568979-24440-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The variable "targets" contains object paths for which existing .*.cmd
files should be included.

scripts/Makefile.build automatically adds $(MAKECMDGOALS) to "targets"
as follows:

  targets += $(extra-y) $(MAKECMDGOALS) $(always)

The $(MAKECMDGOALS) is a PHONY target in several places.  PHONY targets
never create .*.cmd files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Newly added

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 62d5314..6f60377 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -562,7 +562,7 @@ $(multi-used-m): FORCE
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-y) $(multi-used-m)
-
+targets := $(filter-out $(PHONY), $(targets))
 
 # Descending
 # ---------------------------------------------------------------------------
-- 
2.7.4

