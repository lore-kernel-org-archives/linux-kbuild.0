Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62345 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751943AbdC2CHq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Mar 2017 22:07:46 -0400
MIME-Version: 1.0
In-Reply-To: <20170314213724.3836900-1-arnd@arndb.de>
References: <20170314213410.3762842-1-arnd@arndb.de> <20170314213724.3836900-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 29 Mar 2017 11:07:16 +0900
Message-ID: <CAK7LNARWnDW5GqF_nAy=etwSLfL5XZ4zWB_UEkBdd5M88iS1UA@mail.gmail.com>
Subject: Re: [PATCH] [SUBMITTED 20170314] [v333kbuild: disable
 -ffunction-sections on gcc-4.7 with ftrace
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung.with.foss@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Arnd,


2017-03-15 6:37 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> When ftrace is enabled and we build with gcc-4.7 or older, we
> get a warning for each file on architectures that select
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:
>
> warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]
>
> This turns off function sections in that specific case, leaving
> it enabled for all other configurations.
>
> Fixes: b67067f1176d ("kbuild: allow archs to select link dead code/data elimination")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Namhyung Kim <namhyung.with.foss@gmail.com>
> ---
> v2: accidentally resend the same patch as before
> v3: send the exact same patch once more, without doing the change I wanted
> v4: actually fixed version number in check as pointed out by Namhyung Kim (I hope)
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 6e7e644a0b84..3a964fa3a787 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -662,7 +662,11 @@ KBUILD_CFLAGS      += -Wextra
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>
>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> +ifdef CONFIG_FUNCTION_TRACER
> +KBUILD_CFLAGS  += $(call cc-ifversion, -ge,0408,$(call cc-option,-ffunction-sections,))
> +else
>  KBUILD_CFLAGS  += $(call cc-option,-ffunction-sections,)
> +endif
>  KBUILD_CFLAGS  += $(call cc-option,-fdata-sections,)
>  endif
>


I have two questions.

[1]
How did you produce this warning?
I do not see any architecture that selects this option at this point of time.

Did you edit Kconfig locally to select LD_DEAD_CODE_DATA_ELIMINATION?
If so, is this patch not so urgent as the "Fixes" tag claims?


[2]
This question is more technical.

The cause of the problem seems that GCC warns it cannot support the
two at the same time,
but it does handle it as an error.  So, cc-option assumes this
combination is OK.

Is it a good idea to add -Werror to cc-option checking?

In my local test, the following patch solved this specific case.

You contribute a lot for compile-test,
so I'd like you to see if it has side-effects.




diff --git a/Makefile b/Makefile
index 231e6a7..5850850 100644
--- a/Makefile
+++ b/Makefile
@@ -632,11 +632,6 @@ include arch/$(SRCARCH)/Makefile
 KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)

-ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
-KBUILD_CFLAGS  += $(call cc-option,-ffunction-sections,)
-KBUILD_CFLAGS  += $(call cc-option,-fdata-sections,)
-endif
-
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)
 else
@@ -767,6 +762,11 @@ ifdef CONFIG_DEBUG_SECTION_MISMATCH
 KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif

+ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+KBUILD_CFLAGS  += $(call cc-option,-ffunction-sections,)
+KBUILD_CFLAGS  += $(call cc-option,-fdata-sections,)
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d6ca649..558d4f1 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -116,12 +116,12 @@ CC_OPTION_CFLAGS = $(filter-out
$(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)

 cc-option = $(call try-run,\
-       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
/dev/null -o "$$TMP",$(1),$(2))
+       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
-x c /dev/null -o "$$TMP",$(1),$(2))

 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-       $(CC) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c
/dev/null -o "$$TMP",y,n)
+       $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c
-x c /dev/null -o "$$TMP",y,n)

 # cc-option-align
 # Prefix align with either -falign or -malign


-- 
Best Regards
Masahiro Yamada
