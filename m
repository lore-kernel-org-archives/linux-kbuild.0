Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28921 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750967AbdEFP6I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 May 2017 11:58:08 -0400
MIME-Version: 1.0
In-Reply-To: <87h911yw1t.fsf@belgarion.home>
References: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
 <CAK7LNAQN2ZRFETM818ySYSOx1Tykhq7RCYeyFv=x1ARH7w7cww@mail.gmail.com>
 <87shkwi73g.fsf@belgarion.home> <CAK7LNARpU2Stv2=jWiK2z1WxY-EnKACkJbnFWOaD1POigGvSug@mail.gmail.com>
 <87h911yw1t.fsf@belgarion.home>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 7 May 2017 00:57:52 +0900
Message-ID: <CAK7LNAQJ-vcsok7cWgLyKGiTxPoQkr0mNbf3t4d24jj6cPCw6w@mail.gmail.com>
Subject: Re: [PATCH v2] tags: honor COMPILED_SOURCE with apart output directory
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Robert,

2017-05-04 15:29 GMT+09:00 Robert Jarzmik <robert.jarzmik@free.fr>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> Hi Robert,
>>
>> 2017-04-26 5:07 GMT+09:00 Robert Jarzmik <robert.jarzmik@free.fr>:
>>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>>
>>>> Hi Robert,
>>>>> diff --git a/scripts/tags.sh b/scripts/tags.sh
>>>>> index a2ff3388e5ea..35cb64d5211c 100755
>>>>> --- a/scripts/tags.sh
>>>>> +++ b/scripts/tags.sh
>>>>> @@ -106,7 +106,8 @@ all_compiled_sources()
>>>>>                 case "$i" in
>>>>>                         *.[cS])
>>>>>                                 j=${i/\.[cS]/\.o}
>>>>> -                               if [ -e $j ]; then
>>>>> +                               k="${j#$tree}"
>>>>> +                               if [ -e $j -o -e "$k" ]; then
>>>>
>>>>
>>>> Do we need to check both srctree and objtree?
>>>> I think checking objtree (after $tree is ripped off) is enough.
>>>
>>> If I remember correctly, as this goes back a couple of monthes when I made the
>>> tests of this patch, the srctree is checked for the case when the kernel is
>>> compiled without O=, and objtree for the case with O=.
>>
>>
>> I thought of this too, but if O= is given, objects in srctree
>> should not be checked.
>>
>> For example, the kernel may be compiled for ARCH=arm with O= first,
>> then for ARCH=x86 without O= second.
>>
>> If we include objects from both trees, the generated tag file
>> will be a mixture of arm and x86.
> That's true, but is this case worth an additional test for this case, ie. is it
> a case anybody uses ? Given that that this tags generation never worked for out
> of tree builds, I was thinking it wasn't worth a :
>    [[ (-z $O -a -e $j) || (-n $O -a -e $k) ]];


I am not saying we should do like that.


My suggestion is even simpler.

Can we do like this?


diff --git a/scripts/tags.sh b/scripts/tags.sh
index d661f2f..d23dcbf 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -106,6 +106,7 @@ all_compiled_sources()
                case "$i" in
                        *.[cS])
                                j=${i/\.[cS]/\.o}
+                               j="${j#$tree}"
                                if [ -e $j ]; then
                                        echo $i
                                fi



-- 
Best Regards
Masahiro Yamada
