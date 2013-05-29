Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33767 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752930Ab3E2GMX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 May 2013 02:12:23 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb11so7519316pad.37
        for <linux-kbuild@vger.kernel.org>; Tue, 28 May 2013 23:12:22 -0700 (PDT)
Received: from localhost.localdomain ([110.184.249.21])
        by mx.google.com with ESMTPSA id cd2sm35971964pbd.35.2013.05.28.23.12.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Tue, 28 May 2013 23:12:21 -0700 (PDT)
From: =?UTF-8?q?=E5=BC=A0=E5=BF=A0=E5=B1=B1?= <zzs0213@gmail.com>
Subject: [PATCH] let kbuild mkdir for dir/file.o
Date: Wed, 29 May 2013 14:10:48 +0800
Message-Id: <1369807848-4465-1-git-send-email-zzs0213@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

when add a obj with dir to obj-y, like this

    obj-y += dir/file.o

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

