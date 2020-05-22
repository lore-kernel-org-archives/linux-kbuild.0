Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37247 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgEVCA2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:28 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/5] kbuild: move subdir-obj-y to scripts/Makefile.build
Date: Fri, 22 May 2020 11:00:00 +0900
Message-Id: <20200522020002.504506-3-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Save $(addprefix ...) for subdir-obj-y.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 ++
 scripts/Makefile.lib   | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f46d25441804..ee283efc1b45 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,6 +69,8 @@ endif
 
 # ===========================================================================
 
+subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
+
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 52299d5dba28..a41a4bbd20e2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -62,10 +62,6 @@ multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
 
-# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
-# tell kbuild to descend
-subdir-obj-y := $(filter %/built-in.a, $(obj-y))
-
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
 real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
@@ -91,7 +87,6 @@ targets		:= $(addprefix $(obj)/,$(targets))
 modorder	:= $(addprefix $(obj)/,$(modorder))
 obj-m		:= $(addprefix $(obj)/,$(obj-m))
 lib-y		:= $(addprefix $(obj)/,$(lib-y))
-subdir-obj-y	:= $(addprefix $(obj)/,$(subdir-obj-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
 multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
-- 
2.25.1
