Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:48470 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751274AbdFFIsq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2017 04:48:46 -0400
Subject: Re: [PATCH] Top Makefile: tiny correction on `make help`
References: <1496028061-19285-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNAQ_OOvmCU6jdg+VNnWnZRzjeZ99Uz8o_2yDnMM+i=g=kg@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <59366D02.3020604@cn.fujitsu.com>
Date: Tue, 6 Jun 2017 16:51:14 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ_OOvmCU6jdg+VNnWnZRzjeZ99Uz8o_2yDnMM+i=g=kg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Mr Masahiro,

On 06/06/2017 09:47 AM, Masahiro Yamada wrote:
> Hi Cao,
> 
> 
> 2017-05-29 12:21 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> The help info of `make -C=1` is little confusing, make it clear.
> 
> `make C=1` instead of `make -C=1`
> 
> 
> 
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index efa267a..b34a34d 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1417,7 +1417,7 @@ help:
>>         @echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
>>         @echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
>>         @echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
>> -       @echo  '  make C=1   [targets] Check all c source with $$CHECK (sparse by default)'
>> +       @echo  '  make C=1   [targets] Check re-compiled c source only with $$CHECK (sparse by default)'
>>         @echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
>>         @echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
>>         @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
> 
> Which phrase is qualified by "only"?
> 
> [1] re-compiled c source only
> [2] only with $$CHECK
> 
> I know [1] is what you mean (sorry for my nitpicking).
> 

You are right, after reading it again, I myself have the same feeling as
you...

> 
> Perhaps, "Check only re-compiled c source with $$CHECK" is even clearer?
> 
> (or, just drop "only" because "re-compiled c source" is understandable enough ?)

I prefer the latter one.

> 
> 
> Could you use "kbuild: " instead of "Top Makefile" in the subject?
> 

Sure.
Thanks very much for your suggestion:)

-- 
Sincerely,
Cao jin


