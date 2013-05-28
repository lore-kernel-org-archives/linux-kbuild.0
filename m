Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:34970 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751210Ab3E1KQG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 May 2013 06:16:06 -0400
Received: by mail-pd0-f179.google.com with SMTP id q11so7427894pdj.24
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2013 03:16:05 -0700 (PDT)
From: zzs0213@gmail.com
Subject: [PATCH] let kbuild mkdir for dir/file.o
Date: Tue, 28 May 2013 18:14:20 +0800
Message-Id: <51a483e4.cfaf420a.3b33.5494@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: =?UTF-8?q?=E5=BC=A0=E5=BF=A0=E5=B1=B1?= <zzs213@126.com>, =?UTF-8?q?=E5=BC=A0=E5=BF=A0=E5=B1=B1?= <zzs0213@gmail.com>

From: 张忠山 <zzs213@126.com>

when obj-y += dir/file.o
the $(obj)/dir not created, this patch fix this

this bug caused by commit
  f5fb976520a53f45f8bbf2e851f16b3b5558d485

Signed-off-by: 张忠山 <zzs0213@gmail.com>
---
 scripts/Makefile.lib |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 51bb3de..6bae5a9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -63,7 +63,8 @@ multi-objs   := $(multi-objs-y) $(multi-objs-m)
 subdir-obj-y := $(filter %/built-in.o, $(obj-y))
 
 # $(obj-dirs) is a list of directories that contain object files
-obj-dirs := $(dir $(multi-objs) $(subdir-obj-y))
+__subdir-obj-y := $(foreach o,$(obj-y),$(if $(filter-out $(o),$(notdir $(o))),$(o)))
+obj-dirs := $(dir $(multi-objs) $(__subdir-obj-y))
 
 # Replace multi-part objects by their individual parts, look at local dir only
 real-objs-y := $(foreach m, $(filter-out $(subdir-obj-y), $(obj-y)), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m))) $(extra-y)
-- 
1.7.9.5

