Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44596 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbeKOLBy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 06:01:54 -0500
Received: by mail-pf1-f196.google.com with SMTP id b81-v6so8284578pfe.11
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 16:56:17 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2 0/2] modpost: skip section mismatch warnings on ELF local symbols by default
Date: Wed, 14 Nov 2018 16:56:00 -0800
Message-Id: <20181115005602.30746-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Russell King <linux@armlinux.org.uk>, Jim Wilson <jimw@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Paul Walmsley <paul@pwsan.com>, linux-kbuild@vger.kernel.org

modpost reports section mismatch warnings on ELF local symbols.  This
caused false positive warnings to be reported for a local symbol name
that would otherwise be elided by matching against a name pattern.
This was observed using a RISC-V gcc 8.2.0 toolchain that generates
section anchors.

To avoid this noise in the common case, this patch series disables
section mismatch warnings on ELF local symbols.  It also drops some
unused command line switches from modpost, per feedback from Sam
Ravnborg <sam@ravnborg.org>.

This modpost series can also be found at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/modpost-elf-local-symbols-v4.20-rc2

The series was tested on a RISC-V build of the SiFive UART serial
driver, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v4.19-rc7


Paul Walmsley (2):
  modpost: drop unused command line switches
  modpost: skip ELF local symbols by default during section mismatch
    check

 scripts/mod/modpost.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

Cc: Russell King <linux@armlinux.org.uk>
Cc: Jim Wilson <jimw@sifive.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Paul Walmsley <paul@pwsan.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

-- 
2.19.1
