Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:32948 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756738AbcASCWY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jan 2016 21:22:24 -0500
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: =?UTF-8?Q?Re:_cannot_build_Linux_4.4:_arch/mips/kernel/signal.c:142?=
 =?UTF-8?Q?:12:_error:_=e2=80=98struct_ucontext=e2=80=99_has_no_member_named?=
 =?UTF-8?B?IOKAmHVjX2V4dGNvbnRleHTigJk=?=
References: <569B9CFE.1090007@gmx.de> <569BA9BB.3080508@gmx.de>
Message-ID: <569D9DDD.7080909@gmail.com>
Date: Mon, 18 Jan 2016 18:22:21 -0800
MIME-Version: 1.0
In-Reply-To: <569BA9BB.3080508@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, lkml <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, James Hogan <james.hogan@imgtec.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>

Le 17/01/2016 06:48, Heinrich Schuchardt a écrit :
> On 01/17/2016 02:54 PM, Heinrich Schuchardt wrote:
>>
>> HEAD is now at afd2ff9... Linux 4.4
>> arch/mips/kernel/signal.c: In function ‘sc_to_extcontext’:
>> arch/mips/kernel/signal.c:142:12: error: ‘struct ucontext’ has no member
>> named ‘uc_extcontext’
>>   return &uc->uc_extcontext;
>>             ^
>> In file included from include/linux/poll.h:11:0,
>>                  from include/linux/ring_buffer.h:7,
>>                  from include/linux/trace_events.h:5,
>>                  from include/trace/syscall.h:6,
>>                  from include/linux/syscalls.h:81,
>>                  from arch/mips/kernel/signal.c:26:
>> arch/mips/kernel/signal.c: In function ‘save_msa_extcontext’:
>> arch/mips/kernel/signal.c:170:40: error: dereferencing pointer to
>> incomplete type
>>
> 
> The problem stemmed from make not recognizing that this file was outdated:
> 
> Oct 16  2014 arch/mips/include/generated/asm/ucontext.h
> 
> Shouldn't make automatically regenerate outdated files?

The reduced test case can be simplified to these steps:

git co f1fe2d21f4e1aca8644cea888dc618f0183ad671\^1
configure your kernel
ARCH=mips make arch/mips/kernel/signal.o
git co f1fe2d21f4e1aca8644cea888dc618f0183ad671
ARCH=mips make arch/mips/kernel/signal.o

The problem seems to be that if there was a previous build which
resulted in creating an asm-generic wrapper for a file
(arch/mips/include/generated/asm/ucontext.h in that case), but this file
was later moved into an arch-specific, non asm-generic header file, then
we are just not going to automatically remove this auto-generated
wrapper, and generate the new one.

This seems to be aggravated by the fact that commit
f1fe2d21f4e1aca8644cea888dc618f0183ad671 does not add ucontext.h to
arch/mips/include/uapi/Kbuild, Paul, James is that intentional?

After trying to mess a bit with a clean solution, I just gave up and
decided that this was not worth fixing since it is a very infrequent
problem.
-- 
Florian

