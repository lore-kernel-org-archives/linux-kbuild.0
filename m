Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52256 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbeI0Ll7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Sep 2018 07:41:59 -0400
MIME-Version: 1.0
In-Reply-To: <87bm8m5qbs.fsf@concordia.ellerman.id.au>
References: <e1b65467-7497-5db4-aa93-1ad00d12af3f@c-s.fr> <87mus75c5m.fsf@concordia.ellerman.id.au>
 <56227965-464a-d972-1c25-d6a4d190e1a1@c-s.fr> <87bm8m5qbs.fsf@concordia.ellerman.id.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 27 Sep 2018 14:24:48 +0900
Message-ID: <CAK7LNAQA2JyK9aOp9QQF32bwsz2MitaZ5HrqSVjdEvRdCQpO3g@mail.gmail.com>
Subject: Re: How to define some additional KBUILD_CFLAGS after building
 include/generated/asm-offsets.h ?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe LEROY <christophe.leroy@c-s.fr>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Segher Boessenkool <segher@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>

Hi.

2018-09-25 10:16 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
> Christophe LEROY <christophe.leroy@c-s.fr> writes:
>
>> Le 24/09/2018 =C3=A0 14:10, Michael Ellerman a =C3=A9crit :
>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>
>>>> I'm trying to implement TLS based stack protector in the Linux Kernel.
>>>> For that I need to give to GCC the offset at which it will find the
>>>> canary (register r2 is pointing to the current task struct).
>>>>
>>>> I have been able to do it with the below patch, but it only works when
>>>> include/generated/asm-offsets.h already exists from the start of the b=
uild.
>>>>
>>>> Is there a way to evaluate CANARY_OFFSET and add the stack-protector
>>>> flags to KBUILD_FLAGS only after include/generated/asm-offsets.h is bu=
ilt ?
>>>>
>>>> Or another way of add -mstack-protector-guard-offset=3Doffsetof(struct
>>>> task_struct, stack_canary) ?
>>>
>>> This seems to work, at least I see the value in CFLAGS:
>>>
>>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>>> index 07d9dce..39ee113 100644
>>> --- a/arch/powerpc/Makefile
>>> +++ b/arch/powerpc/Makefile
>>> @@ -404,6 +394,11 @@ archclean:
>>>
>>>   archprepare: checkbin
>>>
>>> +prepare: stack_protector_prepare
>>> +
>>> +stack_protector_prepare: prepare0
>>> +    $(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D$(shell=
 awk '{if ($$2 =3D=3D "TSK_STACK_CANARY") print $$3;}' include/generated/as=
m-offsets.h))
>>> +
>>
>> Great, it works !
>> Thanks, I have sent v3 of the patches.
>
> Cool.
>
> It would be good to here from someone who knows Kbuild better than me if
> this is acceptable or just a gross hack :)


I am fine with this solution.

Thanks.



--=20
Best Regards
Masahiro Yamada
