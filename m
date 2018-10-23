Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40551 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJev (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:34:51 -0400
Date: Mon, 22 Oct 2018 22:13:44 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v2 0/5] Adds -Wshadow on KBUILD_HOSTCFLAGS
Message-ID: <20181023011344.GA6836@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Changes in v2:
1- Makefile change is the last, so there is no extra warnings on building 
   intermediate commits. 
2- Replaced -Wshadow=local with -Wshadow 
3- Created macro to accept variable name instead of changing logic in 
   file2alias.c
4- Drops if/else logic change in asn1_compiler.c
5- Renames variables to meaningful names in vdso2c.h

- The previous logic in file2alias.c will be available on a separated patch

Leonardo Brás (5):
  x86/vdso: Renames variable to fix shadow warning.
  kbuild: Removes unnecessary shadowed local variable.
  Creates macro to avoid variable shadowing
  modpost: Changes parameter name to avoid shadowing.
  Adds -Wshadow on KBUILD_HOSTCFLAGS

 Makefile                     |  2 +-
 arch/x86/entry/vdso/vdso2c.h | 13 +++++++------
 scripts/asn1_compiler.c      |  2 +-
 scripts/mod/file2alias.c     | 24 +++++++++++++++++-------
 scripts/mod/modpost.c        |  4 ++--
 5 files changed, 28 insertions(+), 17 deletions(-)

-- 
2.19.1
