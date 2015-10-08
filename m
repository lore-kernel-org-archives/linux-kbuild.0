Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:47857 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754583AbbJHN0d (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Oct 2015 09:26:33 -0400
Subject: Re: [PATCH v2] kselftest: add kselftest-clean rule
References: <560E9242.9000402@osg.samsung.com>
 <1444272078-7087-1-git-send-email-long.wanglong@huawei.com>
 <1444276324.9940.6.camel@ellerman.id.au>
 <20151008122150.GA12217@sepie.suse.cz>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <56166EFB.7080708@osg.samsung.com>
Date: Thu, 8 Oct 2015 07:26:19 -0600
MIME-Version: 1.0
In-Reply-To: <20151008122150.GA12217@sepie.suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Wang Long <long.wanglong@huawei.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com

On 10/08/2015 06:21 AM, Michal Marek wrote:
> On Thu, Oct 08, 2015 at 02:52:04PM +1100, Michael Ellerman wrote:
>> On Thu, 2015-10-08 at 02:41 +0000, Wang Long wrote:
>>> We use
>>>
>>>     $make TARGETS="size timers" kselftest
>>>
>>> to build and run selftests. but there is no rule
>>> for us to clean the kselftest generated files.
>>>
>>> This patch add the rules, for example:
>>>
>>> 	$ make TARGETS="size timers" kselftest-clean
>>>
>>> can clean all kselftest generated files.
>>>
>>> Signed-off-by: Wang Long <long.wanglong@huawei.com>
>>> ---
>>>  Makefile | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>
>> Thanks that's much neater.
>>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> Applied to kbuild.git#kbuild.
> 


Thanks for getting this in.

-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
