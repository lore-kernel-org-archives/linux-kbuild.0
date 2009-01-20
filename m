Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f20.google.com ([209.85.219.20]:38210 "EHLO
	mail-ew0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760291AbZATKPc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Jan 2009 05:15:32 -0500
Received: by ewy13 with SMTP id 13so831112ewy.13
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2009 02:15:29 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 20 Jan 2009 18:15:29 +0800
Message-ID: <91b13c310901200215t1b40ac1eid0a704d6c55522bc@mail.gmail.com>
Subject: Is this a kbuild system's BUG?
From: Cheng Renquan <crquan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hello,

as the prepare target said,

  prepare         - Set up for building external modules

it should setup a environment for external modules building, right?

I unpacked linux-2.6.28.tar.bz2 to /usr/src/linux-2.6.28/, copied a
good .config,
"make prepare" under it,

but if I use it to build an external module under $PWD/kernel, it complains,

$ env -i make -C /usr/src/linux-2.6.28/ M=$PWD/kernel
make: Entering directory `/usr/src/linux-2.6.28'

  WARNING: Symbol version dump /usr/src/linux-2.6.28/Module.symvers
           is missing; modules will have no dependencies and modversions.

  Building modules, stage 2.
  MODPOST 1 modules
/bin/sh: scripts/mod/modpost: No such file or directory
make[1]: *** [__modpost] Error 127
make: *** [modules] Error 2
make: Leaving directory `/usr/src/linux-2.6.28'

it seems OK if I do a "make scritps/" in advance, so should we add scripts
depend to prepare?

-- 
Cheng Renquan, Shenzhen, China
Katharine Hepburn  - "Death will be a great relief. No more interviews."
