Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv1-mh.provo.novell.com ([137.65.248.33]:44163 "EHLO
        prv1-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbeICPoJ (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
        Mon, 3 Sep 2018 11:44:09 -0400
Message-Id: <5B8D19E702000078001E487E@prv1-mh.provo.novell.com>
Date: Mon, 03 Sep 2018 05:24:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] kallsyms: reduce size a little on 64-bit
References: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com>
 <CAK7LNAQZw88d08wEn=S7mVgEz86djuig6MYMgT_hWwBU5jzrCA@mail.gmail.com>
In-Reply-To: <CAK7LNAQZw88d08wEn=S7mVgEz86djuig6MYMgT_hWwBU5jzrCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

>>> On 02.09.18 at 19:12, <yamada.masahiro@socionext.com> wrote:
> 2018-08-29 0:00 GMT+09:00 Jan Beulich <JBeulich@suse.com>:
>> --- 4.19-rc1/scripts/kallsyms.c
>> +++ 4.19-rc1-kallsyms-reduce-size/scripts/kallsyms.c
>> @@ -182,6 +182,8 @@ static int symbol_in_range(struct sym_en
>>         for (i = 0; i < entries; ++i) {
>>                 ar = &ranges[i];
>>
>> +               if (!ar->end)
>> +                       continue;
>>                 if (s->addr >= ar->start && s->addr <= ar->end)
>>                         return 1;
>>         }
> 
> 
> What is this hunk doing?
> 
> At least, I cannot understand it from the patch description.

Hmm, I agree, it looks like it is addressing an unrelated issue. I'll
re-submit with it dropped. The patch here dates back many
years, so I suppose I noticed this other issue at the same time,
but then forgot to split out the extra change.

Jan
