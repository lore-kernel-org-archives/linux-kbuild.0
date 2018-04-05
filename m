Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:42989 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbeDEWB0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 18:01:26 -0400
Received: by mail-pl0-f65.google.com with SMTP id g20-v6so21187953plo.9
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Apr 2018 15:01:25 -0700 (PDT)
Subject: Re: [PATCH 2/3] objtool: Support HOSTCFLAGS and HOSTLDFLAGS
References: <20180329004805.7278-1-labbott@redhat.com>
 <20180329004805.7278-3-labbott@redhat.com>
 <CAK7LNASd5Ano4G0Uay8MffBp0yb5TQ_1C+WaGv57pPv_J15_gQ@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <d9f3c234-27ef-943a-c931-4c597ae84924@redhat.com>
Date: Thu, 5 Apr 2018 15:01:23 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNASd5Ano4G0Uay8MffBp0yb5TQ_1C+WaGv57pPv_J15_gQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Josh Poimboeuf <jpoimboe@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 04/04/2018 09:42 PM, Masahiro Yamada wrote:
> 2018-03-29 9:48 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>> It may be useful to compile host programs with different flags (e.g.
>> hardening). Ensure that objtool picks up the appropriate flags.
>>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>> ---
> 
> 
> I saw some similar patches before.
> 
> I thought they are fixing this way
> https://patchwork.kernel.org/patch/10251259/
> 
> but, I am not tacking the progress.
> 
> 
> 

That looks like a different issue since it's still not going to
pick up the HOST{C,LD}FLAGS.

> 
>>   tools/objtool/Makefile | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
>> index e6acc281dd37..0ff3bcac1ca9 100644
>> --- a/tools/objtool/Makefile
>> +++ b/tools/objtool/Makefile
>> @@ -31,8 +31,9 @@ INCLUDES := -I$(srctree)/tools/include \
>>              -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
>>              -I$(srctree)/tools/objtool/arch/$(ARCH)/include
>>   WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
>> -CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
>> -LDFLAGS  += -lelf $(LIBSUBCMD)
>> +CFLAGS   += -Wall -Werror $(WARNINGS) $(HOSTCFLAGS) -fomit-frame-pointer -O2 -g \
>> +           $(INCLUDES)
>> +LDFLAGS  += -lelf $(LIBSUBCMD) $(HOSTLDFLAGS)
>>
>>   # Allow old libelf to be used:
>>   elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
>> --
>> 2.16.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 

