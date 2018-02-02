Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:53988 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751651AbeBBQQI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:16:08 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/7] LTO: hacks to build LTO-enabled randconfig kernels
Date: Fri,  2 Feb 2018 17:15:38 +0100
Message-Id: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Nicolas Pitre <nico@linaro.org>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

This is a set of patches that I used for build-testing, resulting
in a successful build without warnings when combining
https://github.com/andikleen/linux-misc#lto-415-2 with the
latest linux-next.

I sent out all bug fixes that I had a good feeling about, this
series is basically crap, but it does the job for me. I'm posting
it for documentation purposes mainly, so we know what some of
the remaining issues are, and so people can google for the
error messages when they run into the same issues.

Arnd Bergmann (7):
  [HACK] lto: make config.gz symbol visible
  [HACK] x86: lto: always link in library files
  [HACK] x86: crypto: fix link error with LTO
  [HACK] lto: shut up some warnings
  [HACK] avoid gcc-8 ICE on LTO
  Kbuild: lto: clean build artifacts
  Kbuild: lto: pass -m32/-m64 to to LDFINAL

 Makefile                   |  2 +-
 arch/x86/Makefile          |  2 ++
 arch/x86/crypto/aes_glue.c |  5 +++++
 arch/x86/lib/Makefile      | 39 ++++++++++++++++++++-------------------
 kernel/Makefile            |  2 +-
 net/sctp/sm_sideeffect.c   |  2 +-
 scripts/Makefile.lto       |  2 +-
 scripts/kallsyms.c         |  2 +-
 scripts/link-vmlinux.sh    |  4 +++-
 scripts/mod/modpost.c      |  4 ++++
 10 files changed, 39 insertions(+), 25 deletions(-)

-- 
2.9.0

