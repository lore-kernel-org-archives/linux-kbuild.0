Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:42825 "EHLO
        EX13-EDG-OU-001.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726892AbeKOOHE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 09:07:04 -0500
From: Nadav Amit <namit@vmware.com>
Subject: [PATCH v2 0/2] x86: Asm macros fixes
Date: Wed, 14 Nov 2018 12:43:07 -0800
Message-ID: <20181114204309.18645-1-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>

There has been a complaint that the recent use of assembly macros in C
files broke distcc. The first patch fixes this issue.

The second patch adds a dependency for all C files on macros.S, to
trigger their recompilation when the relevant macros change.

I think it will be better to get the patches through tip. Please advise
if you disagree.

v1->v2:
* Remove whitespaces [Ingo]
* Automatically enable split compilation when distcc or icecc are used

Nadav Amit (2):
  Makefile: Fix distcc compilation with x86 macros
  x86: set a dependency on macros.S

 Makefile               |  4 +++-
 arch/x86/Makefile      |  7 +++++--
 scripts/Makefile.build | 34 ++++++++++++++++++++++++++++++----
 3 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.17.1
