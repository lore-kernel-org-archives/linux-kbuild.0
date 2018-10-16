Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:57575 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeJPRBh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 13:01:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] kbuild: add scripts/Makefile.toolcheck to check necessary host tools
Date: Tue, 16 Oct 2018 18:10:50 +0900
Message-Id: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org


I wrote this patch set to cater to some reports:

 - Bernd Edlinger reports false positive check of libelf
   once CONFIG_UNWINDER_ORC is enabled.
   https://lore.kernel.org/patchwork/patch/960411/

 - Borislav Petkov reports the build fails very late
   if CONFIG_KERNEL_LZ4 is enabled but lz4 is missing.
   https://patchwork.kernel.org/patch/10635381/

From the discussion
https://patchwork.kernel.org/patch/10516049/
people like to see a build error when some host tools
are missing.

So, we need to check host tools in makefiles.
(Or, do not check at all. The build will fail anyway,
but the error message might not be clear enough in some cases.)

A problem is people check host tools
in random places in the top Makefile.
This does not work because the top Makefile is parsed twice
when the include/config/auto.config is updated.
Once with a stale auto.config, and once again with a
new auto.conf.
This will cause false positive build error.

One solution is to provide a systematic way to
do host-tool checks.

I added small macros in scripts/Makefile.toolcheck
to describe tool checks in a Kbuild-ish taste.


Masahiro Yamada (3):
  kbuild: provide a new place to check necessary host tools
  objtool: move libelf check out of top Makefile
  kbuild: check the presence of lzo and lz4 tools when necessary

 Makefile                   | 22 ++++-----------------
 scripts/Makefile.build     |  2 --
 scripts/Makefile.toolcheck | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 20 deletions(-)
 create mode 100644 scripts/Makefile.toolcheck

-- 
2.7.4
