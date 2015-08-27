Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42702 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751245AbbH0Ih5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Aug 2015 04:37:57 -0400
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
 <20150422143320.GB19277@sepie.suse.cz> <559EFF2F.1070301@converseincode.com>
 <20150713205933.002f9396@kryten> <20150819154140.GA8820@sepie.suse.cz>
 <55DE6CA8.5000409@converseincode.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55DECC61.60705@suse.cz>
Date: Thu, 27 Aug 2015 10:37:53 +0200
MIME-Version: 1.0
In-Reply-To: <55DE6CA8.5000409@converseincode.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>, Anton Blanchard <anton@samba.org>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>

On 2015-08-27 03:49, Behan Webster wrote:
> 
> On 08/19/15 08:41, Michal Marek wrote:
>>  From 49bb3e66a9a7fc3685fb070bdfd31f2c3d78cc87 Mon Sep 17 00:00:00 2001
>> From: Michal Marek <mmarek@suse.com>
>> Date: Wed, 19 Aug 2015 17:36:41 +0200
>> Subject: [PATCH] kbuild: Fix clang detection
>>
>> We cannot detect clang before including the arch Makefile, because that
>> can set the default cross compiler. We also cannot detect clang after
>> including the arch Makefile, because powerpc wants to know about clang.
>> Solve this by using an deferred variable. This costs us a few shell
>> invocations, but this is only a constant number.
>>
>> Reported-by: Behan Webster <behanw@converseincode.com>
>> Reported-by: Anton Blanchard <anton@samba.org>
>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> ---
>>   Makefile                   | 9 +--------
>>   arch/powerpc/Makefile      | 8 ++++----
>>   scripts/Kbuild.include     | 4 ++++
>>   scripts/Makefile.extrawarn | 2 +-
>>   4 files changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 13270c0..5ccbb58 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -661,14 +661,7 @@ endif
>>   endif
>>   KBUILD_CFLAGS += $(stackp-flag)
>>   
>> -ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
>> -COMPILER := clang
>> -else
>> -COMPILER := gcc
>> -endif
>> -export COMPILER
>> -
>> -ifeq ($(COMPILER),clang)
>> +ifeq ($(cc-name),clang)
>>   KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
>>   KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index 05f464e..dfe88896 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -67,7 +67,7 @@ UTS_MACHINE := $(OLDARCH)
>>   
>>   ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
>>   override CC	+= -mlittle-endian
>> -ifneq ($(COMPILER),clang)
>> +ifneq ($(cc-name),clang)
>>   override CC	+= -mno-strict-align
>>   endif
>>   override AS	+= -mlittle-endian
>> @@ -333,7 +333,7 @@ TOUT	:= .tmp_gas_check
>>   # - Require gcc 4.0 or above on 64-bit
>>   # - gcc-4.2.0 has issues compiling modules on 64-bit
>>   checkbin:
>> -	@if test "${COMPILER}" != "clang" \
>> +	@if test "$(cc-name)" != "clang" \
>>   	    && test "$(cc-version)" = "0304" ; then \
>>   		if ! /bin/echo mftb 5 | $(AS) -v -mppc -many -o $(TOUT) >/dev/null 2>&1 ; then \
>>   			echo -n '*** ${VERSION}.${PATCHLEVEL} kernels no longer build '; \
>> @@ -342,14 +342,14 @@ checkbin:
>>   			false; \
>>   		fi ; \
>>   	fi
>> -	@if test "${COMPILER}" != "clang" \
>> +	@if test "$(cc-name)" != "clang" \
>>   	    && test "$(cc-version)" -lt "0400" \
>>   	    && test "x${CONFIG_PPC64}" = "xy" ; then \
>>                   echo -n "Sorry, GCC v4.0 or above is required to build " ; \
>>                   echo "the 64-bit powerpc kernel." ; \
>>                   false ; \
>>           fi
>> -	@if test "${COMPILER}" != "clang" \
>> +	@if test "$(cc-name)" != "clang" \
>>   	    && test "$(cc-fullversion)" = "040200" \
>>   	    && test "x${CONFIG_MODULES}${CONFIG_PPC64}" = "xyy" ; then \
>>   		echo -n '*** GCC-4.2.0 cannot compile the 64-bit powerpc ' ; \
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index d3437b8..3523df6 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -128,6 +128,10 @@ cc-option-align = $(subst -functions=0,,\
>>   cc-disable-warning = $(call try-run,\
>>   	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>>   
>> +# cc-name
>> +# Expands to either gcc or clang
>> +cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
>> +
>>   # cc-version
>>   cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
>>   
>> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
>> index f734033..4efedcb 100644
>> --- a/scripts/Makefile.extrawarn
>> +++ b/scripts/Makefile.extrawarn
>> @@ -56,7 +56,7 @@ endif
>>   KBUILD_CFLAGS += $(warning)
>>   else
>>   
>> -ifeq ($(COMPILER),clang)
>> +ifeq ($(cc-name),clang)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
>>   KBUILD_CFLAGS += $(call cc-disable-warning, format)
> 
> Is there any reason you renamed COMPILER? Because it breaks all the 
> other patches we have queued up which use it for cross compiling.
> 
> And aren't we supposed to use all caps for variable names?

It more like a function now and is consistent with the other cc-*
definitions in scripts/Kbuild.include.


> This doesn't only break powerpc, it breaks arm, aarch64 and clang work 
> that's being done on MIPS malta.

So do a s/COMPILER/cc-name/ ? You can merge my patch into your tree to
avoid a dependency on the kbuild tree.


> The big reason I wrote it the way I did was so other compilers could be 
> added as well (as if-then-else stanzas).
> 
> I understand that the initial issue was that if /usr/bin/cc was clang 
> things broke for MIPS, but that's just a temporal problem as we upstream 
> clang support.

I don't think so. Arch Makefiles are allowed to override the default
value of $(CC) and until then, it cannot be used.


> In many ways I'd prefer to see ee4eb20dbce91751c248399e8a0cf9b8813adf5a 
> reverted.

This just brings back the original problem.

Michal

