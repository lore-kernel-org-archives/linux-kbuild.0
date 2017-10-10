Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:50309 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934790AbdJJUJY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 16:09:24 -0400
Subject: Re: [PATCH] Makefile: enable dochelp run from main make level
References: <20171002234421.20254-1-shuahkh@osg.samsung.com>
 <20171002234421.20254-3-shuahkh@osg.samsung.com>
 <CAK7LNAS0Zc=_r9wLOssY9hy=d+yGJSew3Maaw_5bGdC=pr6YTw@mail.gmail.com>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <95c3c8fb-83b3-5d92-f5cc-4cc1cca2913f@osg.samsung.com>
Date: Tue, 10 Oct 2017 14:09:21 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS0Zc=_r9wLOssY9hy=d+yGJSew3Maaw_5bGdC=pr6YTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>

On 10/07/2017 05:24 AM, Masahiro Yamada wrote:
> 2017-10-03 8:44 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>> Change to enable dochelp run from main make level to make it easier to
>> use it.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index cf007a31d575..f99d1b36c437 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1454,7 +1454,7 @@ $(help-board-dirs): help-%:
>>
>>  # Documentation targets
>>  # ---------------------------------------------------------------------------
>> -DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
>> +DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs dochelp
>>  PHONY += $(DOC_TARGETS)
>>  $(DOC_TARGETS): scripts_basic FORCE
>>         $(Q)$(MAKE) $(build)=Documentation $@
>> --
>> 2.11.0
>>
> 
> 
> The dochelp is invoked from "make help" of the main make level.
> 
> Do you mean "make dochelp" is also necessary?
> 

Right. It is a bit hard to pick out individual help messages from
the 'make help' output and it would make it easier to use to enable
dochelp.

That said, it is your call on whether it would make it cumbersome to
support 'make dochlep' and other sub-makefile help targets.

I can go either way.

thanks,
-- Shuah

