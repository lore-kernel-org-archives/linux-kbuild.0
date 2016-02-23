Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39482 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751806AbcBWSbf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2016 13:31:35 -0500
Subject: Re: [PATCH v4 2/2] Makefile: add kselftest-merge
References: <1452238054-15482-1-git-send-email-bamvor.zhangjian@linaro.org>
 <1452238054-15482-3-git-send-email-bamvor.zhangjian@linaro.org>
 <56CC6DDD.9080803@osg.samsung.com>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <56CCA584.9070504@osg.samsung.com>
Date: Tue, 23 Feb 2016 11:31:32 -0700
MIME-Version: 1.0
In-Reply-To: <56CC6DDD.9080803@osg.samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, mmarek@suse.com
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, khilman@linaro.org, tyler.baker@linaro.org, broonie@kernel.org, mpe@ellerman.id.au, dvhart@infradead.org, Shuah Khan <shuahkh@osg.samsung.com>

On 02/23/2016 07:34 AM, Shuah Khan wrote:
> On 01/08/2016 12:27 AM, Bamvor Jian Zhang wrote:
>> Add kselftest-merge to enable the dependencies of kernel config
>> for all the kselftest testcases. User should call it after create
>> the kernel configuration(.config), eg:
>>
>> $ make kselftest-merge
>>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> 
> Could you please ACK this patch if you are okay
> with the changes? I will take this through ksleftest
> tree.
> 
> thanks,
> -- Shuah

Applied this patch to linux-kselftest next with

[PATCH v4 1/2] selftests: create test-specific kconfig fragments

to get some testing in for now.

thanks,
-- Shuah

-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
