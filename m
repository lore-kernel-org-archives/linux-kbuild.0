Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:43402 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgEKDub (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 23:50:31 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: add this-makefile as a shorthand for $(lastword $(MAKEFILE_LIST))
Date: Mon, 11 May 2020 12:50:12 +0900
Message-Id: <20200511035013.1629672-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Make it clearer, and self-documenting.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 119a08c90abb..1a4977ad7cd9 100644
--- a/Makefile
+++ b/Makefile
@@ -157,12 +157,14 @@ MAKEFLAGS += --include-dir=$(abs_srctree)
 need-sub-make := 1
 endif
 
+this-makefile := $(lastword $(MAKEFILE_LIST))
+
 ifneq ($(filter 3.%,$(MAKE_VERSION)),)
 # 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
 # We need to invoke sub-make to avoid implicit rules in the top Makefile.
 need-sub-make := 1
 # Cancel implicit rules for this Makefile.
-$(lastword $(MAKEFILE_LIST)): ;
+$(this-makefile): ;
 endif
 
 export abs_srctree abs_objtree
@@ -172,7 +174,7 @@ ifeq ($(need-sub-make),1)
 
 PHONY += $(MAKECMDGOALS) sub-make
 
-$(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all: sub-make
+$(filter-out _all sub-make $(this-makefile), $(MAKECMDGOALS)) _all: sub-make
 	@:
 
 # Invoke a second make in the output directory, passing relevant variables
-- 
2.25.1
