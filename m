Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:43506 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbcDBTjC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Apr 2016 15:39:02 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH v2] kbuild: forbid kernel directory to contain spaces and colons
Date: Sat,  2 Apr 2016 21:38:53 +0200
Message-Id: <1459625933-20677-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>

When the kernel path contains a space or a colon somewhere in the path
name, the modules_install target doesn't work anymore, as the path names
are not enclosed in double quotes. It is also supposed that and O= build
will suffer from the same weakness as modules_install.

Instead of checking and improving kbuild to resist to directories
including these characters, error out early to prevent any build if the
kernel's main directory contains a space.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v1: add colon check as requested by Michal.
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 916b26e999d8..42e01dab13e7 100644
--- a/Makefile
+++ b/Makefile
@@ -128,6 +128,10 @@ _all:
 # Cancel implicit rules on top Makefile
 $(CURDIR)/Makefile Makefile: ;
 
+ifneq ($(words $(subst :, ,$(CURDIR))), 1)
+  $(error main directory cannot contain spaces nor colons)
+endif
+
 ifneq ($(KBUILD_OUTPUT),)
 # Invoke a second make in the output directory, passing relevant variables
 # check that the output directory actually exists
-- 
2.1.4

