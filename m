Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:38470 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750955AbdJRQje (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 12:39:34 -0400
Subject: Re: [PATCH] Makefile: add targets for config-help and pkg-help
References: <20171017151848.3087-1-shuahkh@osg.samsung.com>
 <CAK7LNATNbX0tL-SL2wU59raERmTZm8g6yxEd4rLd976=Gmff=Q@mail.gmail.com>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <c952b0ee-187f-1956-cb0d-9b15935d74b3@osg.samsung.com>
Date: Wed, 18 Oct 2017 10:39:23 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNATNbX0tL-SL2wU59raERmTZm8g6yxEd4rLd976=Gmff=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>

On 10/18/2017 10:23 AM, Masahiro Yamada wrote:
> 2017-10-18 0:18 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>> Change to enable config help and package help from the main make level
>> to make it easier to use. It has become difficult to find config help
>> and pkg help specific output from the "help" information.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  Makefile | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 46bfb0ed2257..1d6f86df1b6c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1441,6 +1441,13 @@ help:
>>         @echo  'Execute "make" or "make all" to build all targets marked with [*] '
>>         @echo  'For further info see the ./README file'
>>
>> +PHONY += config-help
>> +config-help:
>> +       @$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
>> +
>> +PHONY += pkg-help
>> +pkg-help:
>> +       @$(MAKE) $(build)=$(package-dir) help
>>
>>  help-board-dirs := $(addprefix help-,$(board-dirs))
>>
>> --
> 
> 
> What happened to "doc-help" ?
> (I want to see consistent hyphenation)

I added doc-help to DOC_TARGETS directly. I should have done this
patch on top of the last one.

> 
> Please follow Randy's suggestion.

I will re-do this patch as per Randy's suggestions.
> 
> Also you need to add %-help pattern to no-dot-config-targets.
> 

Right. I will send v2 this week if possible. I have a couple of
trips coming up including the Kernel Summit.

thanks,
-- Shuah

