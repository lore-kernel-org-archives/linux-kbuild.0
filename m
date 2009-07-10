Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml107.kpnxchange.com ([195.121.3.11]:58948 "EHLO
	CPSMTPM-EML107.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752302AbZGJUFv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Jul 2009 16:05:51 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH,v2] Only add '-fwrapv' to gcc CFLAGS for gcc 4.2 and later
Date: Fri, 10 Jul 2009 22:05:47 +0200
References: <200907100928.07369.elendil@planet.nl>
In-Reply-To: <200907100928.07369.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907102205.49642.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org, barryn@pobox.com, bugme-daemon@bugzilla.kernel.org

On Friday 10 July 2009, Frans Pop wrote:
> The discussion on issue looks to have died, but it has bitten Debian
> stable ("Lenny") [1] as it causes init to die on s390 after a kernel
> update.
>
> Here's a possible patch. The exact gcc version to check for is still a
> bit open I guess. For the s390 issue I've confirmed that 4.2.4 is OK,
> but for safety and because of Andrew's comment above I've set the test
> for 4.3 in the patch.

Here's an updated patch as I found the gcc version check was incorrect 
(0430 should have been 0403; sorry).

I've now changed the check to allow -fwrapv for gcc 4.2 as that has been 
shown to work and because of the consideration mentioned in my previous 
mail.

---
From: Frans Pop <elendil@planet.nl>
Subject: Only add '-fwrapv' to gcc CFLAGS for gcc 4.2 and later

This flag has been shown to cause init to segfault for kernels
compiled with gcc-4.1. gcc version 4.2.4 has been shown to be OK.

This fixes http://bugzilla.kernel.org/show_bug.cgi?id=13012.

Reported-by: Barry K. Nathan <barryn@pobox.com>
Signed-off-by: Frans Pop <elendil@planet.nl>

diff --git a/Makefile b/Makefile
index 0aeec59..2519fde 100644
--- a/Makefile
+++ b/Makefile
@@ -565,7 +565,8 @@ KBUILD_CFLAGS += $(call 
cc-option,-Wdeclaration-after-statement,)
 KBUILD_CFLAGS += $(call cc-option,-Wno-pointer-sign,)
 
 # disable invalid "can't wrap" optimizations for signed / pointers
-KBUILD_CFLAGS	+= $(call cc-option,-fwrapv)
+KBUILD_CFLAGS  += $(shell if [ $(call cc-version) -ge 0402 ]; then \
+		    echo $(call cc-option,-fwrapv); fi ;)
 
 # revert to pre-gcc-4.4 behaviour of .eh_frame
 KBUILD_CFLAGS	+= $(call cc-option,-fno-dwarf2-cfi-asm)
