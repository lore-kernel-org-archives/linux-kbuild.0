Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:35556 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754058AbdCQAZO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Mar 2017 20:25:14 -0400
Received: by mail-pg0-f45.google.com with SMTP id b129so32622152pgc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Mar 2017 17:25:13 -0700 (PDT)
From: Michael Davidson <md@google.com>
Subject: [PATCH 0/7] LLVM: make x86_64 kernel build with clang.
Date: Thu, 16 Mar 2017 17:15:13 -0700
Message-Id: <20170317001520.85223-1-md@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Kaehlcke <mka@chromium.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org, Michael Davidson <md@google.com>

This patch set is sufficient to get the x86_64 kernel to build
and boot correctly with clang-3.8 or greater.

The resulting build still has about 300 warnings, very few of
which appear to be significant. Most of them should be fixable
with some minor code refactoring although a few of them, such
as the complaints about implict conversions between enumerated
types may be candidates for just being disabled.

Michael Davidson (7):
  Makefile, LLVM: add -no-integrated-as to KBUILD_[AC]FLAGS
  Makefile, x86, LLVM: disable unsupported optimization flags
  x86, LLVM: suppress clang warnings about unaligned accesses
  x86, boot, LLVM: #undef memcpy etc in string.c
  x86, boot, LLVM: Use regparm=0 for memcpy and memset
  md/raid10, LLVM: get rid of variable length array
  crypto, x86, LLVM: aesni - fix token pasting

 Makefile                                |  4 ++++
 arch/x86/Makefile                       |  7 +++++++
 arch/x86/boot/copy.S                    | 15 +++++++++++++--
 arch/x86/boot/string.c                  |  9 +++++++++
 arch/x86/boot/string.h                  | 13 +++++++++++++
 arch/x86/crypto/aes_ctrby8_avx-x86_64.S |  7 ++-----
 drivers/md/raid10.c                     |  9 ++++-----
 7 files changed, 52 insertions(+), 12 deletions(-)

-- 
2.12.0.367.g23dc2f6d3c-goog

