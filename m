Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23065 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731151AbeGRB2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jul 2018 21:28:31 -0400
MIME-Version: 1.0
In-Reply-To: <bd8bd678-c42d-4b04-fa55-00c6f524a4bb@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com> <CAK7LNAQ0dWqaYkLjevCuboCBovcsTV1cMh48qv__wwMZs-vAxg@mail.gmail.com>
 <bd8bd678-c42d-4b04-fa55-00c6f524a4bb@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 18 Jul 2018 09:52:17 +0900
Message-ID: <CAK7LNATtCz9FwELNOcrWHKp=5KSh+y68d5tjZbqnK=DCXVYFrQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

2018-07-13 2:08 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> On 07/12/2018 03:13 AM, Masahiro Yamada wrote:
>>
>> 2018-07-10 9:45 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>>
>>>
>>> Hi,
>>>
>>> This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
>>> environment. The changes are mostly minor fixups requested and also
>>> include documentation of the new options.
>>
>>
>>
>>
>> I checked this series.
>>
>>
>> I left minor comments for 3/7 and 7/7.
>>
>> Unless you disagree,
>> I will fix them up locally
>> and queue it to my tree.
>>
>
> The fixes look fine.
>


Applied to linux-kbuild. Thanks.


> Thanks,
> Laura
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
