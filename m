Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45573 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeLKQ34 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 11:29:56 -0500
Received: by mail-pf1-f195.google.com with SMTP id g62so7357119pfd.12
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Dec 2018 08:29:55 -0800 (PST)
Date: Tue, 11 Dec 2018 08:29:53 -0800 (PST)
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory headers are missing
In-Reply-To: <CAK7LNAS7hh4f8mYoZc7RUWStnchhftUN0nU5MJ_trjyNJx50Lw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-f63eb098-71bf-411a-9583-388234647f1e@palmer-si-x1c4>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: Christoph Hellwig <hch@infradead.org>, linux-kbuild@vger.kernel.org, sam@ravnborg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, michal.lkml@markovi.net

On Tue, 11 Dec 2018 04:59:26 PST (-0800), yamada.masahiro@socionext.com wrote:
> Hi Christoph,
>
>
> On Fri, Dec 7, 2018 at 12:04 AM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
>> > Some time ago, Sam pointed out a certain degree of overwrap between
>> > generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
>> >
>> > I a bit tweaked the meaning of mandatory-y; now it defines the minimum
>> > set of ASM headers that all architectures must have.
>> >
>> > If arch does not have specific implementation of a mandatory header,
>> > Kbuild will let it fallback to the asm-generic one by automatically
>> > generating a wrapper. This will allow to drop lots of redundant
>> > generic-y defines.
>> >
>> > Previously, "mandatory" was used in the context of UAPI, but I guess
>> > this can be extended to kernel space ASM headers.
>>
>> How useful is it to keep the generic-y behavior around at all vs making
>> everything useful mandatory?
>
>
> What I can tell is not all architectures
> support kvm_para.h, ucontext.h
>
> I guess they will stay as arch-specific generic-y,
> but I am not an expert in this area.
>
>
> kvm_para.h is missing csky, nds32, riscv.

It looks like RISC-V missed it and everyone else copied us.  I don't see any 
reason why the generic version wouldn't work on RISC-V, as it just has failures 
for all the calls.

> ucontext.h is missing in alpha, arm, m68k, parisc, sparc, xtensa
>
>
>
> bpf_perf_event.h could be promoted to mandatory-y ?
> All architectures have it.
