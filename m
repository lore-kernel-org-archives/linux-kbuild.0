Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37219 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbeJTV3z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Oct 2018 17:29:55 -0400
Received: by mail-wm1-f65.google.com with SMTP id 185-v6so6130795wmt.2
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Oct 2018 06:19:27 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 0/2] modpost: skip section mismatch warnings on ELF local symbols by default
Date: Sat, 20 Oct 2018 06:19:10 -0700
Message-Id: <20181020131911.22443-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, Jim Wilson <jimw@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

modpost: skip section mismatch warnings on ELF local symbols by default

modpost, by default, reports section mismatch warnings on ELF local
symbols.  This caused false positive warnings to be reported for a
local symbol name that would otherwise be elided by matching against a
name pattern.  This was observed using a RISC-V toolchain that generates
section anchors.

To avoid this noise in the common case, this patch series disables
section mismatch warnings on ELF local symbols by default.  It also
adds a modpost command line switch to re-enable these warnings, since
I wasn't able to convince myself that section mismatch warnings on ELF
local symbols were completely useless; just mostly useless :-)

I'm neither a modpost nor an ELF expert, so careful review of this
series is appreciated.

This modpost series can also be found at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/modpost-elf-local-symbols-v4.19-rc7

The series was tested on a RISC-V build of the SiFive UART serial
driver, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v4.19-rc7

Paul Walmsley (2):
  modpost: add switch to skip symbol exclusions likely to generate false
    positives
  modpost: skip ELF local symbols by default during section mismatch
    check

 scripts/mod/modpost.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

Cc: Russell King <linux@armlinux.org.uk>
Cc: Jim Wilson <jimw@sifive.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

-- 
2.19.1
