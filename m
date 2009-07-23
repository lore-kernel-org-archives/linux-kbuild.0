Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml107.kpnxchange.com ([195.121.3.11]:57411 "EHLO
	CPSMTPM-EML107.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752434AbZGWS43 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 14:56:29 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH] x86: minor Makefile simplification through use of cc-ifversion
Date: Thu, 23 Jul 2009 20:56:27 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907232056.28635.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, x86@kernel.org

Signed-off-by: Frans Pop <elendil@planet.nl>
---

Change was suggested by Sam Ravnborg; see http://lkml.org/lkml/2009/7/18/15.
Tested to work correctly.

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1b68659..1f3851a 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -32,8 +32,8 @@ ifeq ($(CONFIG_X86_32),y)
 
         # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
         # a lot more stack due to the lack of sharing of stacklots:
-        KBUILD_CFLAGS += $(shell if [ $(call cc-version) -lt 0400 ] ; then \
-                echo $(call cc-option,-fno-unit-at-a-time); fi ;)
+        KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0400, \
+				$(call cc-option,-fno-unit-at-a-time))
 
         # CPU-specific tuning. Anything which can be shared with UML should go here.
         include $(srctree)/arch/x86/Makefile_32.cpu
