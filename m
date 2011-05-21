Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:62652 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756029Ab1EUMpI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 May 2011 08:45:08 -0400
Received: by vxi39 with SMTP id 39so3199992vxi.19
        for <linux-kbuild@vger.kernel.org>; Sat, 21 May 2011 05:45:08 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 21 May 2011 20:45:07 +0800
Message-ID: <BANLkTi=7AiRbsVojWr=7VVS41EyFXaASGw@mail.gmail.com>
Subject: question about kbuild system
From: os user <gnusercn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi list,

I have a question about the kbuild system. On ARM architecture, after
running "make s3c6400_defconfig", I do "make -d -j1 uImage". I found,

[...]

Putting child 0x0255c0b0 (scripts_basic) PID 23546 on the chain.
Live child 0x0255c0b0 (scripts_basic) PID 23546
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu
Reading makefiles...
Reading makefile `scripts/Makefile.build'...
Reading makefile `include/config/auto.conf' (search path) (don't care)
(no ~ expansion)...
Reading makefile `scripts/Kbuild.include' (search path) (no ~ expansion)...
Reading makefile
`/home/eric/tmp/linux-2.6.37.1/scripts/basic/Makefile' (search path)
(no ~ expansion)...
Reading makefile `scripts/Makefile.lib' (search path) (no ~ expansion)...
Reading makefile `scripts/Makefile.host' (search path) (no ~ expansion)...
Reading makefile `scripts/basic/.docproc.cmd' (search path) (no ~ expansion)...
Reading makefile `scripts/basic/.fixdep.cmd' (search path) (no ~ expansion)...
Updating makefiles....
 Considering target file `scripts/basic/.fixdep.cmd'.
  Looking for an implicit rule for `scripts/basic/.fixdep.cmd'.
  Trying pattern rule with stem `.fixdep.cmd'.
  Trying implicit prerequisite `scripts/basic/.fixdep.cmd_shipped'.
  No implicit rule found for `scripts/basic/.fixdep.cmd'.
  Finished prerequisites of target file `scripts/basic/.fixdep.cmd'.
 No need to remake target `scripts/basic/.fixdep.cmd'.
Considering target file `scripts/basic/.docproc.cmd'.
[...]

I'm just curious where is the definition for  <implicit prerequisite
`scripts/basic/.fixdep.cmd_shipped'> ?
Normally Gnu Make will try a lot of internal rules to deal with
<`scripts/basic/.fixdep.cmd'>, why here Gnu Make stop
trying internal ruls so quickly?

Thanks

BR
g
