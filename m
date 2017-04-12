Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43582 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752384AbdDLSTd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2017 14:19:33 -0400
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
References: <20170411111227.20846-1-felipe.balbi@linux.intel.com>
 <7d017fc8-9e0b-f8a8-a877-edcc07c91949@infradead.org>
 <87d1ciawvn.fsf@linux.intel.com> <20170412160658.GA3531@scaer>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a5b84e01-f645-71c7-12c2-c9a0cd2377a9@infradead.org>
Date: Wed, 12 Apr 2017 11:19:28 -0700
MIME-Version: 1.0
In-Reply-To: <20170412160658.GA3531@scaer>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On 04/12/17 09:06, Yann E. MORIN wrote:
> Felipe, All,
> 
> On 2017-04-12 10:49 +0300, Felipe Balbi spake thusly:
>>
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>> On 04/11/17 04:12, Felipe Balbi wrote:
>>>> With a growing amount of Kernel configuration, it's
>>>> getting ever more difficult to find anything on
>>>> menuconfig. Because of that, implement mergesort for
>>>> kconfig to make it a little easier for anybody
>>>> building kernels.
>>>
>>> Search works for me, but I don't mind Sort either.
>>

[snip]

> 
> Arguably, the order may also make sense, for example to "group" related
> items. So, <Sort> should be a toggle, so that it is possible to go back
> to the unsorted, original order, IMHO...
> 
>>> Any Help text for Sort?  or is it obvious what it does?  (no)
>> wait, it's not obvious what "Sort" means?
> 
> I guess that what Randy said was that in this context, it is not more
> obvious than Load or Save, and they are documented in the help (but it
> is not obvious how to get the help).

Correct. and true (about how to get to the Help text).

> For example, go on the "General setup" entry, but do not enter the menu.
> Now, select Help: you'll get a bit of help on how to use menuconfig.
> 
> There, Load and Save are documented, in Alternate Configuration Files.
> 
>>> In an 80x25 terminal (window), the < Sort > option wraps around
>>> past column 80.
>> not what I see here [1]
> 
> I see the same as Randy here:
> 
>     $ stty size
>     25 80
> 
>     https://imgur.com/a/ku0sG

For some reason, Felipe's <Select> starts further to the left than mine
or Yann's does.

>>> I haven't looked at the source code (lately), but I think that it
>>> would OK to not have the (extra) spaces inside the <...> brackets.
>>> I.e., instead of
>>>   │        <Select>    < Exit >    < Help >    < Save >    < Load >    < Sort  
>>>    >
>>> just have
>>>   │        <Select>    <Exit>    <Help>    <Save>    <Load>    <Sort>
>>>
>>> Or the <Select> does not need to be indented as much as it is.
>> I changed that for this very reason

I don't see that. Is that part of the patch missing?

> Or just always left-align the line, rather than center it?

OK.


-- 
~Randy
