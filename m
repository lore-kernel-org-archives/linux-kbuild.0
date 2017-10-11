Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from osg.samsung.com ([64.30.133.232]:39395 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932592AbdJKBGH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Oct 2017 21:06:07 -0400
Subject: Re: [PATCH] Makefile: enable dochelp run from main make level
References: <20171002234421.20254-1-shuahkh@osg.samsung.com>
 <20171002234421.20254-3-shuahkh@osg.samsung.com>
 <CAK7LNAS0Zc=_r9wLOssY9hy=d+yGJSew3Maaw_5bGdC=pr6YTw@mail.gmail.com>
 <95c3c8fb-83b3-5d92-f5cc-4cc1cca2913f@osg.samsung.com>
 <CAK7LNAR6rAoxLSDWK7=jvs7RaDSKAz-mCiYJ7MUfAvO9RrKE7w@mail.gmail.com>
 <21881410-258e-0912-68c3-23c2d24d3ccb@infradead.org>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <7c25c1eb-74b6-5f60-414c-f8c554fb3ce9@osg.samsung.com>
Date: Tue, 10 Oct 2017 19:06:05 -0600
MIME-Version: 1.0
In-Reply-To: <21881410-258e-0912-68c3-23c2d24d3ccb@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>

On 10/10/2017 06:58 PM, Randy Dunlap wrote:
> On 10/10/17 17:54, Masahiro Yamada wrote:
>> 2017-10-11 5:09 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>>> On 10/07/2017 05:24 AM, Masahiro Yamada wrote:
>>>> 2017-10-03 8:44 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>>>>> Change to enable dochelp run from main make level to make it easier to
>>>>> use it.
>>>>>
>>>>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>>>>> ---
>>>>>  Makefile | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> index cf007a31d575..f99d1b36c437 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -1454,7 +1454,7 @@ $(help-board-dirs): help-%:
>>>>>
>>>>>  # Documentation targets
>>>>>  # ---------------------------------------------------------------------------
>>>>> -DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
>>>>> +DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs dochelp
>>>>>  PHONY += $(DOC_TARGETS)
>>>>>  $(DOC_TARGETS): scripts_basic FORCE
>>>>>         $(Q)$(MAKE) $(build)=Documentation $@
>>>>> --
>>>>> 2.11.0
>>>>>
>>>>
>>>>
>>>> The dochelp is invoked from "make help" of the main make level.
>>>>
>>>> Do you mean "make dochelp" is also necessary?
>>>>
>>>
>>> Right. It is a bit hard to pick out individual help messages from
>>> the 'make help' output and it would make it easier to use to enable
>>> dochelp.
>>>
>>> That said, it is your call on whether it would make it cumbersome to
>>> support 'make dochlep' and other sub-makefile help targets.
>>>
>>> I can go either way.
>>>
>>
>> I thought of this.
>> The same thing would apply to "make confighelp", "make pkghelp", ...
> 
> Yes, especially confighelp.  I have to use grep, otherwise there is too
> much noise.
> 
> 

If you would like I can send patches to cover some of these cases.

thanks,
-- Shuah
