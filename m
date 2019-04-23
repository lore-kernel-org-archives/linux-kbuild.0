Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39356 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfDWTtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Apr 2019 15:49:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id e92so6243041plb.6
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2019 12:49:31 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v3 0/3] Refactor memory initialization hardening
Date: Tue, 23 Apr 2019 12:49:22 -0700
Message-Id: <20190423194925.32151-1-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, Alexander Popov <alex.popov@linux.com>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Emese Revfy <re.emese@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-security-module <linux-security-module@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

This refactors the stack memory initialization configs in order to
keep things together when adding Clang stack initialization, and in
preparation for future heap memory initialization configs.

I intend to carry this in the gcc-plugins tree, but I'd really like
to get Acks from Masahiro (Kconfig changes, Makefile change), and
from James (adding the new Kconfig.hardening to security/Kconfig).

Thanks!

-Kees

v3:
- clean up menu/if with a merged "depends on" (masahiro)
- add CONFIG_COMPILE_TEST defaults (masahiro)

v2:
- add plugin menu (masahiro)
- adjust patch subject prefixes (masahiro)
- drop redundent "depends" (masahiro)
- fixed early use of CC_HAS_AUTO_VAR_INIT (masahiro)
- dropped default-enabled for STACK_INIT_ALL (masahiro)


Kees Cook (3):
  security: Create "kernel hardening" config area
  security: Move stackleak config to Kconfig.hardening
  security: Implement Clang's stack initialization

 Makefile                    |   5 ++
 scripts/gcc-plugins/Kconfig | 126 ++-------------------------
 security/Kconfig            |   2 +
 security/Kconfig.hardening  | 164 ++++++++++++++++++++++++++++++++++++
 4 files changed, 177 insertions(+), 120 deletions(-)
 create mode 100644 security/Kconfig.hardening

-- 
2.17.1
