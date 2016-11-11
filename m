Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47850 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933303AbcKKPam (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 10:30:42 -0500
Date: Fri, 11 Nov 2016 09:30:40 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: Kbuild: CC= handling broken for tools/
Message-ID: <20161111153040.o6guxey27qkfzlxs@treble>
References: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
 <20161111140047.GA13610@krava>
 <f4fc1e89-bd82-917e-a986-c02b24c6b8d8@suse.cz>
 <20161111151427.GA27779@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161111151427.GA27779@krava>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Jiri Slaby <jslaby@suse.cz>, Michal Marek <MMarek@suse.com>, linux-kbuild@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Fri, Nov 11, 2016 at 04:14:27PM +0100, Jiri Olsa wrote:
> On Fri, Nov 11, 2016 at 03:04:35PM +0100, Jiri Slaby wrote:
> > On 11/11/2016, 03:00 PM, Jiri Olsa wrote:
> > > On Fri, Nov 11, 2016 at 12:23:25PM +0100, Jiri Slaby wrote:
> > >> Hi,
> > >>
> > >> I am trying a new gcc with new warnings enabled:
> > >>
> > >> make O=../a/gcc7/ CC='gcc-7' V=1 kernel/exit.o
> > >> EXTRA_CFLAGS='-Wimplicit-fallthrough=3'
> > >>
> > >> But the build fails when building under tools/:
> > >> ...
> > >> make -f /home/latest/linux/tools/build/Makefile.build dir=. obj=fixdep
> > >>   gcc
> > >> -Wp,-MD,/home/latest/a/gcc7/tools/objtool/.exec-cmd.o.d,-MT,/home/latest/a/gcc7/tools/objtool/exec-cmd.o
> > >> -Wbad-function-cast -Wdeclaration-after-statement -Wformat-security
> > >> -Wformat-y2k -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > >> -Wnested-externs -Wno-system-headers -Wold-style-definition -Wpacked
> > >> -Wredundant-decls -Wshadow -Wstrict-aliasing=3 -Wstrict-prototypes
> > >> -Wswitch-default -Wswitch-enum -Wundef -Wwrite-strings -Wformat
> > >> -Wimplicit-fallthrough=3 -ggdb3 -Wall -Wextra -std=gnu99 -O6
> > >> -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fPIC -Werror
> > >> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
> > >> -I/home/latest/linux/tools/include/ -I/home/latest/linux/include/uapi
> > >> -I/home/latest/linux/include -D"BUILD_STR(s)=#s"   -c -o
> > >> /home/latest/a/gcc7/tools/objtool/exec-cmd.o exec-cmd.c
> > >> gcc: error: unrecognized command line option ‘-Wimplicit-fallthrough=3’;
> > >> did you mean ‘-Wno-fallthrough’?
> > >>
> > >>
> > >> Apparently, CC is not respected for tools/ dir.
> > >>
> > >> Well, it is used (tools/build/Makefile.build):
> > >> # Compile command
> > >> quiet_cmd_cc_o_c = CC       $@
> > >>       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
> > >>
> > >>
> > >> But I don't know why CFLAGS propagate from Makefile to tools/, but CC
> > >> doesn't (both are exported)? Any ideas?
> > > 
> > > so the root Makefile assign CC directly:
> > >   CC              = $(CROSS_COMPILE)gcc
> > > 
> > > we are trying to be a little bit smarter in perf
> > > and set it only if it's not set by user
> > > 
> > > # Allow setting CC and AR and LD, or setting CROSS_COMPILE as a prefix.
> > > $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> > > $(call allow-override,AR,$(CROSS_COMPILE)ar)
> > > $(call allow-override,LD,$(CROSS_COMPILE)ld)
> > > 
> > > I did not check the other tools..
> > 
> > Note that I don't care about tools at all. objtool (see the dump above)
> > is apparently needed to build the kernel proper, so it is built as a
> > part of kernel.
> > 
> > BTW shouldn't it use HOSTCC anyway?
> 
> hum, probably.. adding Josh to the loop

Does it work if you use KCFLAGS instead of EXTRA_CFLAGS?

-- 
Josh
