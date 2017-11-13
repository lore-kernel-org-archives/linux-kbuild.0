Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:43168 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752632AbdKMKdB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:33:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/6] kbuild: optimize output directory creation
Date: Mon, 13 Nov 2017 19:29:33 +0900
Message-Id: <1510568979-24440-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>


I looked into the build scripts, focusing on "mkdir" optimization.

With this series, I succeeded in speeding up the incremental build
with O= option.

The following is the result of "time make O=foo",
where "foo" is the output directory that has already been built.

Before:

real    0m8.322s
user    0m4.324s
sys     0m1.220s

After:

real    0m6.989s
user    0m4.168s
sys     0m1.080s

4/6 gave the biggest impact.



Masahiro Yamada (6):
  kbuild: create directory for make cache only when necessary
  kbuild: remove redundant $(wildcard ...) for cmd_files calculation
  kbuild: filter-out PHONY targets from "targets"
  kbuild: create object directories simpler and faster
  kbuild: optimize object directory creation for incremental build
  kbuild: remove redundant mkdir from ./Kbuild

 Kbuild                       |  2 --
 Makefile                     |  3 +--
 arch/x86/entry/vdso/Makefile |  4 ----
 scripts/Kbuild.include       | 13 +++++++++----
 scripts/Makefile.build       | 25 +++++++++++++------------
 scripts/Makefile.headersinst |  3 +--
 scripts/Makefile.host        | 12 ------------
 scripts/Makefile.lib         |  5 -----
 scripts/Makefile.modpost     |  3 +--
 9 files changed, 25 insertions(+), 45 deletions(-)

-- 
2.7.4

