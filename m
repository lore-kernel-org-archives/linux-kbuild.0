Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:58522 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758950Ab1DZWpo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 18:45:44 -0400
Message-ID: <4DB74AEF.7050704@verizon.net>
Date: Tue, 26 Apr 2011 18:45:03 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 2/7] kbuild: change qconf to modify hostprogs-y like nconf
 and mconf
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

This patch makes qconf more like nconf and mconf
by modifying hostprogs insted of qconf-objs. 

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/kconfig/Makefile |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fec830f..b0b3dcb 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -168,8 +168,10 @@ conf-objs	:= conf.o  zconf.tab.o
 mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
 nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
+qconf-cxxobjs	:= qconf.o
+qconf-objs	:= kconfig_load.o zconf.tab.o
 -hostprogs-y := conf qconf gconf
+hostprogs-y := conf gconf
  ifeq ($(MAKECMDGOALS),nconfig)
 	hostprogs-y += nconf
@@ -192,8 +194,7 @@ endif
   ifeq ($(qconf-target),1)
-qconf-cxxobjs	:= qconf.o
-qconf-objs	:= kconfig_load.o zconf.tab.o
+	hostprogs-y += qconf
 endif
  ifeq ($(gconf-target),1)
-- 
1.7.5.rc1

