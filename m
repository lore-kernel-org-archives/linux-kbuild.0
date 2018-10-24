Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44471 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbeJXMaU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 08:30:20 -0400
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v3 0/5] Adds -Wshadow on KBUILD_HOSTCFLAGS and fix warnings
Date: Wed, 24 Oct 2018 01:03:49 -0300
Message-Id: <20181024040354.24879-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This patchset add -Wshadow on KBUILD_HOSTCFLAGS and fixes
all code that show this warning.

Changes in v3:
- Better Cover letter
- Better commit message for patch 1/5.
- Fixes what should change on patch 3/5
- Removes accent of my second name (better for searching at lkml.org)


v2: https://lkml.org/lkml/2018/10/23/151
v1: https://lkml.org/lkml/2018/10/17/169

Leonardo Bras (5):
  x86/vdso: Renames variable to fix shadow warning.
  kbuild: Removes unnecessary shadowed local variable.
  Creates macro to avoid variable shadowing
  modpost: Changes parameter name to avoid shadowing.
  Adds -Wshadow on KBUILD_HOSTCFLAGS

 Makefile                     |  2 +-
 arch/x86/entry/vdso/vdso2c.h | 13 +++++++------
 scripts/asn1_compiler.c      |  2 +-
 scripts/mod/file2alias.c     | 19 +++++++++++++++----
 scripts/mod/modpost.c        |  4 ++--
 5 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.19.1
