Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41974 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S966175AbcCPM3E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 08:29:04 -0400
Subject: Re: [PATCH v6 5/8] kbuild: add fine grained build dependencies for
 exported symbols
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
 <1457923336-2732-6-git-send-email-nicolas.pitre@linaro.org>
 <56E8718E.9010607@suse.com> <fvfraWW5gnPSEfvfsaDPXE@videotron.ca>
 <alpine.LFD.2.20.1603151853410.30579@knanqh.ubzr>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56E9518E.1020206@suse.com>
Date: Wed, 16 Mar 2016 13:29:02 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1603151853410.30579@knanqh.ubzr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-03-16 00:14, Nicolas Pitre wrote:
> On Tue, 15 Mar 2016, Michal Marek wrote:
> 
>> Dne 14.3.2016 v 03:42 Nicolas Pitre napsal(a):
>>> +# Filter out exported kernel symbol names from the preprocessor output.
>>> +# See also __KSYM_DEPS__ in include/linux/export.h.
>>> +# We disable the depfile generation here, so as not to overwrite the existing
>>> +# depfile while fixdep is parsing it
>>> +flags_nodeps = $(filter-out -Wp$(comma)-M%, $($(1)))
>>> +ksym_dep_filter =                                                            \
>>> +	case "$(1)" in                                                       \
>>> +	cc_*_c) $(CPP) $(call flags_nodeps,c_flags) -D__KSYM_DEPS__ $< ;;    \
>>> +	as_*_S) $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;    \
>>> +	cpp_lds_S) : ;;                                                      \
>>> +	*) echo "Don't know how to preprocess $(1)" >&2; false ;;            \
>>> +	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
>>> +
>>> +cmd_and_fixdep =                                                             \
>>> +	$(echo-cmd) $(cmd_$(1));                                             \
>>> +	$(ksym_dep_filter) |                                                 \
>>> +		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
>>> +			> $(dot-target).tmp;	                             \
>>> +	rm -f $(depfile);                                                    \
>>> +	mv -f $(dot-target).tmp $(dot-target).cmd;
>>> +
>>> +endif
>>
>> Not sure what happened this time, but I got
>>
>> drivers/md/.dm-round-robin.mod.o.cmd:5: *** unterminated call to
>> function 'wildcard': missing ')'.  Stop.
>>
>> The depfile is indeed corrupt (truncated):
>> tail drivers/md/.dm-round-robin.mod.o.cmd
>>   arch/x86/include/asm/disabled-features.h \
>>     $(wildcard include/config/x86/intel/mpx.h) \
>>   arch/x86/include/asm/rmwcc.h \
>>   arch/x86/include/asm/barrier.h \
>>     $(wildcard include/config/x86/ppro/fence.h) \
>>   arch/x86/include/asm/nops.h \
>>     $(wildcard include/config/mk7.h) \
>>   include/asm-generic/barrier.h \
>>   include/asm-generic/bitops/find.h \
>>     $(wildcard include/config/generic/
>>
>> The file is exactly 8kB long:
>> $ ls -l drivers/md/.dm-round-robin.mod.o.cmd
>> -rw-r--r-- 1 mmarek users 8192 Mar  8 13:33
>> drivers/md/.dm-round-robin.mod.o.cmd
> 
> [...]
> 
>> Forgot to add: This was an allmodconfig build without
>> CONFIG_TRIM_UNUSED_SYMS.
> 
> If CONFIG_TRIM_UNUSED_SYMS is actually not selected, then I really don't 
> see how my changes can be involved in this failure.

I have no idea either.


> And I cannot reproduce here so far. I didn't receive anything from 
> kbuild test robot since February 15 either. Is this something that you 
> are able to reproduce on your side?

I started a build loop now.


> If so, do you get suspicious output on stderr during the build?  Maybe 
> fixdep exits prematurelywith "fixdep: bad data on stdin"?  However, that 
> cannot happen if CONFIG_TRIM_UNUSED_SYMS=n.
> 
> Did you test my git branch, or did you apply the posted patches to your 
> tree?  If the later, could you publish a branch for it so I could test 
> the same tree as you do?

I applied the patches to my -rc1 based kbuild branch and yes, there was
a conflict with 2aedcd098a94 ("kbuild: suppress annoying "... is up to
date." message"). So it's possible that I screwed it up. I pushed the
branch to

git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git
tmp.autoksyms6

Michal


