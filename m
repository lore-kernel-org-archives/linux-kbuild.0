Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43732 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934684AbeFLAcs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jun 2018 20:32:48 -0400
Received: by mail-pf0-f195.google.com with SMTP id y8-v6so2055963pfm.10
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jun 2018 17:32:48 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv4 0/3] Salted build ids via linker sections
Date: Mon, 11 Jun 2018 17:32:21 -0700
Message-Id: <20180612003224.3658-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org


Hi,

This is v4 of the series to allow unique build ids in the kernel. As a
reminder of the context:

""
In Fedora, the debug information is packaged separately (foo-debuginfo) and
can be installed separately. There's been a long standing issue where only one
version of a debuginfo info package can be installed at a time. Mark Wielaard
made an effort for Fedora 27 to allow parallel installation of debuginfo (see
https://fedoraproject.org/wiki/Changes/ParallelInstallableDebuginfo for
more details)

Part of the requirement to allow this to work is that build ids are
unique between builds. The existing upstream rpm implementation ensures
this by re-calculating the build-id using the version and release as a
seed. This doesn't work 100% for the kernel because of the vDSO which is
its own binary and doesn't get updated. After poking holes in a few of my
ideas, there was a discussion with some people from the binutils team about
adding --build-id-salt to let ld do the calculation debugedit is doing. There
was a counter proposal made to add in the salt while building. The
easiest proposal was to add an item in the linker script vs. linking in
an object since we need the salt to go in every module as well as the
kernel and vmlinux.
""

v4 takes Linus' suggestion of using linker fill to insert the build id.
This removes the need to use a generated header which makes things much
easier. One change is that because this section isn't .comment it won't
get stripped automatically. This is pretty small but I also know people
can be picky so I'm open to opinions or suggestions here.

Laura Abbott (3):
  scripts: Preprocess module-common.lds
  kbuild: Introduce build-salt linker section and config option
  x86: Add build salt to the vDSO and kernel linker scripts

 arch/x86/entry/vdso/vdso-layout.lds.S              | 3 ++-
 arch/x86/kernel/vmlinux.lds.S                      | 1 +
 include/asm-generic/vmlinux.lds.h                  | 6 ++++++
 init/Kconfig                                       | 9 +++++++++
 scripts/.gitignore                                 | 1 +
 scripts/Makefile                                   | 2 +-
 scripts/{module-common.lds => module-common.lds.S} | 4 ++++
 7 files changed, 24 insertions(+), 2 deletions(-)
 rename scripts/{module-common.lds => module-common.lds.S} (94%)

-- 
2.18.0.rc1

