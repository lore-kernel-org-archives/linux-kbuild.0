Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w2.samsung.com ([211.189.100.11]:56117 "EHLO
	usmailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757419AbaHGN7l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Aug 2014 09:59:41 -0400
Message-id: <53E38643.2010108@samsung.com>
Date: Thu, 07 Aug 2014 07:59:31 -0600
From: Shuah Khan <shuah.kh@samsung.com>
Reply-to: shuah.kh@samsung.com
MIME-version: 1.0
Subject: Re: [PATCH] kbuild: devtest - new make target for build all and run
 tests
References: <1405716274-24420-1-git-send-email-shuah.kh@samsung.com>
 <53E232E6.8060506@suse.cz> <53E235DE.70604@samsung.com>
 <53E23669.5050309@suse.cz> <20140806143149.GA13552@kroah.com>
In-reply-to: <20140806143149.GA13552@kroah.com>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, "sam@ravnborg.org >> Sam Ravnborg" <sam@ravnborg.org>

On 08/06/2014 08:31 AM, Greg KH wrote:
> On Wed, Aug 06, 2014 at 04:06:33PM +0200, Michal Marek wrote:
>> On 2014-08-06 16:04, Shuah Khan wrote:
>>> On 08/06/2014 07:51 AM, Michal Marek wrote:
>>>> On 2014-07-18 22:44, Shuah Khan wrote:
>>>>> Add a new devtest make target to enable developer testing. This
>>>>> new target does full build (make all) and then runs selftests.
>>>>
>>>> I agree with Sam that the name is rather ambiguous, but I can't suggest
>>>> a better alternative right now.
>>>
>>> Does kselftest or kern_selftest sound better?
>>
>> It does sound better to me than dev(ice)test, but I'm not a native
>> English speaker. Greg?
>
> Either is fine with me, but I don't think we have '_' as any make target
> today, so perhaps "kselftest" is best?
>
> thanks,
>
> greg k-h
>

Patch v2 is on its way. kselftest is the new target. It does sound lot
better than devtest :)

-- Shuah

-- 
Shuah Khan
Senior Linux Kernel Developer - Open Source Group
Samsung Research America(Silicon Valley)
shuah.kh@samsung.com | (970) 672-0658
