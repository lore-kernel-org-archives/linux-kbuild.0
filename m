Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44290 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751377AbdKMHZg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 02:25:36 -0500
MIME-Version: 1.0
In-Reply-To: <83744f82-8800-7c67-df58-e8925c8d50a3@cn.fujitsu.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-5-git-send-email-yamada.masahiro@socionext.com> <83744f82-8800-7c67-df58-e8925c8d50a3@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 Nov 2017 16:24:36 +0900
Message-ID: <CAK7LNAT7_nJUOUkrjwwacR_j4m0AJTvdhFZWbD51RXTH8GpRmw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: optimize object directory creation for
 incremental build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>

Hi Cao,


2017-11-10 19:58 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Masahiro-san
>
> On 11/09/2017 11:41 PM, Masahiro Yamada wrote:
>> The previous commit largely optimized the object directory creation.
>> We can optimize it more for incremental build.
>>
>> There are already *.cmd files in the output directory.  The existing
>> *.cmd files have been picked up by $(wildcard ...).  Obviously,
>> directories containing them exist too, so we can skip "mkdir -p".
>>
>> With this, Kbuild runs almost zero "mkdir -p" in incremental building.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  scripts/Makefile.build | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 89ac180..90ea7a5 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -583,8 +583,13 @@ endif
>>  ifneq ($(KBUILD_SRC),)
>>  # Create directories for object files if directory does not exist
>>  obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
>> +# If cmd_files exist, their directories apparently exist.  Skip mkdir.
>> +exist-dirs := $(sort $(patsubst %/,%, $(dir $(cmd_files))))
>> +obj-dirs := $(strip $(filter-out . $(exist-dirs), $(obj-dirs)))
>
> First I am not sure if the dot "." here is necessary, because I guess
> kbuild always descend into subdir do recursive make, so, very
> $(cmd_files) should have at least 1 level dir.


The top level Makefile descends into ./Kbuild

prepare0: archprepare gcc-plugins
        $(Q)$(MAKE) $(build)=.

So, it is possible to have 0 level dir.






> Second, Assuming that "." probably exists,

Right "." always exists.  That's way I filtered it out.


> would it be "./"? because it
> is what "dir" function returns.

No.
You missed  $(patsubst %/,%, ...)


Having said that, "." generally comes from phony targets
and I think I can fix it in a more correct way.
I will remove "." from v2.


> --
> Sincerely,
> Cao jin
>
>> +ifneq ($(obj-dirs),)
>>  $(shell mkdir -p $(obj-dirs))
>>  endif
>> +endif
>>
>
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
