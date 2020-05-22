Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37242 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/5] kbuild: clear KBUILD_MODULES in top Makefile if CONFIG_MODULES=n
Date: Fri, 22 May 2020 10:59:59 +0900
Message-Id: <20200522020002.504506-2-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Do not try to build any module-related artifacts when CONFIG_MODULES
is disabled.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 4 ++++
 scripts/Makefile.build | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1f5bbfb31103..72eb55a36545 100644
--- a/Makefile
+++ b/Makefile
@@ -1724,6 +1724,10 @@ build-dirs := $(foreach d, $(build-dirs), \
 
 endif
 
+ifndef CONFIG_MODULES
+KBUILD_MODULES :=
+endif
+
 # Handle descending into subdirectories listed in $(build-dirs)
 # Preset locale variables to speed up the build process. Limit locale
 # tweaks to this spot to avoid wrong language settings when running
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9af88f4cacb8..f46d25441804 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -77,7 +77,7 @@ ifdef need-builtin
 builtin-target := $(obj)/built-in.a
 endif
 
-ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
+ifdef need-modorder
 modorder-target := $(obj)/modules.order
 endif
 
-- 
2.25.1
