Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:55777 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752809AbbBYTj6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Feb 2015 14:39:58 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so5977777obc.8
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2015 11:39:58 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 25 Feb 2015 11:39:58 -0800
Message-ID: <CAHTgTXU1fA9Y3YWoOSRuqZ6iZ5c8DK0+TwBdSKFohytjPAkjhg@mail.gmail.com>
Subject: SYMTAB_SHNDX has bad sh_link build error
From: Vinson Lee <vlee@twopensource.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi.

With Linux 4.0-rc1, I get this allyesconfig build error on CentOS 5.
This build error occurs starting with Linux 3.15-rc1.

+ modpost_link vmlinux.o
+ ld -m elf_x86_64 -r -o vmlinux.o arch/x86/kernel/head_64.o arch/x86/kernel/he$
+ make -f ./scripts/Makefile.modpost vmlinux.o
  scripts/mod/modpost -m -a -o ./Module.symvers      vmlinux.o
FATAL: vmlinux.o: SYMTAB_SHNDX has bad sh_link: 71288!=71032

Cheers,
Vinson
