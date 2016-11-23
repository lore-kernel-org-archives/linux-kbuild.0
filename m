Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35071 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933872AbcKWQl5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:41:57 -0500
Received: by mail-pg0-f67.google.com with SMTP id p66so1430213pga.2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:41:57 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 0/7] kbuild patches for 4.10
Date: Thu, 24 Nov 2016 03:41:36 +1100
Message-Id: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

Hi,

I have a few various kbuild patches for review and  consideration
for 4.10 branch that did not make 4.9. All of these except the first
one have been posted before without big changes. The first, I posted
an RFC for moving kallsyms data section but this approach is simpler.

All patches are independent, so any can be taken in any order. I'm
posting as a group just for convenience but if that is wrong then I
will submit individual patches in future.

Thanks,
Nick

Nicholas Piggin (7):
  kbuild: kallsyms allow 3-pass generation if symbols size has changed
  kbuild: thin archives for multi-y targets
  kbuild/genksyms: handle va_list type
  kbuild: improve linker compatibility with lib-ksyms.o build
  kbuild: keep data tables through dead code elimination
  kbuild: modpost warn if export version crc is missing
  kbuild: minor improvement for thin archives build

 include/asm-generic/vmlinux.lds.h | 68 +++++++++++++++++++--------------------
 scripts/Makefile.build            | 15 ++++++---
 scripts/genksyms/keywords.gperf   |  1 +
 scripts/genksyms/parse.y          |  2 ++
 scripts/link-vmlinux.sh           | 37 ++++++++++++---------
 scripts/mod/modpost.c             |  6 ++++
 6 files changed, 76 insertions(+), 53 deletions(-)

-- 
2.10.2

