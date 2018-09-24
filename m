Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:35751 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728572AbeIXV3C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Sep 2018 17:29:02 -0400
Subject: Re: How to define some additional KBUILD_CFLAGS after building
 include/generated/asm-offsets.h ?
References: <e1b65467-7497-5db4-aa93-1ad00d12af3f@c-s.fr>
 <87mus75c5m.fsf@concordia.ellerman.id.au>
From: Christophe LEROY <christophe.leroy@c-s.fr>
Message-ID: <56227965-464a-d972-1c25-d6a4d190e1a1@c-s.fr>
Date: Mon, 24 Sep 2018 17:26:18 +0200
MIME-Version: 1.0
In-Reply-To: <87mus75c5m.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Segher Boessenkool <segher@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>



Le 24/09/2018 à 14:10, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> I'm trying to implement TLS based stack protector in the Linux Kernel.
>> For that I need to give to GCC the offset at which it will find the
>> canary (register r2 is pointing to the current task struct).
>>
>> I have been able to do it with the below patch, but it only works when
>> include/generated/asm-offsets.h already exists from the start of the build.
>>
>> Is there a way to evaluate CANARY_OFFSET and add the stack-protector
>> flags to KBUILD_FLAGS only after include/generated/asm-offsets.h is built ?
>>
>> Or another way of add -mstack-protector-guard-offset=offsetof(struct
>> task_struct, stack_canary) ?
> 
> This seems to work, at least I see the value in CFLAGS:
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 07d9dce..39ee113 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -404,6 +394,11 @@ archclean:
>   
>   archprepare: checkbin
>   
> +prepare: stack_protector_prepare
> +
> +stack_protector_prepare: prepare0
> +	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' include/generated/asm-offsets.h))
> +

Great, it works !
Thanks, I have sent v3 of the patches.

Christophe

>   # Use the file '.tmp_gas_check' for binutils tests, as gas won't output
>   # to stdout and these checks are run even on install targets.
>   TOUT	:= .tmp_gas_check
> 
> 
> cheers
> 
