Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46259 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751411AbcG0ABA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 20:01:00 -0400
Subject: Re: Officially vetted programming languages
References: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
 <CA+r1ZhgLwF0EPP6TSGRE45J+cersjibnRZxtZyWWJhtQbZ3vdg@mail.gmail.com>
 <e00ffb2f-28dd-f4fd-e85b-483e5c4f13bc@infradead.org>
 <CA+r1Zhis+4nJw-ndymcB=rhmHY3p7RALyfUru0HVSLG7MJhpoA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6cee14bf-ca5a-8421-218b-e730b015858f@infradead.org>
Date: Tue, 26 Jul 2016 17:00:59 -0700
MIME-Version: 1.0
In-Reply-To: <CA+r1Zhis+4nJw-ndymcB=rhmHY3p7RALyfUru0HVSLG7MJhpoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, linux-kbuild@vger.kernel.org

On 07/26/16 16:50, Jim Davis wrote:
> On Tue, Jul 26, 2016 at 4:15 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 07/26/16 13:46, Jim Davis wrote:
>>> On Mon, Jul 25, 2016 at 6:11 AM, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>>>> Do I understand correctly that POSIX sh and GNU make are
>>>> the only acceptable languages in kernel build
>>>> (ignoring optional scripts)?
>>
>> python is used in several optional areas (perf, gdb, some random scripts).
>>
>>> Well, Documentation/Changes mandates using GNU make (version 3.80 or
>>> later, though 3.80 doesn't seem to work building the 4.6.4 version of
>>> the kernel).  I don't know of a similar mandate for the shell; in
>>> practice (as enshrined in the  top level Makefile) it's /bin/bash,
>>> which is kind of sort of POSIX-y, except when it isn't.
>>
>> I don't see "/bin/bash".  Where is that?
> 
> I was thinking of this snippet from the top level Makefile
> 
> # SHELL used by kbuild
> CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>           else if [ -x /bin/bash ]; then echo /bin/bash; \
>           else echo sh; fi ; fi)

Thanks.

> Speaking of POSIX compliance,  I thought I'd been able to use
> /bin/dash for a defconfig build on my desktop,  but checking again,

We have fixed it several times for dash and should do so again.

> make -f ./scripts/Makefile.build obj=arch/x86/entry/syscalls all
>   /bin/dash './arch/x86/entry/syscalls/syscalltbl.sh'
> arch/x86/entry/syscalls/syscall_32.tbl
> arch/x86/entry/syscalls/../../include/generated/asm/syscalls_32.h
> ./arch/x86/entry/syscalls/syscalltbl.sh: 48: [: I386: unexpected operator
> ./arch/x86/entry/syscalls/syscalltbl.sh: 53: [: I386: unexpected operator
> ./arch/x86/entry/syscalls/syscalltbl.sh: 58: [: I386: unexpected operator
> 
> which points to
> 
>         if [ "$abi" == "COMMON" -o "$abi" == "64" ]; then
> 
> and it seems the test operator should use "=" instead of "=="  for
> POSIX compliance.
> 

Patch?

-- 
~Randy
