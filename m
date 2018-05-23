Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:38049 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbeEWATq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 May 2018 20:19:46 -0400
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so11875240plr.5
        for <linux-kbuild@vger.kernel.org>; Tue, 22 May 2018 17:19:46 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv3 0/2] Salted build ids via linker sections
Date: Tue, 22 May 2018 17:19:37 -0700
Message-Id: <20180523001939.9431-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

Hi,

This is v3 of the series to allow unique build-ids in the kernel. As
a reminder of the context:

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
was a counter proposal made about adding some extra information via a .comment
which will affect the build id calculation but just get stripped out.
""

I mentioned in the previous version that there were problems with
sporadic build failures. v3 switches to generating the linker script
directly instead of a header + a linker script to avoid this problem. I
also dropped the Kconfig completely (I can add it back as a guard if
this seems not small enough to want all the time). I've also dropped the
RFC tag since it's well formed enough at this point.

Laura Abbott (2):
  kbuild: Introduce build-salt linker script
  x86/vdso: Add build salt to the vDSO

 Makefile                     |  4 +++-
 arch/x86/entry/vdso/Makefile |  4 +++-
 scripts/.gitignore           |  1 +
 scripts/Makefile             |  9 ++++++++-
 scripts/gensalt              | 22 ++++++++++++++++++++++
 scripts/link-vmlinux.sh      |  3 ++-
 6 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100755 scripts/gensalt

-- 
2.17.0

