Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43521 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfG1PLt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 11:11:49 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Jul 2019 00:10:55 +0900
Message-ID: <CAK7LNATrjXdeMmptd0xRJwXexe_iJwJAUvEf0jQTaLkjWkaKfw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc2
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: masahiroy@kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull some Kbuild fixes.
Thanks!


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3

for you to fetch changes up to b25e8a23d4ea7e8ade2c349c22efe88da88c0988:

  kbuild: remove unused single-used-m (2019-07-27 12:18:19 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3

 - add compile_commands.json to .gitignore

 - fix false-positive warning from gen_compile_commands.py after
   allnoconfig build

 - remove unused code

----------------------------------------------------------------
Masahiro Yamada (3):
      kbuild: remove unused objectify macro
      gen_compile_commands: lower the entry count threshold
      kbuild: remove unused single-used-m

Toru Komatsu (1):
      .gitignore: Add compilation database file

 .gitignore                      | 3 +++
 scripts/Kbuild.include          | 3 ---
 scripts/Makefile.lib            | 2 --
 scripts/gen_compile_commands.py | 4 ++--
 4 files changed, 5 insertions(+), 7 deletions(-)


-- 
Best Regards
Masahiro Yamada
