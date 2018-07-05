Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:60516 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753923AbeGEVae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 17:30:34 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: powerpc: 32BIT vs. 64BIT (PPC32 vs. PPC64)
Message-ID: <3f906b03-98ff-c081-4e19-b490f0b35c51@infradead.org>
Date: Thu, 5 Jul 2018 14:30:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org

Hi,

Is there a good way (or a shortcut) to do something like:

$ make ARCH=powerpc O=PPC32 [other_options] allmodconfig
  to get a PPC32/32BIT allmodconfig

and also be able to do:

$make ARCH=powerpc O=PPC64 [other_options] allmodconfig
  to get a PPC64/64BIT allmodconfig?


Note that arch/x86, arch/sh, and arch/sparc have ways to do
some flavor(s) of this (from Documentation/kbuild/kbuild.txt;
sh and sparc based on a recent "fix" patch from me):

x86: i386 for 32 bit, x86_64 for 64 bit
sh: sh for 32 bit, sh64 for 64 bit
sparc: sparc32 for 32 bit, sparc64 for 64 bit


thanks,
-- 
~Randy
