Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54832 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbeJKXB3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 19:01:29 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Oct 2018 00:32:55 +0900
Message-ID: <CAK7LNAQHYH-SM+fZ0PkLYYCpeHZ-yYDKQpFeJKb7BCR7LtCr0A@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v4.19-rc8
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Greg,

Please pull a couple of Kbuild fixes.

Thanks.



The following changes since commit 11da3a7f84f19c26da6f86af878298694ede0804:

  Linux 4.19-rc3 (2018-09-09 17:26:43 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v4.19-2

for you to fetch changes up to 5318321d367c21ca1fe9eb00caefc239c938750a:

  samples: disable CONFIG_SAMPLES for UML (2018-10-11 02:15:46 +0900)

----------------------------------------------------------------
Kbuild fixes for v4.19 (2nd)

 - Fix warnings from recordmcount.pl when building with Clang

 - Allow Clang to use GNU toolchains correctly

 - Disable CONFIG_SAMPLES for UML to avoid build error

----------------------------------------------------------------
Joel Stanley (1):
      ftrace: Build with CPPFLAGS to get -Qunused-arguments

Masahiro Yamada (1):
      samples: disable CONFIG_SAMPLES for UML

Stefan Agner (1):
      kbuild: allow to use GCC toolchain not in Clang search path

 Makefile               | 8 +++++---
 samples/Kconfig        | 1 +
 scripts/Makefile.build | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)




-- 
Best Regards
Masahiro Yamada
