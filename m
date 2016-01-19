Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:38078 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757544AbcASJGa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jan 2016 04:06:30 -0500
Received: from localhost.localdomain ([127.0.0.1]:33324 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27009220AbcASJG2o2rQz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org> + 1 other);
        Tue, 19 Jan 2016 10:06:28 +0100
Date: Tue, 19 Jan 2016 10:06:24 +0100
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: cannot build Linux 4.4: =?utf-8?Q?arch?=
 =?utf-8?B?L21pcHMva2VybmVsL3NpZ25hbC5jOjE0MjoxMjogZXJyb3I6IOKAmHN0cnVj?=
 =?utf-8?Q?t_ucontext=E2=80=99_has_no_member_named_=E2=80=98uc=5Fextcontex?=
 =?utf-8?B?dOKAmQ==?=
Message-ID: <20160119090624.GB25523@linux-mips.org>
References: <569B9CFE.1090007@gmx.de>
 <569BA9BB.3080508@gmx.de>
 <569D9DDD.7080909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <569D9DDD.7080909@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, lkml <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Mon, Jan 18, 2016 at 06:22:21PM -0800, Florian Fainelli wrote:

> Le 17/01/2016 06:48, Heinrich Schuchardt a écrit :
> > On 01/17/2016 02:54 PM, Heinrich Schuchardt wrote:
> >>
> >> HEAD is now at afd2ff9... Linux 4.4
> >> arch/mips/kernel/signal.c: In function ‘sc_to_extcontext’:
> >> arch/mips/kernel/signal.c:142:12: error: ‘struct ucontext’ has no member
> >> named ‘uc_extcontext’
> >>   return &uc->uc_extcontext;
> >>             ^
> >> In file included from include/linux/poll.h:11:0,
> >>                  from include/linux/ring_buffer.h:7,
> >>                  from include/linux/trace_events.h:5,
> >>                  from include/trace/syscall.h:6,
> >>                  from include/linux/syscalls.h:81,
> >>                  from arch/mips/kernel/signal.c:26:
> >> arch/mips/kernel/signal.c: In function ‘save_msa_extcontext’:
> >> arch/mips/kernel/signal.c:170:40: error: dereferencing pointer to
> >> incomplete type
> >>
> > 
> > The problem stemmed from make not recognizing that this file was outdated:
> > 
> > Oct 16  2014 arch/mips/include/generated/asm/ucontext.h
> > 
> > Shouldn't make automatically regenerate outdated files?
> 
> The reduced test case can be simplified to these steps:
> 
> git co f1fe2d21f4e1aca8644cea888dc618f0183ad671\^1
> configure your kernel
> ARCH=mips make arch/mips/kernel/signal.o
> git co f1fe2d21f4e1aca8644cea888dc618f0183ad671
> ARCH=mips make arch/mips/kernel/signal.o
> 
> The problem seems to be that if there was a previous build which
> resulted in creating an asm-generic wrapper for a file
> (arch/mips/include/generated/asm/ucontext.h in that case), but this file
> was later moved into an arch-specific, non asm-generic header file, then
> we are just not going to automatically remove this auto-generated
> wrapper, and generate the new one.
> 
> This seems to be aggravated by the fact that commit
> f1fe2d21f4e1aca8644cea888dc618f0183ad671 does not add ucontext.h to
> arch/mips/include/uapi/Kbuild, Paul, James is that intentional?
> 
> After trying to mess a bit with a clean solution, I just gave up and
> decided that this was not worth fixing since it is a very infrequent
> problem.

We lately had about five people reporting similar issues that all could
be resolved with make distclean.

  Ralf
