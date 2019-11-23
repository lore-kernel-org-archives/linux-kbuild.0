Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39538 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfKWN17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:27:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 00/16] scripts/kallsyms: various cleanups and optimizations
Date: Sat, 23 Nov 2019 22:27:11 +0900
Message-Id: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Masahiro Yamada (16):
  scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
  scripts/kallsyms: fix definitely-lost memory leak
  scripts/kallsyms: set relative_base more effectively
  scripts/kallsyms: remove redundant is_arm_mapping_symbol()
  scripts/kallsyms: remove unneeded length check for prefix matching
  scripts/kallsyms: add sym_name() to mitigate cast ugliness
  scripts/kallsyms: replace prefix_underscores_count() with strspn()
  scripts/kallsyms: make find_token() return (unsigned char *)
  scripts/kallsyms: add const qualifiers where possible
  scripts/kallsyms: skip ignored symbols very early
  scripts/kallsyms: move more patterns to the ignored_prefixes array
  scripts/kallsyms: move ignored symbol types to is_ignored_symbol()
  scripts/kallsyms: make check_symbol_range() void function
  scripts/kallsyms: check no valid symbol earlier
  scripts/kallsyms: put check_symbol_range() calls close together
  scripts/kallsyms: remove redundant initializers

 scripts/kallsyms.c | 254 +++++++++++++++++++++------------------------
 1 file changed, 121 insertions(+), 133 deletions(-)

-- 
2.17.1
