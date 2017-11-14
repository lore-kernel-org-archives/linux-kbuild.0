Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:24050 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbdKNJJE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 04:09:04 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1711140735020.2332@hadrien>
References: <1510210850-28866-1-git-send-email-yamada.masahiro@socionext.com>
 <alpine.DEB.2.20.1711131628370.20333@hadrien> <CAK7LNASpxfq6Vg42rogQg1bixNL15O=8152=KJEnKQA=Ez6Dxw@mail.gmail.com>
 <alpine.DEB.2.20.1711131744290.20292@hadrien> <CAK7LNAQS02azxxMZqTYvsuixOjWVeur1RGLJNmSBHsDkZ=mjbw@mail.gmail.com>
 <alpine.DEB.2.20.1711140735020.2332@hadrien>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 18:08:16 +0900
Message-ID: <CAK7LNAQ7Xr6Sff-WeV4_XMCHe-E3D2=3AUOyD3rXWcHvNb90Fw@mail.gmail.com>
Subject: Re: [PATCH v2] coccinelle: fix parallel build with CHECK=scripts/coccicheck
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Julia,


2017-11-14 15:44 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>
>
> On Tue, 14 Nov 2017, Masahiro Yamada wrote:
>
>> Hi Julia,
>>
>> 2017-11-14 1:45 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>> >
>> >
>> > On Tue, 14 Nov 2017, Masahiro Yamada wrote:
>> >
>> >> Hi Julia,
>> >>
>> >>
>> >> 2017-11-14 0:30 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>> >> >
>> >> >
>> >> > On Thu, 9 Nov 2017, Masahiro Yamada wrote:
>> >> >
>> >> >> The command "make -j8 C=1 CHECK=scripts/coccicheck" produces lots of
>> >> >> "coccicheck failed" error messages.
>> >> >>
>> >> >> I do not know the coccinelle internals, but I guess --jobs does not
>> >> >> work well if spatch is invoked from Make running in parallel.
>> >> >> Disable --jobs in this case.
>> >> >
>> >> > Why is this change under:
>> >> >
>> >> > if [ "$C" = "1" -o "$C" = "2" ];
>> >> >
>> >> > The coccicheck failed messages come also if one runs Coccinelle on the
>> >> > entire kernel.
>> >>
>> >> As far as I tested, "coccicheck failed" error only happens
>> >> when ONLINE=1.
>> >>
>> >>
>> >> make -j8 C=1 CHECK=scripts/coccicheck  COCCI=scripts/coccinelle/misc/bugon.cocci
>> >>
>> >> emits lots of errors.
>> >>
>> >>
>> >> make -j8 coccicheck  COCCI=scripts/coccinelle/misc/bugon.cocci
>> >>
>> >> is fine.
>> >>
>> >>
>> >> Have you tested it?
>> >> Do you mean you got a different result from mine?
>> >
>> > I agree with your results, with respect to the number of errors.
>> >
>> > julia
>> >
>>
>> So, what shall we do?
>>
>> If you do not like to fix it (or you can fix coccinelle itself),
>> I can take back this patch.
>
> I'm OK with your fix.  I will check and ack it today.
>
>> I am not a coccinelle developer, so
>> setting USE_JOBS="no" is the best I can do.
>
> The problem on the Coccinelle side is that it uses a subdirectory with the
> name of the semantic patch to store standard output and standard error for
> the different threads.  I didn't want to use a name with the pid, so that
> one could easily find this information while Coccinelle is running.
> Normally the subdirectory is cleaned up when Coccinelle completes, so
> there is only one of them at a time.  Maybe it is best to just add the
> pid.  There is the risk that these subdirectories will accumulate if
> Coccinelle crashes in a way such that they don't get cleaned up, but
> Coccinelle could print a warning if it detects this case, rather than
> failing.
>
> Still I think it is useful to do something on the make coccicheck side,
> because there is no need for the double layer of parallelism.
>


Thanks a lot for detailed explanation!

I brushed up my patch.

Could you check v3, please?


-- 
Best Regards
Masahiro Yamada
