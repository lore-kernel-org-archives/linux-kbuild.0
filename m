Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41706 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731594AbeISUeA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Sep 2018 16:34:00 -0400
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=d4FdFzqimdq1os4gkk2JeeC4_-_ZbxVdkkPwd3KmuuQ@mail.gmail.com>
References: <20180917073754.24048-1-joel@jms.id.au> <CAKwvOd=d4FdFzqimdq1os4gkk2JeeC4_-_ZbxVdkkPwd3KmuuQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Sep 2018 23:54:44 +0900
Message-ID: <CAK7LNAT9L==YS0a7FwuHTVaft2ONGd1b=GVExRrCYeLzW0sasw@mail.gmail.com>
Subject: Re: [PATCH] ftrace: Build with CPPFLAGS to get -Qunused-arguments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joel Stanley <joel@jms.id.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-09-18 2:24 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> On Mon, Sep 17, 2018 at 12:38 AM Joel Stanley <joel@jms.id.au> wrote:
>>
>> When building to record the mcount locations the kernel uses
>> KBUILD_CFLAGS but not KBUILD_CPPFLAGS. This means it lacks
>> -Qunused-arguments when building with clang, resulting in a lot of
>> noisy warnings.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> Not sure why -Qunused-arguments is in CPP instead of KBUILD_CFLAGS. We
>> could instead put it in KBUILD_CFLAGS, and not need this patch.
>
> The preprocessor has flags that can change the definitions of macros.
> So there might be unused flags there.  I'm not a fan of covering up
> those warnings via -Qunused-arguments; the flags should be feature
> detected via cc-option and friends rather than always added then
> silenced if excessive.  That hides flags that are long dead/unused.
>
> Thanks for this patch!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
>>
>>  scripts/Makefile.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>


Applied to linux-kbuild/fixes. Thanks!


-- 
Best Regards
Masahiro Yamada
