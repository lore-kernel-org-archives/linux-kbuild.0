Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:55256 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030366AbeFSTe0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jun 2018 15:34:26 -0400
Subject: Re: [RFC v7 1/1] mconf: global i-search in menu prompts
References: <20180617121534.4809-1-dirk@gouders.net>
 <20180617121534.4809-2-dirk@gouders.net>
 <6e23227d-f3ed-2197-7458-b060b8c90b64@infradead.org>
 <ghk1qusjf8.fsf@lena.gouders.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7a371124-007b-f758-44f0-c70c64ff5974@infradead.org>
Date: Tue, 19 Jun 2018 12:34:21 -0700
MIME-Version: 1.0
In-Reply-To: <ghk1qusjf8.fsf@lena.gouders.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>

On 06/19/2018 11:47 AM, Dirk Gouders wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Hi Dirk,
>>
>> On 06/17/2018 05:15 AM, Dirk Gouders wrote:
>>>
>>> At any time, at most one i-search is active and the navigation path to
>>> the current menu is displayed in the subtitle, the second line in the
>>> menu window.
>>
>> Nice.
>>
>> And the highlight of the current menu item is also nice when TAB is used to
>> switch to the buttons.  As well as toggling the help text based on context.
>>
>>
>>> Navigation example:
>>>
>>> To navigate to options concerning NFS file systems, simply type 'n',
>>> 'f' and 's'.
>>>
>>> Hint: use the 'z' key with focus on buttons to search for invisible
>>>       prompts.
>>
>> I think what this says is that the 'z' key is a toggle for the display of
>> some (invisible) prompts.  Is that correct?
>>
>>
>>
>> I reliably (consistently) get a segfault.  I have hit it several times.
>> Here is one way to get it:
>>
>> $ make menuconfig
>> and then enter:
>> /debug\
> 
> Hello Randy,
> 
> thank you for testing and your comments!
> 
> Concerning the segfault, I already have a version 8 prepared but wanted
> to do more testing before disturbing people, again.
> 
> The initialization and operation of the serialized menu was ugly and
> wrong.  I did not notice segfaults so far, but I can imagine the
> segfaults you noticed are caused by this, because the code you tested
> did not operate only on propper initialized array elements.
> 
> Before sending out version 8, I would like to include your other
> suggestions as well, so could you please try the attached patch if that
> also produces the segfaults?

Yes, this one is working for me without faults.

thanks,
-- 
~Randy
