Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml105.kpnxchange.com ([195.121.3.9]:52805 "EHLO
	CPSMTPM-EML105.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754196AbZGWS5w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 14:57:52 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH] um: minor Makefile simplification through use of cc-ifversion
Date: Thu, 23 Jul 2009 20:57:51 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907232057.51827.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: user-mode-linux-devel@lists.sourceforge.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Frans Pop <elendil@planet.nl>
---

Change was suggested by Sam Ravnborg; see http://lkml.org/lkml/2009/7/18/15.
Untested, but a similar patch for x86 was tested to work.

diff --git a/arch/um/Makefile-i386 b/arch/um/Makefile-i386
index 302cbe5..2c3e658 100644
--- a/arch/um/Makefile-i386
+++ b/arch/um/Makefile-i386
@@ -35,8 +35,9 @@ cflags-y += -ffreestanding
 # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
 # a lot more stack due to the lack of sharing of stacklots.  Also, gcc
 # 4.3.0 needs -funit-at-a-time for extern inline functions.
-KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
-			echo $(call cc-option,-fno-unit-at-a-time); \
-			else echo $(call cc-option,-funit-at-a-time); fi ;)
+KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, \
+			$(call cc-option,-fno-unit-at-a-time))
+KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0400, \
+			$(call cc-option,-funit-at-a-time))
 
 KBUILD_CFLAGS += $(cflags-y)
