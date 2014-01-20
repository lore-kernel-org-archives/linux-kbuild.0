Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:34212 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750707AbaATFKS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jan 2014 00:10:18 -0500
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s0K5AHGe006482
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:10:17 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili15) with ESMTP id s0K5AHB09000
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2014 14:10:17 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 2/2] kbuild: docbook: specify KERNELDOC dependency correctly
Date: Mon, 20 Jan 2014 14:10:11 +0900
Message-Id: <1390194611-15102-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1390194611-15102-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

It is not a good idea to describe

  %.xml: %.tmpl FORCE
    ...

and

  $(BOOKS): $(KERNELDOC)

separately. This cannot detect missing template files.

For example, add something to DOCBOOKS variable:
  DOCBOOKS += foobar.xml
and run
  make xmldocs

It will succeed even if Documention/DocBook/foobar.tmpl
does not exist.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Documentation/DocBook/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index 237f6dc..824d26a 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -87,13 +87,9 @@ define rule_docproc
         ) > $(dir $@).$(notdir $@).cmd
 endef
 
-%.xml: %.tmpl FORCE
+%.xml: %.tmpl $(KERNELDOC) $(DOCPROC) FORCE
 	$(call if_changed_rule,docproc)
 
-###
-# Changes in kernel-doc force a rebuild of all documentation
-$(BOOKS): $(KERNELDOC)
-
 # Tell kbuild to always build the programs
 always := $(hostprogs-y)
 
-- 
1.8.3.2

