Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:40692 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751377AbdKMJDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 04:03:01 -0500
Subject: Re: [PATCH RFC] kbuild: fixes in Makefile.lib
References: <20171110073504.13836-1-caoj.fnst@cn.fujitsu.com>
 <CAK7LNARtLpJKHJ3-izJ3AWi7uFJfsQWpdw+=7NkFE7hnsnm_8A@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <0f8b66f6-636f-d359-0e5d-95067abf028f@cn.fujitsu.com>
Date: Mon, 13 Nov 2017 17:03:09 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNARtLpJKHJ3-izJ3AWi7uFJfsQWpdw+=7NkFE7hnsnm_8A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On 11/13/2017 12:17 PM, Masahiro Yamada wrote:
> Hi Cao,
> 
> 

>>  scripts/Makefile.lib | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 580e605118e4..3209f303213b 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -22,7 +22,7 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
>>  # Determine modorder.
>>  # Unfortunately, we don't have information about ordering between -y
>>  # and -m subdirs.  Just put -y's first.
>> -modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
>> +modorder       := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y) $(obj-m) $(obj-m:.o=.ko))
> 
> 
> This change caused build error.
> 
> scripts/Makefile.lib:25: *** unterminated call to function 'patsubst':
> missing ')'.  Stop.
> 
> 
> And, this change is not necessary.
> 
> $(filter %/, $(obj-m)) is a subset of $(obj-m:.o=.ko)
> 

Ah huh! Yes

> 
>>  # Handle objects in subdirs
>>  # ---------------------------------------------------------------------------
>> @@ -49,7 +49,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
>>  # Build list of the parts of our composite objects, our composite
>>  # objects depend on those (obviously)
>>  multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
>> -multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
>> +multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))
>>  multi-objs   := $(multi-objs-y) $(multi-objs-m)
>>
>>  # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
> 
> 
> This is also build error.
> 
> scripts/Makefile.lib:52: *** unterminated call to function 'foreach':
> missing ')'.  Stop.
> 
> 
> Please test your patch before submitting.
> 

Sorry for my mistake，I missed to test the patch this time incredibly:(


> Assuming the build error will be fixed, this change is correct.
> 
> 
> 
> 
> Also, modname-multi should be fixed.
> 
> modname-multi = $(sort $(foreach m,$(multi-used),\
>                 $(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs))
> $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
> 

Yes, I also noticed here, but fail to remember it:(

Thanks very much, Masahiro-san!

-- 
Sincerely,
Cao jin


