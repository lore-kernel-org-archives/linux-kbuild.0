Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:19197 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752284AbdKNLxR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 06:53:17 -0500
Subject: Re: [PATCH v2] kbuild: comments correction & update on Makefile.host
References: <20171101014314.4575-1-caoj.fnst@cn.fujitsu.com>
 <CAK7LNARLhuk0=rgKjEDsO1gkrH-hLJaTyvZEHYm1-rCF_g0b3w@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <35acd1fe-29ff-10c4-3e3d-0cb7ae901175@cn.fujitsu.com>
Date: Tue, 14 Nov 2017 19:53:26 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNARLhuk0=rgKjEDsO1gkrH-hLJaTyvZEHYm1-rCF_g0b3w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Masahiro-san,

On 11/14/2017 06:31 PM, Masahiro Yamada wrote:
> Hi Cao,
> 
> 2017-11-01 10:43 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>>
>>  # C code
>> -# Executables compiled from a single .c file
>> +# C Executables compiled from a single .c file
> 
> 
> Is anything wrong with the current comment?
> 

Nothing wrong here, just make it looks the same style as its peer below.

>>  host-csingle   := $(foreach m,$(__hostprogs), \
>>                         $(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
>>
>> -# C executables linked based on several .o files
>> +# C executables compiled from several .c files, and only .c files
> 
> Your comment is even clearer, but
> I think the current comment is also true, at least.
> 

Yes, just make it more clearer and looks the same style as its peer above.

> host-cmulti is liked from .o files
> after each was compiled from .c
> 
> 

>>  # output directory for programs/.o files
>>  # hostprogs-y := tools/build may have been specified.
>> -# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
>> +# Retrieve also directory of .o files from host-cobjs and host-cxxobjs notation
>>  host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
>>
>>  host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
>> --
> 
> I am removing all host-objdirs stuff.
> I do not need this hunk.
> 

I forget your patches, sorry for the noise here.

-- 
Sincerely,
Cao jin


