Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:43884 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933311AbeGJAqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:12 -0400
Received: by mail-qt0-f194.google.com with SMTP id f18-v6so16993298qtp.10
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:12 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
Date: Mon,  9 Jul 2018 17:45:55 -0700
Message-Id: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org


Hi,

This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
environment. The changes are mostly minor fixups requested and also
include documentation of the new options.

Laura Abbott (7):
  tools: build: Fixup host c flags
  tools: build: Use HOSTLDFLAGS with fixdep
  treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
  treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
  treewide: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
  treewide: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
  Kbuild: Use HOST*FLAGS options from the command line

 Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
 Makefile                        | 17 +++++++++--------
 arch/alpha/boot/Makefile        |  2 +-
 net/bpfilter/Makefile           |  4 ++--
 samples/bpf/Makefile            | 22 +++++++++++-----------
 samples/seccomp/Makefile        |  6 +++---
 scripts/Kbuild.include          |  2 +-
 scripts/Makefile                |  4 ++--
 scripts/Makefile.host           | 24 ++++++++++++------------
 scripts/kconfig/Makefile        | 10 +++++-----
 tools/build/Build.include       |  2 +-
 tools/build/Makefile            |  2 +-
 tools/objtool/Makefile          |  4 ++--
 tools/perf/pmu-events/Build     |  2 +-
 14 files changed, 67 insertions(+), 50 deletions(-)

-- 
2.17.1

