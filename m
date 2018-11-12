Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43362 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbeKLOMu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 09:12:50 -0500
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 0/2] powerpc/boot: Fix cross compiling with clang
Date: Mon, 12 Nov 2018 14:51:14 +1030
Message-Id: <20181112042116.5271-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Marek <michal.lkml@markovi.net>, Daniel Axtens <dja@axtens.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

v2: rebase on "kbuild: consolidate Clang compiler flags"

These patches allow clang to cross-compile the powerpc boot wrapper.
The boot wrapper constructs it's own compiler flags as it may not be
built for the same arch as the kernel.

The powerpc64le kernel builds natively with clang and with this patch it
can cross compile too.

Joel Stanley (2):
  Makefile: Export clang toolchain variables
  powerpc/boot: Set target when cross-compiling for clang

 Makefile                   | 1 +
 arch/powerpc/boot/Makefile | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.19.1
