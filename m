Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:55350 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752434AbZGWS5U (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Jul 2009 14:57:20 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH] powerpc: minor Makefile simplification through use of cc-ifversion
Date: Thu, 23 Jul 2009 20:57:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907232057.19942.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: benh@kernel.crashing.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Signed-off-by: Frans Pop <elendil@planet.nl>
---

Change was suggested by Sam Ravnborg; see http://lkml.org/lkml/2009/7/18/15.
Untested.

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bc35f4e..952a396 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -77,7 +77,7 @@ CPP		= $(CC) -E $(KBUILD_CFLAGS)
 CHECKFLAGS	+= -m$(CONFIG_WORD_SIZE) -D__powerpc__ -D__powerpc$(CONFIG_WORD_SIZE)__
 
 ifeq ($(CONFIG_PPC64),y)
-GCC_BROKEN_VEC	:= $(shell if [ $(call cc-version) -lt 0400 ] ; then echo "y"; fi)
+GCC_BROKEN_VEC	:= $(call cc-ifversion, -lt, 0400, y)
 
 ifeq ($(CONFIG_POWER4_ONLY),y)
 ifeq ($(CONFIG_ALTIVEC),y)
