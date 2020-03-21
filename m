Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:35097 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbgCUAuF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Mar 2020 20:50:05 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH RFC 0/3] x86: probe for assembler capabilities in Kconfig
Date: Fri, 20 Mar 2020 18:49:42 -0600
Message-Id: <20200321004945.451497-1-Jason@zx2c4.com>
In-Reply-To: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
References: <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, x86@kernel.org, linux-crypto@vger.kernel.org

Doing this probing inside of the Makefiles means we have a maze of
ifdefs inside the source code and child Makefiles that need to make
proper decisions on this too. Instead, we do it at Kconfig time, like
many other compiler and assembler options, which allows us to set up the
dependencies normally for full compilation units.

This patchset might have weird implications, as things have relied on
the old behavior for a long time. For example, it now means that
environment changes need for Kconfig's defaults to be triggered again. I
recently saw some patch on LKML that was doing a substring comparison on
KBUILD_CFLAGS looking for -DCONFIG_AS_SOMETHING; things like that will
have to change too.

This RFC isn't super heavily tested, and I expect problems. Let me know
what you think.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: x86@kernel.org
Cc: linux-crypto@vger.kernel.org

Jason A. Donenfeld (3):
  x86: probe assembler instead of kconfig instead of makefile
  crypto: x86 - rework configuration based on Kconfig
  crypto: curve25519 - do not pollute dispatcher based on assembler

 arch/x86/Kconfig              |   2 +
 arch/x86/Kconfig.assembler    |  36 ++++++++
 arch/x86/Makefile             |  22 -----
 arch/x86/crypto/Makefile      | 162 ++++++++++++++--------------------
 crypto/Kconfig                |  28 +++---
 drivers/gpu/drm/i915/Makefile |   3 -
 include/crypto/curve25519.h   |   6 +-
 lib/raid6/test/Makefile       |   9 --
 8 files changed, 120 insertions(+), 148 deletions(-)
 create mode 100644 arch/x86/Kconfig.assembler

-- 
2.25.1
