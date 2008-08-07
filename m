Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:55244 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754605AbYHGHsy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Aug 2008 03:48:54 -0400
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id m777mhVu028370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Thu, 7 Aug 2008 02:48:52 -0500
Received: from dbde70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id m777mhmV018635
	for <linux-kbuild@vger.kernel.org>; Thu, 7 Aug 2008 13:18:43 +0530 (IST)
From: "Dasgupta, Romit" <romit@ti.com>
Date: Thu, 7 Aug 2008 13:18:32 +0530
Subject: scripts/Kbuild.include doubts
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB593013CA23CA1@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Sorry for being naïve, please see the changes below and kindly let me know if the changes look right.

In the first case, cc-version passes $(CC) anyway so I think that is not necessary.
In the second case, $($(1)) within a foreach doesnot seem to do a recursive expansion. So $(o) seems to be empty. I might be wrong but that's what I see happening!

Thanks,
-Romit

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d64e6ba..bb73b13 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -128,7 +128,7 @@ cc-fullversion = $(shell $(CONFIG_SHELL) \

 # cc-ifversion
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
-cc-ifversion = $(shell [ $(call cc-version, $(CC)) $(1) $(2) ] && echo $(3))
+cc-ifversion = $(shell [ $(call cc-version) $(1) $(2) ] && echo $(3))

 # ld-option
 # Usage: ldflags += $(call ld-option, -Wl$(comma)--hash-style=both)
@@ -147,7 +147,7 @@ build := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.
 addtree = $(if $(filter-out -I/%,$(1)),$(patsubst -I%,-I$(srctree)/%,$(1))) $(1

 # Find all -I options and call addtree
-flags = $(foreach o,$($(1)),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))
+flags = $(foreach o,$(1),$(if $(filter -I%,$(o)),$(call addtree,$(o)),$(o)))

 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
