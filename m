Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:4207 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753711AbdJIDoF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 23:44:05 -0400
Subject: Re: [PATCH] kbuild: comments cleanup in Makefile.lib
References: <1505820967-17302-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNASc52YJKyowkgy9=82L-SQc3TKUmhaapNcRFoXx81umcA@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <59DAF04B.2050601@cn.fujitsu.com>
Date: Mon, 9 Oct 2017 11:43:07 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNASc52YJKyowkgy9=82L-SQc3TKUmhaapNcRFoXx81umcA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Masahiro-san,

On 10/04/2017 12:58 PM, Masahiro Yamada wrote:
> Hi Cao,
> 
> 
> 2017-09-19 20:36 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> It has:
>> 1. Move comments close to what it want to comment.
>> 2. Comments cleanup & improvement.
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>


>>
>> -# if $(foo-objs) exists, foo.o is a composite object
>> +# if $(foo-objs) or $(foo-y) or $(foo-m) exists, foo.o is a composite object
> 
> 
> Nit:
> 
> "if $(foo-objs), $(foo-y), or $(foo-m) exists" will be better.
> 

Yes, true.

>>  multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
>>  multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
>>  multi-used   := $(multi-used-y) $(multi-used-m)
>> @@ -90,7 +84,6 @@ subdir-ym     := $(addprefix $(obj)/,$(subdir-ym))
>>  obj-dirs       := $(addprefix $(obj)/,$(obj-dirs))
>>
>>  # These flags are needed for modversions and compiling, so we define them here
>> -# already
>>  # $(modname_flags) #defines KBUILD_MODNAME as the name of the module it will
> 
> 
> I am not sure if "#defines" is intentional or not.
> I think "#" is unnecessary.
> 

Yes, agree with you

-- 
Sincerely,
Cao jin


