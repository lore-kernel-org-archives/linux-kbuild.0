Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:55526 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754037AbaHGH64 convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:2:1>);
	Thu, 7 Aug 2014 03:58:56 -0400
Message-Id: <53E34DDC020000780002A045@mail.emea.novell.com>
Date: Thu, 07 Aug 2014 08:58:52 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: firmware: fix build of external firmware
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

It looks like commit 5180d5f483 ("firmware: Simplify directory
creation") uncovered a latent bug: The cmd_fwbin make macro, which is
being called without any arguments, referenced argument 2, which I
suppose previously just happened to be set to the right value (from an
enclosing macro invocation - some make versions don't always properly
clear unused macro arguments on nested macro invocations). In 3.16 with
such make versions it now points into the source tree instead,
resulting in build failure when building outside the source tree. And
obviously on make versions properly clearing unused arguments it would
have resolved to empty.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/firmware/Makefile
+++ b/firmware/Makefile
@@ -159,7 +159,7 @@ quiet_cmd_fwbin = MK_FW   $@
 		  echo "    .section .rodata"				>>$@;\
 		  echo "    .p2align $${ASM_ALIGN}"			>>$@;\
 		  echo "_fw_$${FWSTR}_bin:"				>>$@;\
-		  echo "    .incbin \"$(2)\""				>>$@;\
+		  echo "    .incbin \"$(obj)/$$FWNAME\""		>>$@;\
 		  echo "_fw_end:"					>>$@;\
 		  echo "   .section .rodata.str,\"aMS\",$${PROGBITS},1"	>>$@;\
 		  echo "    .p2align $${ASM_ALIGN}"			>>$@;\



