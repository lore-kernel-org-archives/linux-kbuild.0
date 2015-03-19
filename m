Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48873 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751191AbbCSOU3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 10:20:29 -0400
Date: Thu, 19 Mar 2015 15:20:26 +0100
From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH] tools: unbreak 'make tools/*'
Message-ID: <20150319142026.GE6363@krava>
References: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
 <20150319133925.GF2983@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150319133925.GF2983@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Jiri Olsa <jolsa@kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>

On Thu, Mar 19, 2015 at 10:39:25AM -0300, Arnaldo Carvalho de Melo wrote:

SNIP

> [acme@ssdandy linux]$
> 
> -------------------------------------------------------
> 
> Jiri, can you take a look at the above?
> 
> It works if I use 'make -C', with O=, like I usually do, or without it:
> 
> -------------------------------------------------------
> 
> [acme@ssdandy linux]$ make -C tools/perf
> make: Entering directory `/home/acme/git/linux/tools/perf'
>   BUILD:   Doing 'make -j8' parallel build
> 
> Auto-detecting system features:
> ...                         dwarf: [ on  ]
> ...                         glibc: [ on  ]
> <SNIP>
> ...                     libunwind: [ OFF ]
> ...            libdw-dwarf-unwind: [ on  ]
> ...                          zlib: [ on  ]
> 
> config/Makefile:308: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
> config/Makefile:598: No libbabeltrace found, disables 'perf data' CTF format support, please install libbabeltrace-dev[el]/libbabeltrace-ctf-dev
>   GEN      common-cmds.h
>   CC       util/abspath.o
>   CC       ui/setup.o
>   CC       arch/common.o
> 
> 
> -------------------------------------------------------
> 
> Can you please check these issues, using my perf/core branch at:

hum, I've never cared about tools/Makefile :-\

so this is what we want to be able to do/use? :

  $ make tools/
  $ make tools/perf
  $ make O=$(BUILDDIR) tools/perf

it ^^^ does not work for me even with this patch
(tools/Makefile still using 'libapikfs' being first issue I saw)

I'll check and send fix

jirka
