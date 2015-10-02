Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:47031 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751841AbbJBOSv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Oct 2015 10:18:51 -0400
Subject: Re: [PATCH] kselftest: add cleankselftest rule
References: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
 <1443662245.30258.4.camel@ellerman.id.au>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <560E9242.9000402@osg.samsung.com>
Date: Fri, 2 Oct 2015 08:18:42 -0600
MIME-Version: 1.0
In-Reply-To: <1443662245.30258.4.camel@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Wang Long <long.wanglong@huawei.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, wanglong@laoqinren.net, peifeiyue@huawei.com, Shuah Khan <shuahkh@osg.samsung.com>

On 09/30/2015 07:17 PM, Michael Ellerman wrote:
> On Wed, 2015-09-23 at 09:33 +0000, Wang Long wrote:
>> We use
>>
>>     $make TARGETS="size timers" kselftest
>>
>> to build and run selftests. but there is no rule
>> for us to clean the kselftest generated files.
>>
>> This patch add the rules, for example:
>>
>> 	$ make TARGETS="size timers" cleankselftest
> 
> I think 'kselftest-clean' would be neater.
> 
> That way all the kselftests targets start with 'kselftest'.
> 

Good suggestion. Wang! Could you please send me updated patch
with this suggested change.

thanks,
-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
