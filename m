Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:40106 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756169AbbI3Nge (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Sep 2015 09:36:34 -0400
Subject: Re: [PATCH] kselftest: add cleankselftest rule
References: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <560BE55F.6050507@osg.samsung.com>
Date: Wed, 30 Sep 2015 07:36:31 -0600
MIME-Version: 1.0
In-Reply-To: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang Long <long.wanglong@huawei.com>, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, wanglong@laoqinren.net, peifeiyue@huawei.com

On 09/23/2015 03:33 AM, Wang Long wrote:
> We use
> 
>     $make TARGETS="size timers" kselftest
> 
> to build and run selftests. but there is no rule
> for us to clean the kselftest generated files.
> 
> This patch add the rules, for example:
> 
> 	$ make TARGETS="size timers" cleankselftest
> 
> can clean all kselftst generated files.
> 
> Signed-off-by: Wang Long <long.wanglong@huawei.com>

Thanks. Applied to linux-kselftest next for 4.4

-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
