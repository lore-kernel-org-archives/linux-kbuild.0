Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34058 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730484AbeKEI2a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 03:28:30 -0500
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] poewrpc/Boot: Fix cross compiling with clang
Date: Mon,  5 Nov 2018 09:41:31 +1030
Message-Id: <20181104231133.30848-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Hello,

These patches allow clang to cross-compile the powerpc boot wrapper.
The boot wrapper constructs it's own compiler flags as it may not be
built for the same arch as the kernel.

The powerpc64le kernel builds natively with clang and with this patch it
can cross compile too.

Joel Stanley (2):
  Makefile: Export clang toolchain variables
  powerpc/boot: Set target when cross-compiling for clang

 Makefile                   | 3 +++
 arch/powerpc/boot/Makefile | 7 +++++++
 2 files changed, 10 insertions(+)

-- 
2.19.1
