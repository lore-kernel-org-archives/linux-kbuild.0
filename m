Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49402 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752440AbeGEJHT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 05:07:19 -0400
MIME-Version: 1.0
In-Reply-To: <87po02zmxt.fsf@notabene.neil.brown.name>
References: <152929708853.17463.17302660556961083137.stgit@noble>
 <152929772052.17463.10728056000221362647.stgit@noble> <CAK7LNAR2n_Kf7HEwWgLwH8sjyVAiJUWkvV7ZAbkNn0KgVTUx1Q@mail.gmail.com>
 <87efgk0xx7.fsf@notabene.neil.brown.name> <CAK7LNAS22VUQytcX=BQt48qeAn9Rq00Sb555Gu98J+=8R_3OVA@mail.gmail.com>
 <87po02zmxt.fsf@notabene.neil.brown.name>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Jul 2018 18:06:26 +0900
Message-ID: <CAK7LNAT9deaBb0aiFW+00G-S4FTVdN5GX-n3HbEUR07nzHQUmQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: disable KBUILD_MODNAME when building for mod.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: NeilBrown <neilb@suse.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-07-05 6:54 GMT+09:00 NeilBrown <neilb@suse.com>:
> On Wed, Jul 04 2018, Masahiro Yamada wrote:
>
>> 2018-07-04 7:14 GMT+09:00 NeilBrown <neilb@suse.com>:
>>>
>>> Where I've been using these patches I've sometimes been adding
>>>
>>>   ccflags-y += -DKBUILD_MODNAME='"FOO"'
>>>
>>> to Makefiles so that modules_params get handled correctly on non-module
>>> builds.  I've thought about instead allowing "modobj-name" to be defined
>>> and requiring that it be set if either modobj-[yn] is set.  Then it gets
>>> used for the KBUILD_MODNAME when building modobj modules.
>>>
>>> Would you prefer to always require KBUILD_MODNAME, or to use a default
>>> name for dynamic-debug?
>>>
>>> Thanks,
>>> NeilBrown
>>
>>
>> I prefer flat directory structure for modules.
>> Most of modules fit in a single directory.
>
> I'd prefer that too in general.
> But some modules are bigger than others and some times it helps to
> sub-divide a module.
> xfs, btrfs, ceph, net/dccp, and lustre all already use multiple
> directories despite the poor support, so clearly some developers
> like a more structured approach to organizing their code.
> Wouldn't it be good to allow them to make full use of the kbuild system?


xfs is quite big, but the others are not too bad.
You can collect files into a single directory if you want.
If you mind the namespace, one tip might be to group files with prefix.
For example,

  drivers/btrfs/tests/foo.o  ->  drivers/btrfs/test-foo.o

I do not want to introduce a mess to core build scripts.


> Thanks,
> NeilBrown



-- 
Best Regards
Masahiro Yamada
