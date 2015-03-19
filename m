Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55596 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751191AbbCSNj3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Mar 2015 09:39:29 -0400
Date: Thu, 19 Mar 2015 10:39:25 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH] tools: unbreak 'make tools/*'
Message-ID: <20150319133925.GF2983@kernel.org>
References: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <computersforpeace@gmail.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>

Em Wed, Jan 28, 2015 at 08:47:36PM -0800, Brian Norris escreveu:
> The following targets should be supported from the top-level source
> directory, but were broken by commit 7e1c04779efd ("kbuild: Use relative
> path for $(objtree)"):
 
>  $ make tools/
>  $ make tools/perf
>  $ make O=$(BUILDDIR) tools/perf
 
> The tools/ and tools/% targets are passing the top-level build directory
> as an O= argument, so we need a full path, not a relative one, as the
> $(O) variable will be reinterpreted by the sub-makefile.
 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Michal Marek <mmarek@suse.cz>

After this patch:

$ make mrproper
[acme@ssdandy linux]$ make tools/
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --silentoldconfig Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
make[2]: *** [silentoldconfig] Error 1
make[1]: *** [silentoldconfig] Error 2
Possible targets:

  acpi       - ACPI tools
  cgroup     - cgroup tools
  cpupower   - a tool for all things x86 CPU power
<SNIP>
  vm         - misc vm tools
  x86_energy_perf_policy - Intel energy policy tool
  tmon       - thermal monitoring and tuning tool

You can do:
 $ make -C tools/ <tool>_install

  from the kernel command line to build and install one of
  the tools above

  $ make tools/install

  installs all tools.

Cleaning targets:

  all of the above with the "_clean" string appended cleans
    the respective build directory.
  clean: a summary clean target to clean _all_ folders
[acme@ssdandy linux]$

[acme@ssdandy linux]$ make allyesconfig
scripts/kconfig/conf --allyesconfig Kconfig
#
# configuration written to .config
#
[acme@ssdandy linux]$ make tools/
scripts/kconfig/conf --silentoldconfig Kconfig
scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler
Possible targets:

  acpi       - ACPI tools
  cgroup     - cgroup tools
  cpupower   - a tool for all things x86 CPU power
<SNIP>
  vm         - misc vm tools
  x86_energy_perf_policy - Intel energy policy tool
  tmon       - thermal monitoring and tuning tool

You can do:
 $ make -C tools/ <tool>_install

  from the kernel command line to build and install one of
  the tools above

  $ make tools/install

  installs all tools.

Cleaning targets:

  all of the above with the "_clean" string appended cleans
    the respective build directory.
  clean: a summary clean target to clean _all_ folders
[acme@ssdandy linux]$

--------------------------------------------------------

Better than before, but can't we avoid these two lines:

scripts/kconfig/conf --silentoldconfig Kconfig
scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler

--------------------------------------------------------

And the need for a .config file to be present in the build dir?

Also for this case it didn't improve the situation, I think:

[acme@ssdandy linux]$ make -C tools/perf clean
make: Entering directory `/home/acme/git/linux/tools/perf'
  CLEAN    libtraceevent
<SNIP>
  CLEAN    Documentation
  CLEAN    python
make: Leaving directory `/home/acme/git/linux/tools/perf'
[acme@ssdandy linux]$ make tools/perf/
scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler
make[1]: Nothing to be done for `perf/'.
[acme@ssdandy linux]$ make -C tools/perf/
make: Entering directory `/home/acme/git/linux/tools/perf'
  BUILD:   Doing 'make -j8' parallel build

Auto-detecting system features:
...                         dwarf: [ on  ]
...                         glibc: [ on  ]
<SNIP>
...                     libunwind: [ OFF ]
...            libdw-dwarf-unwind: [ on  ]
...                          zlib: [ on  ]

config/Makefile:308: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
config/Makefile:598: No libbabeltrace found, disables 'perf data' CTF format support, please install libbabeltrace-dev[el]/libbabeltrace-ctf-dev
  CC       arch/common.o
  CC       fd/array.o
  CC       ui/setup.o
  CC       event-parse.o
  CC       util/abspath.o
  CC       scripts/perl/Perf-Trace-Util/Context.o
  CC       fs/fs.o
  LD       fd/libapi-in.o
  CC       event-plugin.o

-------------------------------------------------------

And this I think is related to Jiri's recent move of the feature detection from
tools/perf/ to tools/build/, when we remove that trailing slash:

[acme@ssdandy linux]$ make tools/perf
scripts/kconfig/conf --silentoldconfig Kconfig
scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler
  DESCEND  lib/api
make[3]: tools/build/Makefile.build: No such file or directory
make[3]: *** No rule to make target `tools/build/Makefile.build'.  Stop.
make[2]: *** [/home/acme/git/linux/tools/lib/api/libapi-in.o] Error 2
make[1]: *** [libapikfs] Error 2
make: *** [tools/perf] Error 2
[acme@ssdandy linux]$

-------------------------------------------------------

Jiri, can you take a look at the above?

It works if I use 'make -C', with O=, like I usually do, or without it:

-------------------------------------------------------

[acme@ssdandy linux]$ make -C tools/perf
make: Entering directory `/home/acme/git/linux/tools/perf'
  BUILD:   Doing 'make -j8' parallel build

Auto-detecting system features:
...                         dwarf: [ on  ]
...                         glibc: [ on  ]
<SNIP>
...                     libunwind: [ OFF ]
...            libdw-dwarf-unwind: [ on  ]
...                          zlib: [ on  ]

config/Makefile:308: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
config/Makefile:598: No libbabeltrace found, disables 'perf data' CTF format support, please install libbabeltrace-dev[el]/libbabeltrace-ctf-dev
  GEN      common-cmds.h
  CC       util/abspath.o
  CC       ui/setup.o
  CC       arch/common.o


-------------------------------------------------------

Can you please check these issues, using my perf/core branch at:

git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git

- Arnaldo
