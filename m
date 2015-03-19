Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:35135 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069AbbCSQLH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 12:11:07 -0400
Date: Thu, 19 Mar 2015 09:11:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] tools: unbreak 'make tools/*'
Message-ID: <20150319161103.GC19571@brian-ubuntu>
References: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
 <20150319133925.GF2983@kernel.org>
 <20150319142026.GE6363@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150319142026.GE6363@krava>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>

On Thu, Mar 19, 2015 at 03:20:26PM +0100, Jiri Olsa wrote:
> On Thu, Mar 19, 2015 at 10:39:25AM -0300, Arnaldo Carvalho de Melo wrote:
> 
> SNIP
> 
> > [acme@ssdandy linux]$
> > 
> > -------------------------------------------------------
> > 
> > Jiri, can you take a look at the above?
> > 
> > It works if I use 'make -C', with O=, like I usually do, or without it:
> > 
> > -------------------------------------------------------
> > 
> > [acme@ssdandy linux]$ make -C tools/perf
> > make: Entering directory `/home/acme/git/linux/tools/perf'
> >   BUILD:   Doing 'make -j8' parallel build
> > 
> > Auto-detecting system features:
> > ...                         dwarf: [ on  ]
> > ...                         glibc: [ on  ]
> > <SNIP>
> > ...                     libunwind: [ OFF ]
> > ...            libdw-dwarf-unwind: [ on  ]
> > ...                          zlib: [ on  ]
> > 
> > config/Makefile:308: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
> > config/Makefile:598: No libbabeltrace found, disables 'perf data' CTF format support, please install libbabeltrace-dev[el]/libbabeltrace-ctf-dev
> >   GEN      common-cmds.h
> >   CC       util/abspath.o
> >   CC       ui/setup.o
> >   CC       arch/common.o
> > 
> > 
> > -------------------------------------------------------
> > 
> > Can you please check these issues, using my perf/core branch at:
> 
> hum, I've never cared about tools/Makefile :-\
> 
> so this is what we want to be able to do/use? :
> 
>   $ make tools/
>   $ make tools/perf
>   $ make O=$(BUILDDIR) tools/perf

Honestly, I only was caring about 'make tools/tmon' but noticed other
things were broken. I'd be OK if we didn't support building from the
top-level directory (it's just confusing things here), but since we
advertise the feature, it'd really better work!

> it ^^^ does not work for me even with this patch
> (tools/Makefile still using 'libapikfs' being first issue I saw)
> 
> I'll check and send fix

Yeah, I'm not likely to spend time on an updated fix real soon. Consider
my patch a bug report, if the suggested fix doesn't work out. I'm not
much of a build system expert here.

Thanks,
Brian
