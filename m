Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:56854 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753440AbZKCMQV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2009 07:16:21 -0500
Message-ID: <4AF01F18.8040807@tuffmail.co.uk>
Date: Tue, 03 Nov 2009 12:16:24 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 04/10] module: make MODULE_SYMBOL_PREFIX into a CONFIG
 option
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> 	<1257242782-10496-5-git-send-email-alan-jenkins@tuffmail.co.uk> <8bd0f97a0911030219y685a1dafy2a8e066d7132ac45@mail.gmail.com>
In-Reply-To: <8bd0f97a0911030219y685a1dafy2a8e066d7132ac45@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au

Mike Frysinger wrote:
> On Tue, Nov 3, 2009 at 05:06, Alan Jenkins wrote:
>   
>> The next commit will require the use of MODULE_SYMBOL_PREFIX in
>> .tmp_exports-asm.S.  Currently it is mixed in with C structure
>> definitions in "asm/module.h".  Move the definition of this arch option
>> into Kconfig, so it can be easily accessed by any code.
>>
>> This also lets modpost.c use the same definition.  Previously modpost
>> relied on a hardcoded list of architectures in mk_elfconfig.c.
>>     
>
> this should also let us push VMLINUX_SYMBOL() out of
> arch/*/kernel/vmlinux.lds.S and into asm-generic/vmlinux.lds.h ...
>
>   
>> A build test for blackfin, one of the two MODULE_SYMBOL_PREFIX archs,
>> showed the generated code was unchanged.  vmlinux was identical save
>> for build ids, and an apparently randomized suffix on a single "__key"
>> symbol in the kallsyms data).
>>     
>
> when you get localized (static) namespace collisions, the linker
> automatically does that
>
>   
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1171,6 +1171,17 @@ config MODULE_SRCVERSION_ALL
>>
>>  endif # MODULES
>>
>> +config HAVE_SYMBOL_PREFIX
>> +       bool
>> +       help
>> +         Some arch toolchains use a `_' prefix for all user symbols.
>> +         This option will be taken into account when loading modules.
>> +
>> +config SYMBOL_PREFIX
>> +       string
>> +       default "_" if HAVE_SYMBOL_PREFIX
>> +       default ""
>>     
>
> in practice, the symbol prefix is an underscore.  but there is no
> technical limitation here -- the toolchain could use whatever prefix
> they wanted
>
> so if the Kconfig option was pushed to arch/*/Kconfig, we could drop
> HAVE_SYMBOL_PREFIX and let the arch declare the exact SYMBOL_PREFIX
> value itself
> -mike
>   

I don't think that's possible.

    #define VMLINUX_SYMBOL(_sym_) _##_sym_

I don't know any "unstringify" operation.  So I can't convert a string 
value of CONFIG_SYMBOL_PREFIX to the unquoted underscore we neeed for 
this macro.  The same applies for the SYM() macro I use.  Currently it 
assumes the prefix is a single underscore:

    #ifdef HAVE_SYMBOL_PREFIX
    #define __SYM(sym) _##sym
    #else
    #define __SYM(sym) sym
    #endif

If we positively want to keep the generality, I guess I should put 
MODULE_SYMBOL_PREFIX in a header file of it's own.  The disadvantage is 
that it makes it inaccessible to host programs again, like modpost 
(which currently hardcodes the list of affected architectures in 
mk_elfconfig.c).

Personally I favour "look, a small cleanup!" against "who knows what 
crazy things the next toolchain will do".  Of course I'm open to being 
outvoted by experience :).

Regards
Alan
