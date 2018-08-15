Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43257 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbeHORU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 13:20:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id r13-v6so1090465ljg.10
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2018 07:28:03 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/3] Kbuild: Some fixdep tweaks
Date: Wed, 15 Aug 2018 16:27:46 +0200
Message-Id: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>

These patches eliminate two (albeit tiny and shortlived) processes
from the cmd_and_fixdep rule, i.e. from every TU being
compiled. Whether the diffstat below is worth it I'll leave to Kbuild
maintainers to decide.

Rasmus Villemoes (3):
  Kbuild: refactor fixdep to use getopt()
  Kbuild: teach fixdep to optionally remove the depfile
  Kbuild: let fixdep do the renaming to .cmd

 scripts/Kbuild.include | 11 ++++------
 scripts/basic/fixdep.c | 56 ++++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 52 insertions(+), 15 deletions(-)

-- 
2.16.4
