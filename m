Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:25679 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbdKIPo3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 10:44:29 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/4] kbuild: optimize output directory creation
Date: Fri, 10 Nov 2017 00:41:13 +0900
Message-Id: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>


I looked into the build scripts, focusing on "mkdir" optimization.

With this series, I succeeded in speeding up the incremental build
with O= option.

The following is the result of "time make O=foo",
where "foo" is the output directory that has already been built.

Before:

real	0m8.322s
user	0m4.324s
sys	0m1.220s

After:

real	0m6.989s
user	0m4.168s
sys	0m1.080s

3/4 gave the biggest impact.



Masahiro Yamada (4):
  kbuild: create directory for make cache only when necessary
  kbuild: remove redundant $(wildcard ...) for cmd_files calculation
  kbuild: create object directories simpler and faster
  kbuild: optimize object directory creation for incremental build

 Makefile                     |  3 +--
 arch/x86/entry/vdso/Makefile |  4 ----
 scripts/Kbuild.include       | 13 +++++++++----
 scripts/Makefile.build       | 23 ++++++++++++-----------
 scripts/Makefile.headersinst |  3 +--
 scripts/Makefile.host        | 11 -----------
 scripts/Makefile.lib         |  5 -----
 scripts/Makefile.modpost     |  3 +--
 8 files changed, 24 insertions(+), 41 deletions(-)

-- 
2.7.4

