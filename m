Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:10478 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750962AbdHUDau (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 23:30:50 -0400
Subject: Re: special handle of scripts/kconfig/zconf.tab.o
References: <5992D4DF.2080405@cn.fujitsu.com>
 <CAK7LNATGwrMBsaps1oVOi_21R8jzTadeWSwaK1dA8nMaJs7KpQ@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <599A5542.9060509@cn.fujitsu.com>
Date: Mon, 21 Aug 2017 11:36:34 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNATGwrMBsaps1oVOi_21R8jzTadeWSwaK1dA8nMaJs7KpQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,
  Thank you both for those valuable info.

On 08/19/2017 08:42 PM, Masahiro Yamada wrote:
> Hi.
> (+CC Sam)
> 
> 2017-08-15 20:02 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Masahiro-san,
>>
>> I have a question about make *config. In scripts/kconfig/Makefile, there
>> is following statement:
>>
>> $(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
>>
>> and the $(obj)/zconf.{tab,hash,lex}.c match the rule in Makefile.lib:
>>
>> $(obj)/%: $(src)/%_shipped
>>         $(call cmd,shipped)
>>
>> and cmd_shipped just transform the _shipped file to .c via `cat`.
>>
>> And zconf.tab.c includes several *other* .c files which make the whole
>> process a little obscure, because there are not corresponding .o files
>> for the *other* .c files.
>>
>> My questions is: Does this special handling has other meanings that I
>> may miss? Or just legacy.
> 

> 
> 
>> Because a straightforward way in my mind would be:
>>
>> rename zconf.{tab,hash,lex}.c_shipped to zconf.{tab,hash,lex}.c, then
>> has following in the Makefile
>>
>> common-objs := zconf.tab.o zconf.hash.o zconf.lex.o util.o etc...
>> conf-objs := conf.o $(common-objs)
>>
> 

> 
> 
> Here, we have one more question.
> 
> 
> Can we generate zconf.{tab,hash,lex}.c from zconf.{y,gperf,l}
> instead of from *_shipped?
> 
> This is also possible, technically.
> But, I do not know if it is acceptable to have
> more external tool dependencies.
> (So, I sent RFC patches to hear more opinions.)
> 

I think this is good for the new comers who don't know those tools
before. When I come to here. I just noticed that kbuild will cat
*_shipped file to the corresponding .c file, and miss the part that the
.c file is actually created by the tools.

And another new-comer friendly improvement may be something like: remove
"include *.c" lines in zconf.y, and modify makefile like I said above.
 So I will not get confused when I see symbols within certain .c file is
used while don't see the certain .o file.

-- 
Sincerely,
Cao jin


