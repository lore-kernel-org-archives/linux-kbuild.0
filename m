Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51726 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933214AbeGDMJ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 08:09:28 -0400
MIME-Version: 1.0
In-Reply-To: <87efgk0xx7.fsf@notabene.neil.brown.name>
References: <152929708853.17463.17302660556961083137.stgit@noble>
 <152929772052.17463.10728056000221362647.stgit@noble> <CAK7LNAR2n_Kf7HEwWgLwH8sjyVAiJUWkvV7ZAbkNn0KgVTUx1Q@mail.gmail.com>
 <87efgk0xx7.fsf@notabene.neil.brown.name>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Jul 2018 21:08:43 +0900
Message-ID: <CAK7LNAS22VUQytcX=BQt48qeAn9Rq00Sb555Gu98J+=8R_3OVA@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: disable KBUILD_MODNAME when building for mod.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: NeilBrown <neilb@suse.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-07-04 7:14 GMT+09:00 NeilBrown <neilb@suse.com>:
> On Wed, Jun 27 2018, Masahiro Yamada wrote:
>
>> 2018-06-18 13:55 GMT+09:00 NeilBrown <neilb@suse.com>:
>>> When building an object to be included in mod.a we
>>> cannot know the name of the module.  So don't define
>>> KBUILD_MODNAME.  This will ensure attempt to use
>>> that macro when the module name isn't know will
>>> trigger an error.
>>
>> Honestly, I hate KBUILD_MODNAME.
>>
>> If KBUILD_MODNAME is undefined,
>> you cannot call pr_debug() in the sub-directory for example.
>
> I think this is only true if you have something like
>
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> in your .c files.  Developers who use modobj-m could be advised not to
> do this.
>
>>
>> CONFIG_DYNAMIC_DEBUG requires KBUILD_MODNAME,
>> but people often miss to notice that, then cause build errors.
>
> Yes, I can see that.
> We could change it to use a default ("no-name") if KBUILD_MODNAME isn't
> defined.  Or we could require that KBUILD_MODNAME always be defined.
>
> Where I've been using these patches I've sometimes been adding
>
>   ccflags-y += -DKBUILD_MODNAME='"FOO"'
>
> to Makefiles so that modules_params get handled correctly on non-module
> builds.  I've thought about instead allowing "modobj-name" to be defined
> and requiring that it be set if either modobj-[yn] is set.  Then it gets
> used for the KBUILD_MODNAME when building modobj modules.
>
> Would you prefer to always require KBUILD_MODNAME, or to use a default
> name for dynamic-debug?
>
> Thanks,
> NeilBrown


I prefer flat directory structure for modules.
Most of modules fit in a single directory.


-- 
Best Regards
Masahiro Yamada
