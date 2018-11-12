Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex13-edg-ou-002.vmware.com ([208.91.0.190]:18537 "EHLO
        EX13-EDG-OU-002.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728030AbeKMIaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 03:30:13 -0500
From: Nadav Amit <namit@vmware.com>
Subject: [PATCH 0/2] x86: Asm macros fixes
Date: Mon, 12 Nov 2018 07:02:13 -0800
Message-ID: <20181112150215.508-1-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>

There has been a complaint that the recent use of assembly macros in C
files broke distcc. The first patch fixes this issue.

The second patch adds a dependency for all C files on macros.S, to
trigger their recompilation when the relevant macros change.

Nadav Amit (2):
  Makefile: Fix distcc compilation with x86 macros
  x86: set a dependency on macros.S

 Makefile               |  4 +++-
 arch/x86/Makefile      |  7 +++++--
 scripts/Makefile.build | 33 +++++++++++++++++++++++++++++----
 3 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.17.1
