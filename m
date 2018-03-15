Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:34739 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750731AbeCOG11 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 02:27:27 -0400
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803141324420.28583@knanqh.ubzr>
References: <1521045861-22418-1-git-send-email-yamada.masahiro@socionext.com>
 <1521045861-22418-3-git-send-email-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1803141324420.28583@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 15 Mar 2018 15:26:41 +0900
Message-ID: <CAK7LNAQMLA9-wOJ5Tgr1tuOTox33544cty3rVzAxvvyGQgs5Dg@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: touch autoksyms.h when it is really missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jarod Wilson <jarod@redhat.com>, Prarit Bhargava <prarit@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-15 2:26 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> On Thu, 15 Mar 2018, Masahiro Yamada wrote:
>
>> From the comment, I expect this code creates autoksyms.h in case it
>> is missing, but it actually touches it when it does exists.
>
> Oops, indeed.
>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> I do not know when this code is useful...
>>
>> If autoksyms.h were missing, build should have already failed because
>> include/{linux,asm-generic}/export.h need it.
>>
>> Maybe for standalone test?
>> Or, in order to make this script self-contained?
>
> I agree it isn't very useful. Proof: it was wrong and wouldn't have
> worked as intended. So the best fix might be to simply remove that line.
>

OK, I will remove the code.




-- 
Best Regards
Masahiro Yamada
