Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:37491 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752462AbeAYBl2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jan 2018 20:41:28 -0500
Received: by mail-pf0-f195.google.com with SMTP id p1so4609528pfh.4
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jan 2018 17:41:28 -0800 (PST)
From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: [PATCH] kbuild: make Makefile|Kbuild in each directory optional
Date: Wed, 24 Jan 2018 17:41:19 -0800
Message-Id: <20180125014119.31219-1-jakub.kicinski@netronome.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, Jakub Kicinski <jakub.kicinski@netronome.com>

It is useful to be able to build single object files, e.g.:
$ make net/sched/cls_flower.o W=1 C=2

Currently kbuild does a hard include of a Kbuild or Makefile
for directory where that object would reside.  Kbuild doesn't
cater too well to multi-directory drivers, meaning such drivers
will usually only use a single central Makefile.  This in turn
means it will be impossible to build most of object files
individually for such drivers.

Make the include of $dir/{Makefile,Kbuild} optional.

Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
---
I must admit I have no idea whose tree I should send this to :(
Could it go via net-next if no one on linux-kbuild objects?

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 47cddf32aeba..178864f877d5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -42,7 +42,7 @@ save-cflags := $(CFLAGS)
 # The filename Kbuild has precedence over Makefile
 kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
 kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
-include $(kbuild-file)
+-include $(kbuild-file)
 
 # If the save-* variables changed error out
 ifeq ($(KBUILD_NOPEDANTIC),)
-- 
2.15.1

