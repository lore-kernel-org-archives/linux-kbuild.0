Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60736 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731635AbfFGPxo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 11:53:44 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 8 Jun 2019 00:52:56 +0900
Message-ID: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.2-rc4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.



The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.2-2

for you to fetch changes up to 913ab9780fc021298949cc5514d6255a008e69f9:

  kbuild: use more portable 'command -v' for cc-cross-prefix
(2019-06-08 00:38:47 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.2 (2nd)

 - fix kselftest-merge to find config fragments in deeper directories

 - fix kconfig unit test, which was broken by SPDX tag addition

 - add + prefix to buildtar to suppress jobserver unavailable warning

 - fix checkstack.pl to recognize arch=arm64

 - suppress noisy warning from cc-cross-prefix

----------------------------------------------------------------
Dan Rue (1):
      kbuild: teach kselftest-merge to find nested config files

George G. Davis (1):
      scripts/checkstack.pl: Fix arm64 wrong or unknown architecture

Masahiro Yamada (2):
      kconfig: tests: fix recursive inclusion unit test
      kbuild: use more portable 'command -v' for cc-cross-prefix

Trevor Bourget (1):
      kbuild: tar-pkg: enable communication with jobserver

 Makefile                                                | 5 ++---
 scripts/Kbuild.include                                  | 7 ++++++-
 scripts/checkstack.pl                                   | 2 +-
 scripts/kconfig/tests/err_recursive_inc/expected_stderr | 6 +++---
 scripts/package/Makefile                                | 2 +-
 5 files changed, 13 insertions(+), 9 deletions(-)


-- 
Best Regards
Masahiro Yamada
