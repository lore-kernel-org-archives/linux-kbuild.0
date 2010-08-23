Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:53195 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab0HWAFY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 22 Aug 2010 20:05:24 -0400
Received: by gxk23 with SMTP id 23so1881934gxk.19
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Aug 2010 17:05:23 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kbuild: don't overwrite HOST_EXTRACFLAGS
Date: Sun, 22 Aug 2010 20:03:06 -0400
Message-Id: <1282521786-26699-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com>
References: <AANLkTindfnx2htJ--AjyMsKatjkAfXmH+po3pGz6DmfD@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

These might be used by the user to specify extra arguments for the host
compiler.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7d129f0..051eba2 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -145,10 +145,8 @@ check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
 
 # Use recursively expanded variables so we do not call gcc unless
 # we really need to do so. (Do not call gcc as part of make mrproper)
-HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
-
-HOST_EXTRACFLAGS += -DLOCALE
-
+HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
+                    -DLOCALE
 
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
-- 
1.7.2.30.gc37d7.dirty

