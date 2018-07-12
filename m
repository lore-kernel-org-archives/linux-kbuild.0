Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59602 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbeGLPyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 11:54:13 -0400
MIME-Version: 1.0
In-Reply-To: <20180710073854.GB7671@krava>
References: <20180710004602.21599-1-labbott@redhat.com> <20180710004602.21599-3-labbott@redhat.com>
 <20180710073854.GB7671@krava>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Jul 2018 00:43:14 +0900
Message-ID: <CAK7LNAT4R=__KLaoEWnuYe2CGuB3DDivJq2AUCLLD+Xgggy5PQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/7] tools: build: Use HOSTLDFLAGS with fixdep
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Laura Abbott <labbott@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>

2018-07-10 16:38 GMT+09:00 Jiri Olsa <jolsa@redhat.com>:
> On Mon, Jul 09, 2018 at 05:45:57PM -0700, Laura Abbott wrote:
>> The final link of fixdep uses LDFLAGS but not the existing HOSTLDFLAGS.
>> Fix this.
>>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>
> Acked-by: Jiri Olsa <jolsa@kernel.org>
>


Applied to linux-kbuild/fixes. Thanks!

> thanks,
> jirka
>
>> ---
>> v2: Switch to just using HOSTLDFLAGS instead of both LDFLAGS and
>> HOSTLDFLAGS.
>> ---
>>  tools/build/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/build/Makefile b/tools/build/Makefile
>> index 5eb4b5ad79cb..5edf65e684ab 100644
>> --- a/tools/build/Makefile
>> +++ b/tools/build/Makefile
>> @@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
>>       $(Q)$(MAKE) $(build)=fixdep
>>
>>  $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
>> -     $(QUIET_LINK)$(HOSTCC) $(LDFLAGS) -o $@ $<
>> +     $(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) -o $@ $<
>>
>>  FORCE:
>>
>> --
>> 2.17.1
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
