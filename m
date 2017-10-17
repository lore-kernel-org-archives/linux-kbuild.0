Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43908 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752274AbdJQX6f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 19:58:35 -0400
MIME-Version: 1.0
In-Reply-To: <7c25c1eb-74b6-5f60-414c-f8c554fb3ce9@osg.samsung.com>
References: <20171002234421.20254-1-shuahkh@osg.samsung.com>
 <20171002234421.20254-3-shuahkh@osg.samsung.com> <CAK7LNAS0Zc=_r9wLOssY9hy=d+yGJSew3Maaw_5bGdC=pr6YTw@mail.gmail.com>
 <95c3c8fb-83b3-5d92-f5cc-4cc1cca2913f@osg.samsung.com> <CAK7LNAR6rAoxLSDWK7=jvs7RaDSKAz-mCiYJ7MUfAvO9RrKE7w@mail.gmail.com>
 <21881410-258e-0912-68c3-23c2d24d3ccb@infradead.org> <7c25c1eb-74b6-5f60-414c-f8c554fb3ce9@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 18 Oct 2017 08:57:51 +0900
Message-ID: <CAK7LNATL+mVnBzwvY8aXuKWd7ebtaT95rpt-sK=P+fLJNtd4Mg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: enable dochelp run from main make level
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-11 10:06 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> On 10/10/2017 06:58 PM, Randy Dunlap wrote:
>> On 10/10/17 17:54, Masahiro Yamada wrote:
>>> 2017-10-11 5:09 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>>>> On 10/07/2017 05:24 AM, Masahiro Yamada wrote:
>>>>> 2017-10-03 8:44 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
>>>>>> Change to enable dochelp run from main make level to make it easier to
>>>>>> use it.
>>>>>>
>>>>>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>>>>>> ---
>>>>>>  Makefile | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Makefile b/Makefile
>>>>>> index cf007a31d575..f99d1b36c437 100644
>>>>>> --- a/Makefile
>>>>>> +++ b/Makefile
>>>>>> @@ -1454,7 +1454,7 @@ $(help-board-dirs): help-%:
>>>>>>
>>>>>>  # Documentation targets
>>>>>>  # ---------------------------------------------------------------------------
>>>>>> -DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
>>>>>> +DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs dochelp
>>>>>>  PHONY += $(DOC_TARGETS)
>>>>>>  $(DOC_TARGETS): scripts_basic FORCE
>>>>>>         $(Q)$(MAKE) $(build)=Documentation $@
>>>>>> --
>>>>>> 2.11.0
>>>>>>
>>>>>
>>>>>
>>>>> The dochelp is invoked from "make help" of the main make level.
>>>>>
>>>>> Do you mean "make dochelp" is also necessary?
>>>>>
>>>>
>>>> Right. It is a bit hard to pick out individual help messages from
>>>> the 'make help' output and it would make it easier to use to enable
>>>> dochelp.
>>>>
>>>> That said, it is your call on whether it would make it cumbersome to
>>>> support 'make dochlep' and other sub-makefile help targets.
>>>>
>>>> I can go either way.
>>>>
>>>
>>> I thought of this.
>>> The same thing would apply to "make confighelp", "make pkghelp", ...
>>
>> Yes, especially confighelp.  I have to use grep, otherwise there is too
>> much noise.
>>
>>
>
> If you would like I can send patches to cover some of these cases.
>


We have a kind of hierarchy
when arch/$(SRCARCH)/configs has sub-directories.
For example,

$ make ARCH=powerpc help
  [ snip ]
  storcenter_defconfig     - Build for storcenter
  tqm8xx_defconfig         - Build for tqm8xx
  wii_defconfig            - Build for wii

  help-40x         - Show 40x-specific targets
  help-44x         - Show 44x-specific targets
  help-52xx        - Show 52xx-specific targets
  help-83xx        - Show 83xx-specific targets
  help-85xx        - Show 85xx-specific targets
  help-boards      - Show all of the above




I think your suggestion is, to keep the top "make help" as-is
and add new targets to display subsets.


All targets you can run from the top-level
must be described in "make help".

Maybe like this?

   confighelp   - Show only configuration targets
   dochelp      - Show only documentation targets


I feel a bit cumbersome, but I will probably accept it
if people think it is useful.




-- 
Best Regards
Masahiro Yamada
