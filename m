Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:59713 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfAKDX5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jan 2019 22:23:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] powerpc: some header search path cleanups
Date: Fri, 11 Jan 2019 12:22:30 +0900
Message-Id: <1547176954-17739-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Mackerras <paulus@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>

I am trying to get rid of crappy magic from Kbuild core makefiles.

Before that, I want to drop as many useless paths as possible.
Actually, many Makefiles are adding around pointless options.

This series cleans some powerpc Makefiles.
(only compile-tested by 0day bot)



Masahiro Yamada (3):
  KVM: powerpc: remove -I. header search paths
  powerpc: remove redundant header search path additions
  powerpc: math-emu: remove unneeded header search paths

 arch/powerpc/Makefile          | 4 ++--
 arch/powerpc/kvm/Makefile      | 5 -----
 arch/powerpc/math-emu/Makefile | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.7.4
