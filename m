Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:35551 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752102AbdFMIbW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 04:31:22 -0400
MIME-Version: 1.0
In-Reply-To: <638b79cf-a0e8-7986-d8b4-26d3a3808ec4@suse.com>
References: <20170613005531.77656-1-mka@chromium.org> <20170613005531.77656-2-mka@chromium.org>
 <638b79cf-a0e8-7986-d8b4-26d3a3808ec4@suse.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Jun 2017 10:31:21 +0200
Message-ID: <CAK8P3a0NspZv+XPSzsaXhEy3WQ6X8-fnfQf1WV+-LV0Nn9jsmw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Add cc-option-no-kbuild macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

On Tue, Jun 13, 2017 at 9:49 AM, Michal Marek <mmarek@suse.com> wrote:
> On 2017-06-13 02:55, Matthias Kaehlcke wrote:
>> cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
>> whether an option is supported or not. This is fine for options used to
>> build the kernel itself, however some components like the x86 boot code
>> use a different set of flags.
>>
>> Add the new macro cc-option-no-kbuild which does the same as cc-option
>> except that it has an additional parameter with the compiler options
>> which are used instead of KBUILD_CFLAGS and KBUILD_CPPFLAGS.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  scripts/Kbuild.include | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index 61f87a99bf0a..d9fdc740105f 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -128,6 +128,11 @@ cc-option-yn = $(call try-run,\
>>  cc-option-align = $(subst -functions=0,,\
>>       $(call cc-option,-falign-functions=0,-malign-functions=0))
>>
>> +# cc-option-no-kbuild
>> +# Usage: cflags-no-kbuild-y += $(call cc-option-no-kbuild,<other flags>,-march=winchip-c6,-march=i586)
>> +cc-option-no-kbuild = $(call try-run,\
>> +     $(CC) -Werror $(filter-out $(GCC_PLUGINS_CFLAGS),$(1)) $(2) -c -x c /dev/null -o "$$TMP",$(2),$(3))
>
> As this is a version of cc-option with an extrra argument, how about
> implementing cc-option as a shorthand for cc-option-no-kbuild? It would
> make it more obvious what cc-option-no-kbuild does differently (it's
> probably just me, but I was unable to infer the semantics from its name).

Agreed, also the hostcc-option could be based on the same I think, if we
also make the $(CC) an argument of the low-level helper.

For reference, these seem to be the files that might be affected here,
as they override KBUILD_CFLAGS:

$ git grep -w KBUILD_CFLAGS.*:
arch/cris/Makefile:KBUILD_CFLAGS := $(subst
-fomit-frame-pointer,,$(KBUILD_CFLAGS)) -g
arch/ia64/Makefile:KBUILD_CFLAGS_KERNEL := -mconstant-gp
arch/m68k/Makefile:KBUILD_CFLAGS := $(subst
-fomit-frame-pointer,,$(KBUILD_CFLAGS)) -g
arch/mips/boot/compressed/Makefile:KBUILD_CFLAGS := $(filter-out -pg,
$(KBUILD_CFLAGS))
arch/mips/boot/compressed/Makefile:KBUILD_CFLAGS := $(filter-out
-fstack-protector, $(KBUILD_CFLAGS))
arch/mips/boot/compressed/Makefile:KBUILD_CFLAGS := $(KBUILD_CFLAGS)
-D__KERNEL__ \
arch/mips/vdso/Makefile:$(obj-vdso): KBUILD_CFLAGS := $(cflags-vdso)
$(native-abi)
arch/mips/vdso/Makefile:$(obj-vdso-o32): KBUILD_CFLAGS :=
$(cflags-vdso) -mabi=32
arch/mips/vdso/Makefile:$(obj-vdso-n32): KBUILD_CFLAGS :=
$(cflags-vdso) -mabi=n32
arch/s390/boot/compressed/Makefile:KBUILD_CFLAGS := -m64 -D__KERNEL__ -O2
arch/s390/kernel/vdso32/Makefile:KBUILD_CFLAGS_31 := $(filter-out
-m64,$(KBUILD_CFLAGS))
arch/s390/kernel/vdso64/Makefile:KBUILD_CFLAGS_64 := $(filter-out
-m64,$(KBUILD_CFLAGS))
arch/tile/kernel/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
-m64,$(KBUILD_CFLAGS))
arch/x86/boot/Makefile:KBUILD_CFLAGS    := $(REALMODE_CFLAGS) -D_SETUP
arch/x86/boot/compressed/Makefile:KBUILD_CFLAGS := -m$(BITS) -D__KERNEL__ -O2
arch/x86/entry/vdso/Makefile:$(vobjs): KBUILD_CFLAGS := $(filter-out
$(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
arch/x86/entry/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
-m64,$(KBUILD_CFLAGS))
arch/x86/entry/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
-mcmodel=kernel,$(KBUILD_CFLAGS_32))
arch/x86/entry/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
-fno-pic,$(KBUILD_CFLAGS_32))
arch/x86/entry/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
-mfentry,$(KBUILD_CFLAGS_32))
arch/x86/entry/vdso/Makefile:KBUILD_CFLAGS_32 := $(filter-out
$(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS_32))
arch/x86/purgatory/Makefile:KBUILD_CFLAGS := -fno-strict-aliasing
-Wall -Wstrict-prototypes -fno-zero-initialized-in-bss -fno-builtin
-ffreestanding -c -MD -Os -mcmodel=large
arch/x86/realmode/rm/Makefile:KBUILD_CFLAGS     := $(REALMODE_CFLAGS)
-D_SETUP -D_WAKEUP \
drivers/firmware/efi/libstub/Makefile:KBUILD_CFLAGS
 := $(cflags-y) -DDISABLE_BRANCH_PROFILING \

        Arnd
