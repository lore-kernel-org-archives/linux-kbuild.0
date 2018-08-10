Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:49834 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbeHJWZc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Aug 2018 18:25:32 -0400
Subject: Re: HELP: Count Lines of Code in Custom Compiled Kernel
From: Randy Dunlap <rdunlap@infradead.org>
References: <CAL8qismn-pAKiGRi-BjadSBHd=KoMAjG2di9h9dLjDTQzeejtA@mail.gmail.com>
 <8de39769-b67b-a12f-c4fd-5d19ef8ddf0b@infradead.org>
 <bfb44a8e-14b3-f862-97e1-e59118cd0587@infradead.org>
Message-ID: <dff9d7ae-026d-eaf6-2424-c1d312d393b0@infradead.org>
Date: Fri, 10 Aug 2018 12:53:39 -0700
MIME-Version: 1.0
In-Reply-To: <bfb44a8e-14b3-f862-97e1-e59118cd0587@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Faisal Mehmood <f.m3hm00d@gmail.com>, linux-kbuild@vger.kernel.org

On 08/10/2018 10:54 AM, Randy Dunlap wrote:
> On 08/10/2018 09:43 AM, Randy Dunlap wrote:
>> On 08/10/2018 12:30 AM, Faisal Mehmood wrote:
>>> So I compiled a custom minimal Linux Kernel. I want to list all the
>>> source files used for this particular .config file. I also want to
>>> count the lines of code against that .config file compilation.
>>
>> Hi,
>>
>> We have a tradition of not doing people's homework for them.  :)
>>
>>> I tried using 'make  > logfile', but that only lists the generated
>>> object files. Source files are not listed.
>>
>> Did you try other build options?
>>
>> E.g., using "make V=1 ... " will give you verbose output.  It might give
>> you a list of source files that are compiled.  OTOH, it's probably too verbose.
>>
>> Or did you look at "make C=1 ..." to invoke the "CHECK" tool on each source
>> file that is built?
>>
>> That should be enough of a hint to get you going...
>>
>>> 'find . -type f -name *.[ch]' includes all the source files, while I
>>> only need those that are being used by my .config file.
>>
>>
>> BTW, it would be helpful if one could override "CHECKFLAGS" on the
>> 'make' command line.
>> As is, CHECKFLAGS is (too) sparse-specific.
> 
> Aha, it is c_flags that gets in the way.
> CHECKFLAGS=   does work to override its value.
> 
> So Faisal, I had to use a patch like this and then using CHECK=<some script file>
> and CHECKFLAGS=      works to count each source file that is built.

OK, that patch isn't needed if the line-counting script is modified to
accept any number of c_flags with the source file name as the last parameter.
Just ignore all of the c_flags.


The complete build output will contain lots of lines that are not
"interesting," but you can grep that output for lines that begin with
numbers and get something like this:

202 ../lib/sha1.c
52 ../lib/show_mem.c
551 ../lib/siphash.c
1054 ../lib/string.c
113 ../lib/timerqueue.c
3203 ../lib/vsprintf.c
99 ../lib/win_minmax.c
1870 ../lib/xarray.c
165 ../arch/x86/boot/a20.c
158 ../arch/x86/boot/cmdline.c
101 ../arch/x86/boot/cpu.c
129 ../arch/x86/boot/cpuflags.c
229 ../arch/x86/boot/cpucheck.c
75 ../arch/x86/boot/compressed/string.c
154 ../arch/x86/boot/early_serial_console.c
182 ../arch/x86/boot/edd.c
182 ../arch/x86/boot/main.c


and then add them up.  QED.

-- 
~Randy
