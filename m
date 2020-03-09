Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx.sdf.org ([205.166.94.20]:50302 "EHLO mx.sdf.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbgCIPei (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Mar 2020 11:34:38 -0400
Date: Mon, 9 Mar 2020 15:27:20 +0000
From: George Spelvin <lkml@SDF.ORG>
Subject: Bug in CONFIG_CC_HAS_INT128 (5.5 regression)
Message-ID: <20200309152720.GA24424@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ardb@kernel.org
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org, George Spelvin <lkml@SDF.ORG>

Here's an interesting bug I just ran into, a bug in commit
c12d3362a74b ("int128: move __uint128_t compiler test to Kconfig")

My x86-64 kernel build is lacking CC_HAS_INT128 and therefore
 CONFIG_ARCH_SUPPORTS_INT128, even through it supports
__int128 just fine.

The reason is that the actuall call which tests for compiler support is 
execve("/usr/bin/gcc", ["gcc", "-Werror", "-D__SIZEOF_INT128__=0", "-S", "-x", "c", "/dev/null", "-o", "/dev/null"], 0x5818d390 /* 122 vars */) = 0

and it doesn't detect the redefined symbol.

$ gcc -Werror -D__SIZEOF_INT128__=0 -S -x c /dev/null -o /dev/null
$ echo $?
0

But on my machine, gcc defaults to the 32-bit compiler.  The kernel
is compiled with -m64, and with that on the command line, things
fail as expected:

$ gcc -m64 -Werror -D__SIZEOF_INT128__=0 -S -x c /dev/null -o /dev/null
<command-line>: error: "__SIZEOF_INT128__" redefined [-Werror]
<built-in>: note: this is the location of the previous definition
cc1: all warnings being treated as errors
$

I haven't figured out how to fix this, but hopefully someone more familiar
with the innards of Kconfig can.
