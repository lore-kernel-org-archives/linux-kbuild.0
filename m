Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:33814 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753869Ab1D0VgK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2011 17:36:10 -0400
Message-ID: <4DB88C1F.5070006@verizon.net>
Date: Wed, 27 Apr 2011 17:35:27 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 resend 4/7] kbuild: rearrange clean-files
Content-Type: multipart/mixed;
	boundary="------------090900080006000803070306"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

--------------090900080006000803070306
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch rearranges clean-files.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/kconfig/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 74d9512..eacdefb 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -202,8 +202,8 @@ ifeq ($(gconf-target),1)
 	hostprogs-y += gconf
 endif

-clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck .tmp_gtkcheck
+clean-files	+= zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf nconf
 clean-files     += config.pot linux.pot

-- 
1.7.5.rc1




--------------090900080006000803070306
Content-Type: text/plain; name="kbuild-rearrange-clean-files.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-rearrange-clean-files.patch"

From 78e493828805822d9a9273202c18cefc042e5de8 Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 18:06:55 -0400
Subject: [PATCH 4/7] kbuild: rearrange clean-files


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/kconfig/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 74d9512..eacdefb 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -202,8 +202,8 @@ ifeq ($(gconf-target),1)
 	hostprogs-y += gconf
 endif
 
-clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck .tmp_gtkcheck
+clean-files	+= zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf nconf
 clean-files     += config.pot linux.pot
 
-- 
1.7.5.rc1



--------------090900080006000803070306--
