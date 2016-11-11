Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36551 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753256AbcKKLX2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 06:23:28 -0500
From: Jiri Slaby <jslaby@suse.cz>
Subject: Kbuild: CC= handling broken for tools/
Message-ID: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
Date: Fri, 11 Nov 2016 12:23:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <MMarek@suse.com>, linux-kbuild@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>

Hi,

I am trying a new gcc with new warnings enabled:

make O=../a/gcc7/ CC='gcc-7' V=1 kernel/exit.o
EXTRA_CFLAGS='-Wimplicit-fallthrough=3'

But the build fails when building under tools/:
...
make -f /home/latest/linux/tools/build/Makefile.build dir=. obj=fixdep
  gcc
-Wp,-MD,/home/latest/a/gcc7/tools/objtool/.exec-cmd.o.d,-MT,/home/latest/a/gcc7/tools/objtool/exec-cmd.o
-Wbad-function-cast -Wdeclaration-after-statement -Wformat-security
-Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes
-Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked
-Wredundant-decls -Wshadow -Wstrict-aliasing=3 -Wstrict-prototypes
-Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat
-Wimplicit-fallthrough=3 -ggdb3 -Wall -Wextra -std=gnu99 -O6
-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fPIC -Werror
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
-I/home/latest/linux/tools/include/ -I/home/latest/linux/include/uapi
-I/home/latest/linux/include -D"BUILD_STR(s)=#s"   -c -o
/home/latest/a/gcc7/tools/objtool/exec-cmd.o exec-cmd.c
gcc: error: unrecognized command line option ‘-Wimplicit-fallthrough=3’;
did you mean ‘-Wno-fallthrough’?


Apparently, CC is not respected for tools/ dir.

Well, it is used (tools/build/Makefile.build):
# Compile command
quiet_cmd_cc_o_c = CC       $@
      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<


But I don't know why CFLAGS propagate from Makefile to tools/, but CC
doesn't (both are exported)? Any ideas?

thanks,
-- 
js
suse labs
