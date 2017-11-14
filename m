Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49834 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752436AbdKNLOl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 06:14:41 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1711141208200.2874@hadrien>
References: <1510650290-3363-1-git-send-email-yamada.masahiro@socionext.com>
 <alpine.DEB.2.20.1711141047350.2874@hadrien> <CAK7LNAQ11bf1+=AYVsGfZ+vs-1P0fGCm-2y-qjgKi=KK7-+iSA@mail.gmail.com>
 <alpine.DEB.2.20.1711141208200.2874@hadrien>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 20:13:43 +0900
Message-ID: <CAK7LNASwSgk4wjp-Mn0Ar9vw2oKURtje5gu2uDB4sTHxAAuq_w@mail.gmail.com>
Subject: Re: [PATCH v3] coccinelle: fix parallel build with CHECK=scripts/coccicheck
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, cocci@systeme.lip6.fr, Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2017-11-14 20:09 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>
>
> On Tue, 14 Nov 2017, Masahiro Yamada wrote:
>
>> Hi Julia,
>>
>>
>> 2017-11-14 18:49 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
>> >> +
>> >> +    # If -j option is given to Make, scripts/coccicheck runs in parallel.
>> >> +    # If coccinelle also runs in parallel, it fails because multiple processes
>> >> +    # try to get access to the same subdirectory that stores stdout/stderr.
>> >> +    # No need to parallelize coccinelle in this case - this mode takes only
>> >> +    # one file input.
>> >> +    NPROC=1
>> >
>> > Since I am also changing Coccinelle to avoid the problem, maybe it would
>> > be better to just remove the explanation sentence (If coccinelle also runs
>> > in parallel,...).
>> >
>> > julia
>>
>> OK.  Which lines are unneeded?
>>
>> Is it OK to remove all the comments, then just add "NPROC=1"?
>
> How about keeping "# No need to parallelize coccinelle in this case - this
> mode takes only one file input."?

Fair enough.

I will send v4 shortly.



> But if you think it is obvious, it would be ok to remove it also.  Someone
> can always do git blame and read the commit message if they have
> questions.
>
> julia
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
