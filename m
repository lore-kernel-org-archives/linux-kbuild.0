Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:23929 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750777AbdKIPm5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 10:42:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/4] kbuild: remove redundant $(wildcard ...) for cmd_files calculation
Date: Fri, 10 Nov 2017 00:41:15 +0900
Message-Id: <1510242077-8122-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

I do not why $(wildcard ...) needs to be called twice for computing
cmd_files.  Remove the first one.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                     | 3 +--
 scripts/Makefile.build       | 3 +--
 scripts/Makefile.headersinst | 3 +--
 scripts/Makefile.modpost     | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index a7476e6..58dd245 100644
--- a/Makefile
+++ b/Makefile
@@ -1693,8 +1693,7 @@ cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
 
 # read all saved command lines
 
-targets := $(wildcard $(sort $(targets)))
-cmd_files := $(wildcard .*.cmd $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
+cmd_files := $(wildcard .*.cmd $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
 
 ifneq ($(cmd_files),)
   $(cmd_files): ;	# Do not try to update included dependency files
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 061d0c3..62d5314 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -583,8 +583,7 @@ FORCE:
 # optimization, we don't need to read them if the target does not
 # exist, we will rebuild anyway in that case.
 
-targets := $(wildcard $(sort $(targets)))
-cmd_files := $(wildcard $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
+cmd_files := $(wildcard $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
 
 ifneq ($(cmd_files),)
   include $(cmd_files)
diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 5692d7a..2aa9181 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -114,9 +114,8 @@ $(check-file): scripts/headers_check.pl $(output-files) FORCE
 
 endif
 
-targets := $(wildcard $(sort $(targets)))
 cmd_files := $(wildcard \
-             $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
+             $(foreach f,$(sort $$(targets)),$(dir $(f)).$(notdir $(f)).cmd))
 
 ifneq ($(cmd_files),)
 	include $(cmd_files)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 16923ba..cf125c1 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -143,8 +143,7 @@ FORCE:
 # optimization, we don't need to read them if the target does not
 # exist, we will rebuild anyway in that case.
 
-targets := $(wildcard $(sort $(targets)))
-cmd_files := $(wildcard $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
+cmd_files := $(wildcard $(foreach f,$(sort $(targets)),$(dir $(f)).$(notdir $(f)).cmd))
 
 ifneq ($(cmd_files),)
   include $(cmd_files)
-- 
2.7.4

