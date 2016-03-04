Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39655 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751557AbcCDKLB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 05:11:01 -0500
Subject: Re: [PATCH v4 5/8] kbuild: add fine grained build dependencies for
 exported symbols
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
 <1456717691-28298-6-git-send-email-nicolas.pitre@linaro.org>
 <56D8C174.70602@suse.com> <alpine.LFD.2.20.1603032053490.13632@knanqh.ubzr>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56D95F33.4050800@suse.com>
Date: Fri, 4 Mar 2016 11:10:59 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1603032053490.13632@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-03-04 03:46, Nicolas Pitre wrote:
> On Thu, 3 Mar 2016, Michal Marek wrote:
> 
>> Dne 29.2.2016 v 04:48 Nicolas Pitre napsal(a):
>>> +# Filter out exported kernel symbol names advertised as warning pragmas
>>> +# by the preprocessor and write them to $(1). We must consider continuation
>>> +# lines as well: they start with a blank, or the preceeding line ends with
>>> +# a ':'. Anything else is passed through as is.
>>> +# See also __KSYM_DEP() in include/linux/export.h.
>>> +ksym_dep_filter = sed -n \
>>> +	-e '1 {x; $$!d}' \
>>> +	-e '/^ / {H; $$!d}' \
>>> +	-e 'x; /:$$/ {x; H; $$!d; s/^/ /; x}' \
>>> +	-e ':filter; /^.*KBUILD_AUTOKSYM_DEP: /! {p; b next}' \
>>> +	-e 's//KSYM_/; s/\n.*//; w $(1)' \
>>> +	-e ':next; $$!d' \
>>> +	-e '1 q; s/^/ /; x; /^ /! b filter'
>>
>> This is unreadable and it does not work with my gcc version. I get
>> dependencies like
>>
>>     $(wildcard include/config/ksym/simple/strtoull [enabled by default].h) \
> 
> That's too bad.  This had almost zero overhead as the preprocessor 
> didn't have to be executed twice.

I know you are trying to collect the exports in a single pass, but
parsing the compiler warnings is really fragile.


> Probably adding s/ .*//; before w $(1) would fix that.  But I agree this 
> is fragile.  What gcc version is this?

$ gcc --version
gcc (SUSE Linux) 4.8.3 20140627 [gcc-4_8-branch revision 212064]
...

The output looks like this:
$ echo '_Pragma("GCC warning \"KBUILD_AUTOKSYM_DEP: test\"")' | gcc
-Wall -c -xc -
<stdin>:1:13: warning: KBUILD_AUTOKSYM_DEP: test [enabled by default]

Clang output is similar, except that the text appears twice in the output:
$ echo '_Pragma("GCC warning \"KBUILD_AUTOKSYM_DEP: test\"")' | clang
-Wall -c -xc -
<stdin>:1:1: warning: KBUILD_AUTOKSYM_DEP: test [-W#pragma-messages]
_Pragma("GCC warning \"KBUILD_AUTOKSYM_DEP: test\"")
^
<scratch space>:2:6: note: expanded from here
 GCC warning "KBUILD_AUTOKSYM_DEP: test"
     ^

What is worse, older gccs do not support the GCC warning pragma:
$ gcc --version
gcc (GCC) 4.1.2 20070115 (SUSE Linux)
...
$ echo '_Pragma("GCC warning \"KBUILD_AUTOKSYM_DEP: test\"")' | gcc
-Wall -c -xc  -
<stdin>:1: warning: ignoring #pragma GCC warning


> Oh and who said that a sed script had to, or could be readable?  ;-)

I guess I could live with a non-redable sed script embedded in a
Makefile, if I knew that it won't need updating for each new compiler
release :).

Michal

