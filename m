Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:37506 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753672AbeGGBHY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:24 -0400
Received: by mail-qt0-f196.google.com with SMTP id a18-v6so11403886qtj.4
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:24 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment (new approach)
Date: Fri,  6 Jul 2018 18:07:02 -0700
Message-Id: <20180707010709.16648-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

Hi,

This is a follow up from
lkml.kernel.org/r/<20180329004805.7278-1-labbott@redhat.com> . I was
pointed to a previous suggestion (https://lkml.org/lkml/2018/2/28/178)
to rename the variables for better namespacing. I hadn't seen anyone
follow up so this is a series to do just that. I split up the rename by
variable for ease of review. This was mostly just a pretty
straight-forward search and replace. I intentionally didn't Cc all the
outside maintainers on the rename because I wanted to make sure this
approach was correct before bothering people.

This series also includes two other issuse I found to finally have all
the generated files pick up the host flags. The first seems to be a typo
of CHOSTFLAGS instead of HOSTCFLAGS. The second is a missing HOSTLDFLAGS
when linking fixdep. I put these two separately in case there was
interest in picking them up for stable.

For the interested, the full command line I've been testing with:

HOSTCFLAGS="-O2 -g -pipe -Wall -Werror=format-security
-Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions
-fstack-protector-strong -grecord-gcc-switches
-specs=/usr/lib/rpm/redhat/redhat-hardened-cc1
-specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic
-fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection"

HOSTLDFLAGS="-Wl,-z,relro -Wl,-z,now
-specs=/usr/lib/rpm/redhat/redhat-hardened-ld"

Thanks,
Laura

Laura Abbott (7):
  tools: build: Fixup host c flags
  tools: build: Use HOSTLDFLAGS with fixdep
  treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
  treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
  treewide: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
  treewide: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
  Kbuild: Use HOST*FLAGS options from the command line

 Makefile                   | 17 +++++++++--------
 arch/alpha/boot/Makefile   |  2 +-
 arch/s390/tools/Makefile   |  4 ++--
 arch/x86/tools/Makefile    |  4 ++--
 net/bpfilter/Makefile      |  4 ++--
 samples/bpf/Makefile       | 28 ++++++++++++++--------------
 samples/connector/Makefile |  2 +-
 samples/hidraw/Makefile    |  2 +-
 samples/seccomp/Makefile   | 24 ++++++++++++------------
 samples/statx/Makefile     |  2 +-
 samples/uhid/Makefile      |  2 +-
 scripts/Kbuild.include     |  2 +-
 scripts/Makefile           |  4 ++--
 scripts/Makefile.host      | 28 ++++++++++++++--------------
 scripts/dtc/Makefile       | 24 ++++++++++++------------
 scripts/genksyms/Makefile  |  4 ++--
 scripts/kconfig/Makefile   | 14 +++++++-------
 tools/build/Build.include  |  2 +-
 tools/build/Makefile       |  2 +-
 tools/objtool/Makefile     |  4 ++--
 20 files changed, 88 insertions(+), 87 deletions(-)

-- 
2.17.1

