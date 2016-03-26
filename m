Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46176 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752041AbcCZBsr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Mar 2016 21:48:47 -0400
Date: Sat, 26 Mar 2016 12:48:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160326124844.417c23a5@canb.auug.org.au>
In-Reply-To: <CA+ekxPVrWrz6UOkBDtNxZ1KAO7A95=88z8ZE=mt8AKui0CU5mQ@mail.gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
	<20160325083621.GA21959@gmail.com>
	<CA+ekxPUYPuVMjejTPztNd6FGcMgrdWUNM2HL_2ZwAjQij4+nmw@mail.gmail.com>
	<CA+ekxPUF5yUuRr6mES2z=BhAqzmrrtL=tXEBFoKjqafveBAt0Q@mail.gmail.com>
	<CA+ekxPVrWrz6UOkBDtNxZ1KAO7A95=88z8ZE=mt8AKui0CU5mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeffrey Merkey <jeffmerkey@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Jeff,

On Fri, 25 Mar 2016 17:01:27 -0600 Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
> 
> I went back and checked the code and as it turns out, none of the
> patches you nak'd are in the current branch, there are different
> patches there now.   There are two patches you ignored that are in it,
> but no record of a Nak for either of them.

OK, so one obvious problem is that the tree you want merged has a
single patch in it and the diffstat looks like this:

 Documentation/sysrq.txt                    |    2 +-
 MAINTAINERS                                |    6 +
 arch/x86/include/asm/bug.h                 |    9 +-
 arch/x86/include/uapi/asm/debugreg.h       |    1 +
 arch/x86/kernel/Makefile                   |    1 +
 arch/x86/kernel/apic/io_apic.c             |    2 +
 arch/x86/kernel/debug/Makefile             |    3 +
 arch/x86/kernel/debug/mdb/Makefile         |    6 +
 arch/x86/kernel/debug/mdb/Makefile.local   |  106 +
 arch/x86/kernel/debug/mdb/mdb-base.c       | 3293 +++++++++++++
 arch/x86/kernel/debug/mdb/mdb-base.h       |  447 ++
 arch/x86/kernel/debug/mdb/mdb-ia-apic.c    |  243 +
 arch/x86/kernel/debug/mdb/mdb-ia-proc.h    |  819 ++++
 arch/x86/kernel/debug/mdb/mdb-ia-support.c | 5342 +++++++++++++++++++++
 arch/x86/kernel/debug/mdb/mdb-ia-support.h |   76 +
 arch/x86/kernel/debug/mdb/mdb-ia.c         | 6887 ++++++++++++++++++++++++++++
 arch/x86/kernel/debug/mdb/mdb-ia.h         |  209 +
 arch/x86/kernel/debug/mdb/mdb-keyboard.h   |  127 +
 arch/x86/kernel/debug/mdb/mdb-list.c       |  534 +++
 arch/x86/kernel/debug/mdb/mdb-list.h       |   96 +
 arch/x86/kernel/debug/mdb/mdb-logic.c      | 2118 +++++++++
 arch/x86/kernel/debug/mdb/mdb-main.c       |  786 ++++
 arch/x86/kernel/debug/mdb/mdb-os.c         | 1474 ++++++
 arch/x86/kernel/debug/mdb/mdb-os.h         |  141 +
 arch/x86/kernel/debug/mdb/mdb-proc.h       |  179 +
 arch/x86/kernel/debug/mdb/mdb.h            |   40 +
 arch/x86/kernel/dumpstack_32.c             |    6 +-
 arch/x86/kernel/dumpstack_64.c             |   18 +
 arch/x86/kernel/hw_breakpoint.c            |   69 +-
 arch/x86/kernel/reboot.c                   |    1 +
 arch/x86/kernel/traps.c                    |   14 +
 drivers/tty/vt/vt.c                        |    4 +
 include/asm-generic/bug.h                  |    4 +
 include/linux/console.h                    |    4 +
 kernel/debug/kdb/kdb_debugger.c            |    2 +-
 kernel/events/hw_breakpoint.c              |    2 +
 kernel/extable.c                           |    1 +
 kernel/kallsyms.c                          |   45 +
 kernel/module.c                            |   43 +
 kernel/rcu/tree.c                          |    1 +
 kernel/sched/core.c                        |   13 +-
 kernel/time/clocksource.c                  |    1 +
 kernel/watchdog.c                          |   17 +-
 lib/Kconfig.debug                          |   66 +
 44 files changed, 23240 insertions(+), 18 deletions(-)

Having it in that form makes it pretty hard for anyone to review ...

If you have a set if incremental patches, maybe you should post those
instead.

I am afraid that if the maintainers affected by this code will not
merge it, I cannot justify putting it in linux-next myself.
-- 
Cheers,
Stephen Rothwell
