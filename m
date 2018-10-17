Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:35019 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeJQIAW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 04:00:22 -0400
Date: Tue, 16 Oct 2018 21:07:22 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH 0/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Message-ID: <20181017000722.GA20892@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

This patchset add -Wshadow=local on KBUILD_HOSTCFLAGS and fixes 
all code that show this warning.

The third patch was already submitted, but was not merged yet.
I like to think it's part of this patchset, but if it was 
already merged, please ignore it.

Leonardo Brás (4):
  Adds -Wshadow=local on KBUILD_HOSTCFLAGS
  Renames variable to fix shadow warning.
  kbuild: Removes unnecessary shadowed local variable and optimize
    testing.
  Changes macro usage to avoid shadowing a variable.

 Makefile                     |  2 +-
 arch/x86/entry/vdso/vdso2c.h |  4 ++--
 scripts/asn1_compiler.c      |  7 +++----
 scripts/mod/file2alias.c     | 14 ++++++++------
 4 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.19.1
