Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga01-in.huawei.com ([58.251.152.64]:22086 "EHLO
	szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415AbbJHChh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2015 22:37:37 -0400
Message-ID: <5615D6D8.8040208@huawei.com>
Date: Thu, 8 Oct 2015 10:37:12 +0800
From: "long.wanglong" <long.wanglong@huawei.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kselftest: add cleankselftest rule
References: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com> <1443662245.30258.4.camel@ellerman.id.au> <560E9242.9000402@osg.samsung.com>
In-Reply-To: <560E9242.9000402@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, wanglong@laoqinren.net, peifeiyue@huawei.com

On 2015/10/2 22:18, Shuah Khan wrote:
> On 09/30/2015 07:17 PM, Michael Ellerman wrote:
>> On Wed, 2015-09-23 at 09:33 +0000, Wang Long wrote:
>>> We use
>>>
>>>     $make TARGETS="size timers" kselftest
>>>
>>> to build and run selftests. but there is no rule
>>> for us to clean the kselftest generated files.
>>>
>>> This patch add the rules, for example:
>>>
>>> 	$ make TARGETS="size timers" cleankselftest
>>
>> I think 'kselftest-clean' would be neater.
>>
>> That way all the kselftests targets start with 'kselftest'.
>>
> 
> Good suggestion. Wang! Could you please send me updated patch
> with this suggested change.

OK.

Since the National Day holiday, I am sorry so late reply.

I will send the updated patch.

Thanks.
> 
> thanks,
> -- Shuah
> 
> 


