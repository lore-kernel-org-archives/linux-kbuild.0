Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:12226 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752641AbYEDSDs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 14:03:48 -0400
Message-ID: <481DF887.5030101@oracle.com>
Date: Sun, 04 May 2008 10:55:19 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: [2.6 patch] kconfig-language.txt: remove bogus hint
References: <20080503231535.GY5838@cs181133002.pp.htv.fi> <20080504061741.GA14784@uranus.ravnborg.org> <20080504080137.GF5838@cs181133002.pp.htv.fi> <20080504112741.GA18379@uranus.ravnborg.org> <20080504121014.GJ5838@cs181133002.pp.htv.fi> <20080504122640.GA19513@uranus.ravnborg.org> <481DF1A5.1030103@oracle.com> <20080504175121.GN5838@cs181133002.pp.htv.fi>
In-Reply-To: <20080504175121.GN5838@cs181133002.pp.htv.fi>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Adrian Bunk wrote:
> On Sun, May 04, 2008 at 10:25:57AM -0700, Randy Dunlap wrote:
>> Sam Ravnborg wrote:
>>> On Sun, May 04, 2008 at 03:10:14PM +0300, Adrian Bunk wrote:
>>>> On Sun, May 04, 2008 at 01:27:41PM +0200, Sam Ravnborg wrote:
>>>>> On Sun, May 04, 2008 at 11:01:37AM +0300, Adrian Bunk wrote:
>>>>>> On Sun, May 04, 2008 at 08:17:41AM +0200, Sam Ravnborg wrote:
>>>>>>> On Sun, May 04, 2008 at 02:15:35AM +0300, Adrian Bunk wrote:
>>>>>>>> This kconfig construct described here is required in a 
>>>>>>>> different and much more complicated situation.
>>>>>>> Please elaborate...
>>>>>> In the hint C is described as a tristate.
>>>>>>
>>>>>> But you need this idiom only when A is a tristate and C is a bool.
>>>>> Thats another case.
>>>>> What is described is following simple situation:
>>>>>
>>>>> config FOO
>>>>>         bool "Modules"
>>>>>         option modules
>>>>>
>>>>> config A
>>>>>         tristate "a"
>>>>>
>>>>> config B
>>>>>         tristate "b"
>>>>>         depends on A
>>>>>
>>>>> config C
>>>>>         tristate "c"
>>>>>         depends on B
>>>>>         depends on A = y || A = B
>>>>>
>>>>>
>>>>> C uses a symbol defined by A - let us name it foo().
>>>>> If C is build-in and A is a module => 	link error - unable to 
>>>>> resolve foo.
>>>>>
>>>>> So we say: if A is buildin C may be built-in or module.
>>>>> if A is a module C may not be built-in.
>>>>>
>>>>> This is what this hint describes.
>>>> In your example C does not need any dependency on A at all since it  
>>>> is already handled through the dependency chain C->B->A.
>>> You are right.
>>> Randy - what problem was it this text tried to describe/solve?
>> I thought that it was related to USB_STORAGE, but I don't find it
>> in current kernels.
>>
>> If the text is misleading, it should be yanked, of course.
>> And other places checked, e.g.:
>> ...
> 
> The idiom has use cases, but you need the following prerequisites:
> - A and B are tristates
> - B does not depend on A
> - C is a bool with the semantics "enable feature C in B"
> 
> And I doubt you can put that into a useful hint.

OK, sounds like the patch is good then.

-- 
~Randy
