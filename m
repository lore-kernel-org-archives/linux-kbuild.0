Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.231]:20830 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756661AbYE0SOc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 May 2008 14:14:32 -0400
Received: by rv-out-0506.google.com with SMTP id l9so3066628rvb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2008 11:14:31 -0700 (PDT)
Message-ID: <19f34abd0805271114o70f62d6gdf2f37109364a86@mail.gmail.com>
Date: Tue, 27 May 2008 20:14:31 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: 'make arch/x86/' fails
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>

Hi,

I don't know if this is a regression or what (I've observed it for a
while), but now I thought I'd let you know about it:

$ make arch/x86/
  CHK     include/linux/version.h
  CHK     include/linux/utsrelease.h
  CC      kernel/bounds.s
  GEN     include/linux/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  GEN     include/asm-x86/asm-offsets.h
  CALL    scripts/checksyscalls.sh
[...]/linux-2.6/arch/x86/Makefile:37: *** Recursive variable
`KBUILD_CFLAGS' references itself (eventually).  Stop.
make: *** [arch/x86/] Error 2

Are there any work-arounds or easy fixes for this? Thanks.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
