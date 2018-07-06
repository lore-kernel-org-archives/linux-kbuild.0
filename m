Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48009 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753439AbeGFBDx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 21:03:53 -0400
MIME-Version: 1.0
In-Reply-To: <43f37d95-89cc-fd42-46c3-533f85f014e8@infradead.org>
References: <6477e1be-6686-582b-35b5-72e9f677619f@infradead.org>
 <CAK7LNATj1ibX=GMJ92fpX45Ba2WJKKb=h7_ZR9DeZcyBGcMHbQ@mail.gmail.com> <43f37d95-89cc-fd42-46c3-533f85f014e8@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Jul 2018 10:03:02 +0900
Message-ID: <CAK7LNAT3CWRDDqb4F8vfG2-YNCZMKC0PmF64bPvm=XMV8Hz8mQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: delete INSTALL_FW_PATH from kbuild documentation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-07-05 11:22 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 07/04/18 18:49, Masahiro Yamada wrote:
>> 2018-07-05 4:59 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Removed Kbuild documentation for INSTALL_FW_PATH.
>>>
>>> The kbuild symbol INSTALL_FW_PATH was removed from Kbuild tools in
>>> September 2014 (for 4.14) but the symbol was not deleted from
>>
>> I think 'September 2017'
>> although I can fix up the log locally.
>
> Right you are.  and thanks.
>
>>
>>
>>
>>> the kbuild documentation, so do that now.
>>>
>>> Fixes: 5620a0d1aac ("firmware: delete in-kernel firmware")
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: stable@vger.kernel.org # 4.14 and later
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
>>>  Documentation/kbuild/kbuild.txt |    9 ---------
>>>  1 file changed, 9 deletions(-)
>>>
>>> --- linux-next-20180704.orig/Documentation/kbuild/kbuild.txt
>>> +++ linux-next-20180704/Documentation/kbuild/kbuild.txt
>>> @@ -149,15 +149,6 @@ stripped after they are installed.  If I
>>>  the default option --strip-debug will be used.  Otherwise,
>>>  INSTALL_MOD_STRIP value will be used as the options to the strip command.
>>>
>>> -INSTALL_FW_PATH
>>> ---------------------------------------------------
>>> -INSTALL_FW_PATH specifies where to install the firmware blobs.
>>> -The default value is:
>>> -
>>> -    $(INSTALL_MOD_PATH)/lib/firmware
>>> -
>>> -The value can be overridden in which case the default value is ignored.
>>> -
>>>  INSTALL_HDR_PATH
>>>  --------------------------------------------------
>>>  INSTALL_HDR_PATH specifies where to install user space headers when
>>>
>>>
>>> --
>
>

Applied to linux-kbuild. Thanks!


-- 
Best Regards
Masahiro Yamada
