Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:35347 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016AbbH0Btc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Aug 2015 21:49:32 -0400
Received: by pacdd16 with SMTP id dd16so6638049pac.2
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2015 18:49:31 -0700 (PDT)
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
 <20150422143320.GB19277@sepie.suse.cz> <559EFF2F.1070301@converseincode.com>
 <20150713205933.002f9396@kryten> <20150819154140.GA8820@sepie.suse.cz>
From: Behan Webster <behanw@converseincode.com>
Message-ID: <55DE6CA8.5000409@converseincode.com>
Date: Wed, 26 Aug 2015 18:49:28 -0700
MIME-Version: 1.0
In-Reply-To: <20150819154140.GA8820@sepie.suse.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Anton Blanchard <anton@samba.org>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>


On 08/19/15 08:41, Michal Marek wrote:
> On Mon, Jul 13, 2015 at 08:59:33PM +1000, Anton Blanchard wrote:
>> Hi,
>>
>>>       > When the host's C compiler is clang, and when attempting to
>>>       > cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the
>>>       > Makefile would incorrectly detect the use of clang, which
>>>       > resulted in clang-specific flags being passed to
>>>       > mipsel-linux-gcc.
>>>       >
>>>       > This can be verified under Debian by installing the "clang"
>>>       > package, and then using it as the default compiler with:
>>>       > sudo update-alternatives --config cc
>>>       >
>>>       > This patch moves the detection of clang after the $(CC)
>>>       > variable is initialized to the name of the cross-compiler, so
>>>       > that the check applies
>>>       > to the cross-compiler and not the host's C compiler.
>>>       >
>>>       > v2: Move the detection of clang after the inclusion of the
>>>       > arch/*/Makefile (as they might set $(CROSS_COMPILE))
>>>       >
>>>       > Signed-off-by: Paul Cercueil <paul@crapouillou.net
>>>      <mailto:paul@crapouillou.net>>
>>>
>>>      Applied to kbuild.git#kbuild. I will push it after v4.1-rc1
>>>      becomes available, though.
>>>
>>> Drat. I wish I saw this earlier.
>>>
>>> This breaks patches which check for the value of COMPILER in
>>> arch/*/Makefile. This detection must be performed before the
>>> inclusion of the arch Makefile.
>>>
>>> Can I move this to after the initialization of CC but before the
>>> include?
>>>
>>> I'm not sure that being able to define the default compiler per arch
>>> is necessary. But I know I need to be able to add arch specific flags
>>> for clang.
>> I can confirm the patch breaks ppc64le clang builds.
> Can you try the (untested) patch below?
>
>
>  From 49bb3e66a9a7fc3685fb070bdfd31f2c3d78cc87 Mon Sep 17 00:00:00 2001
> From: Michal Marek <mmarek@suse.com>
> Date: Wed, 19 Aug 2015 17:36:41 +0200
> Subject: [PATCH] kbuild: Fix clang detection
>
> We cannot detect clang before including the arch Makefile, because that
> can set the default cross compiler. We also cannot detect clang after
> including the arch Makefile, because powerpc wants to know about clang.
> Solve this by using an deferred variable. This costs us a few shell
> invocations, but this is only a constant number.
>
> Reported-by: Behan Webster <behanw@converseincode.com>
> Reported-by: Anton Blanchard <anton@samba.org>
> Signed-off-by: Michal Marek <mmarek@suse.com>
> ---
>   Makefile                   | 9 +--------
>   arch/powerpc/Makefile      | 8 ++++----
>   scripts/Kbuild.include     | 4 ++++
>   scripts/Makefile.extrawarn | 2 +-
>   4 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 13270c0..5ccbb58 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -661,14 +661,7 @@ endif
>   endif
>   KBUILD_CFLAGS += $(stackp-flag)
>   
> -ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
> -COMPILER := clang
> -else
> -COMPILER := gcc
> -endif
> -export COMPILER
> -
> -ifeq ($(COMPILER),clang)
> +ifeq ($(cc-name),clang)
>   KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
>   KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
>   KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 05f464e..dfe88896 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -67,7 +67,7 @@ UTS_MACHINE := $(OLDARCH)
>   
>   ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
>   override CC	+= -mlittle-endian
> -ifneq ($(COMPILER),clang)
> +ifneq ($(cc-name),clang)
>   override CC	+= -mno-strict-align
>   endif
>   override AS	+= -mlittle-endian
> @@ -333,7 +333,7 @@ TOUT	:= .tmp_gas_check
>   # - Require gcc 4.0 or above on 64-bit
>   # - gcc-4.2.0 has issues compiling modules on 64-bit
>   checkbin:
> -	@if test "${COMPILER}" != "clang" \
> +	@if test "$(cc-name)" != "clang" \
>   	    && test "$(cc-version)" = "0304" ; then \
>   		if ! /bin/echo mftb 5 | $(AS) -v -mppc -many -o $(TOUT) >/dev/null 2>&1 ; then \
>   			echo -n '*** ${VERSION}.${PATCHLEVEL} kernels no longer build '; \
> @@ -342,14 +342,14 @@ checkbin:
>   			false; \
>   		fi ; \
>   	fi
> -	@if test "${COMPILER}" != "clang" \
> +	@if test "$(cc-name)" != "clang" \
>   	    && test "$(cc-version)" -lt "0400" \
>   	    && test "x${CONFIG_PPC64}" = "xy" ; then \
>                   echo -n "Sorry, GCC v4.0 or above is required to build " ; \
>                   echo "the 64-bit powerpc kernel." ; \
>                   false ; \
>           fi
> -	@if test "${COMPILER}" != "clang" \
> +	@if test "$(cc-name)" != "clang" \
>   	    && test "$(cc-fullversion)" = "040200" \
>   	    && test "x${CONFIG_MODULES}${CONFIG_PPC64}" = "xyy" ; then \
>   		echo -n '*** GCC-4.2.0 cannot compile the 64-bit powerpc ' ; \
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index d3437b8..3523df6 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -128,6 +128,10 @@ cc-option-align = $(subst -functions=0,,\
>   cc-disable-warning = $(call try-run,\
>   	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
>   
> +# cc-name
> +# Expands to either gcc or clang
> +cc-name = $(shell $(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
> +
>   # cc-version
>   cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
>   
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index f734033..4efedcb 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -56,7 +56,7 @@ endif
>   KBUILD_CFLAGS += $(warning)
>   else
>   
> -ifeq ($(COMPILER),clang)
> +ifeq ($(cc-name),clang)
>   KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
>   KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
>   KBUILD_CFLAGS += $(call cc-disable-warning, format)

Is there any reason you renamed COMPILER? Because it breaks all the 
other patches we have queued up which use it for cross compiling.

And aren't we supposed to use all caps for variable names?

This doesn't only break powerpc, it breaks arm, aarch64 and clang work 
that's being done on MIPS malta.

The big reason I wrote it the way I did was so other compilers could be 
added as well (as if-then-else stanzas).

I understand that the initial issue was that if /usr/bin/cc was clang 
things broke for MIPS, but that's just a temporal problem as we upstream 
clang support. Using gcc in the case were clang is the default compiler 
just muddies the waters IMHO. Wouldn't it be better to get people to 
explicitly specify the use of gcc on platforms which use clang by default?

     make CC=gcc

Which is similar to what we have to do to use clang on platforms which 
default to gcc. (make CC=clang)

In many ways I'd prefer to see ee4eb20dbce91751c248399e8a0cf9b8813adf5a 
reverted.

I just can't help thinking this is making things way more complicated 
than necessary.

Behan


-- 
Behan Webster
behanw@converseincode.com

