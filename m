Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44694 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgBAGZL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 01:25:11 -0500
From: Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 0/2] Add SANITIZE_xx.o & SANITIZE and apply them to x86
Date: Sat,  1 Feb 2020 14:24:57 +0800
Message-Id: <20200201062459.7150-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>

These two patches add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
specific files, and apply them to x86 booting code.

We need to disable UBSAN for some of ealy stage code:
 o For code which could operate in one-one mapping mode. In this case,
   kernel would crash at accessing data parameter when invoking UBSAN
   handlers.
 o Since UBSAN handlers are instrumented by KASAN, so invoking UBSAN
   handlers before KASAN is initiated also is not allowed.

Changbin Du (2):
  sanitize: Add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
    specific files
  x86: Disable both KASAN and UBSAN for some booting code

 Documentation/dev-tools/kasan.rst | 12 ++++++++++++
 arch/x86/boot/Makefile            |  2 +-
 arch/x86/boot/compressed/Makefile |  2 +-
 arch/x86/entry/vdso/Makefile      |  3 +--
 arch/x86/kernel/Makefile          | 10 +++++-----
 arch/x86/lib/Makefile             |  2 +-
 arch/x86/mm/Makefile              |  4 ++--
 arch/x86/realmode/Makefile        |  2 +-
 arch/x86/realmode/rm/Makefile     |  2 +-
 scripts/Makefile.lib              |  4 ++--
 10 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.24.0
