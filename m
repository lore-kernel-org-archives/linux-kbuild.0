Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:48124 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbdJJJFT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 05:05:19 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNASvdFT8uttzNmiEUVk6rc=M0RC4Z=iOd9XjNnmqaYv7bw@mail.gmail.com>
References: <20171002105004.32426-1-jonas.gorski@gmail.com> <CAK7LNASvdFT8uttzNmiEUVk6rc=M0RC4Z=iOd9XjNnmqaYv7bw@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 10 Oct 2017 11:04:57 +0200
Message-ID: <CAOiHx=nUGDae1eB8aznBvR0Q8adV9s+nejvQ7E82KwPJz=qLcQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow making undefined symbols fatal for external modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Hi Masahiro,

On 9 October 2017 at 18:25, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-10-02 19:50 GMT+09:00 Jonas Gorski <jonas.gorski@gmail.com>:
>> By passing appropriate values in KBUILD_EXTRA_SYMBOLS it is possible to
>> make modpost be able to resolve all symbols for external modules, even
>> between to other external modules.
>>
>> Because of this, it might be desirable to make unresolved symbols an
>> error on external module builds as well, to catch missing exports there
>> as well.
>>
>> So add a new flag KBUILD_MODPOST_ERROR which can be set to enable this
>> behaviour. It has no effect on non external module builds.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> ---
>> The main target is to allow distributions (like LEDE) that make use of
>> kernel backports and other out of tree drivers to be able to catch
>> errors like missing EXPORT_SYMBOLs in the kernel early.
>>
>>  scripts/Makefile.modpost | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>> index 16923ba4b5b1..29f787bf8c3a 100644
>> --- a/scripts/Makefile.modpost
>> +++ b/scripts/Makefile.modpost
>> @@ -34,6 +34,8 @@
>>
>>  # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined
>>  # symbols in the final module linking stage
>> +# KBUILD_MODPOST_ERROR can be set to error out in case of undefined
>> +# symbols in the final module linking stage for external modules
>>  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
>>  # This is solely useful to speed up test compiles
>>  PHONY := _modpost
>> @@ -49,6 +51,8 @@ ifneq ($(KBUILD_EXTMOD),)
>>  obj := $(KBUILD_EXTMOD)
>>  src := $(obj)
>>
>> +KBUILD_MODPOST_WARN = $(if $(KBUILD_MODPOST_ERROR),,1)
>> +
>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>>  include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>>               $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>> @@ -78,7 +82,7 @@ modpost = scripts/mod/modpost                    \
>>   $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
>>   $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
>>   $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)  \
>> - $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
>> + $(if $(KBUILD_MODPOST_WARN),-w)
>>
>>  MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
>>
>
>
> The motivation looks reasonable to me,
> but having both KBUILD_MODPOST_WARN and KBUILD_MODPOST_ERROR
> is a bit confusing, I think.
>
> (Some people may wonder what would happen if both are set...)
>
>
> So, here is my suggestion.
>
>
> We have only KBUILD_MODPOST_WARN.
>
> The default value is 1 for external module building.
>                      0 for kernel building.
>
>
> If you want to change the default behavior,
> you can specify KBUILD_MODPOST_WARN=1 when building kernel,
> or KBUILD_MODPOST_WARN=0 when building external module
> from the command line.

Makes sense, I was thinking too complicated.

>
> Also, you need to update Documentation/kbuild/kbuild.txt

Indeed, I missed that. Will fix in v2.


Regards
Jonas
