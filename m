Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38351 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdJEMCp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 08:02:45 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 0/3] kconfig: Make 'm' safe before modules symbol is defined
Date: Thu,  5 Oct 2017 14:01:12 +0200
Message-Id: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, mmarek@suse.com, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Hello,

This patchset fixes a segfault that occurs if 'm' appears in certain
expressions before the modules symbol is defined. The problem is that m is
rewritten to m && <modules symbol> already during parsing. Doing it in
menu_finalize(), which runs after parsing, fixes the problem.

To aid the review and people trying to understand menu_finalize() in the future
(including me), it also renames menu_check_dep() to rewrite_m() and adds
comments to clarify the existing expression rewriting and dependency
propagation logic.

The changes have been tested for regressions using zconfdump(), Kconfiglib, and
Valgrind.

Cheers,
Ulf

Ulf Magnusson (3):
  kconfig: Rename menu_check_dep() to rewrite_m()
  kconfig: Clarify expression rewriting
  kconfig: Clean up modules handling and fix crash

 scripts/kconfig/menu.c | 74 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 8 deletions(-)

-- 
2.7.4

