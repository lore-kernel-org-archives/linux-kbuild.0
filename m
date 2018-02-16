Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:54197 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbeBPVlj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 16:41:39 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] fixing the last failures in randconfig builds
Date: Fri, 16 Feb 2018 22:41:10 +0100
Message-Id: <20180216214117.1947175-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

I've recently done some build testing on 4.14-stable and to my surprise
found only a handful of bugfixes were required to build all x86 and arm64
randconfig output without any warnings using gcc-7.2.1. I have submitted
the remaining trivial patches now, and this is the non-trivial remaining
part, where we turn off some options that are known to cause problems in
randconfig builds.

While I've carried the same patches in my randconfig test tree for a long
time, I wasn't entirely sure about my approach and never submitted them
for inclusion. Now that this is literally all that is remains, I'd like
to propose all three for inclusion.

If someone has another idea for how to address these, that's fine with
me as well, as long as we can make sure at least COMPILE_TEST is enabled
for randconfig builds by default (everything else can be derived from that
if necessary).

Note that the 4.15 release has a couple of build-time regressions that I
have sent bugfixes for but that so far have not made it in, and 4.16-rc
still has a number of other issues without patches.

       Arnd

Arnd Bergmann (3):
  Kconfig: disable PROFILE_ALL_BRANCHES for compile testing
  Kconfig: improve handling for all{rand,yes,no,}.config fragments
  Kconfig: add a default allrandom.config

 kernel/configs/allrandom.config |  6 ++++++
 kernel/trace/Kconfig            |  1 +
 scripts/kconfig/conf.c          | 27 +++++++++++++++++++--------
 3 files changed, 26 insertions(+), 8 deletions(-)
 create mode 100644 kernel/configs/allrandom.config

-- 
2.9.0

