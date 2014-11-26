Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41620 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750793AbaKZNrM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Nov 2014 08:47:12 -0500
Message-ID: <5475D9DE.1030303@suse.cz>
Date: Wed, 26 Nov 2014 14:47:10 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Use -nostdinc in compile tests
References: <1415235534.3398.35.camel@decadent.org.uk> <5474FA42.20605@suse.cz>
In-Reply-To: <5474FA42.20605@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On 2014-11-25 22:53, Michal Marek wrote:
> Dne 6.11.2014 v 01:58 Ben Hutchings napsal(a):
>> gcc 4.8 and later include <stdc-predef.h> by default.  In some
>> versions of eglibc that includes <bits/predefs.h>, but that may be
>> missing when building with a biarch compiler.  Also <stdc-predef.h>
>> itself could be missing as we are only trying to build a kernel, not
>> userland.
>>
>> The -nostdinc option disables this, though it isn't explicitly
>> documented.  This option is already used when actually building
>> the kernel, but not by cc-option and other tests.  This can result
>> in silently miscompiling the kernel.
>>
>> References: https://bugs.debian.org/717557
>> References: https://bugs.debian.org/726861
>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>> ---
>> This specific issue appeared and then was fixed in Debian about a year
>> ago, but it seems like it can also affect cross-builds.
>>
>> It may also be worth adding some sort of sanity test, so we stop
>> immediately if $(cc-option $(empty),broken) yields 'broken'.
>>
>> Ben.
>>
>>  Makefile               |  4 +++-
>>  scripts/Kbuild.include | 15 ++++++++-------
>>  2 files changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index ffc1ce2..c0fbf67 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -619,6 +619,8 @@ endif
>>  # Tell gcc to never replace conditional load with a non-conditional one
>>  KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
>>  
>> +NOSTDINC_FLAGS += -nostdinc
>> +
>>  ifdef CONFIG_READABLE_ASM
>>  # Disable optimizations that make assembler listings hard to read.
>>  # reorder blocks reorders the control in the function
>> @@ -742,7 +744,7 @@ KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
>>  endif
>>  
>>  # arch Makefile may override CC so keep this after arch Makefile is included
>> -NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>> +NOSTDINC_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
> 
> Why not simply move the whole assignment up?

Ah, I see the reason now -- we need $(CC) for the second part of the
assignment.


> Also, there are two
> cc-option tests and one cc-disable-warning test before the first part
> assignment. Looks like a result of a mismerge.

But this still looks like a bug to me.

Michal

