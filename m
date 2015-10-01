Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39210 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753013AbbJABR0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Sep 2015 21:17:26 -0400
Message-ID: <1443662245.30258.4.camel@ellerman.id.au>
Subject: Re: [PATCH] kselftest: add cleankselftest rule
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 01 Oct 2015 11:17:25 +1000
In-Reply-To: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
References: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang Long <long.wanglong@huawei.com>
Cc: shuahkh@osg.samsung.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, wanglong@laoqinren.net, peifeiyue@huawei.com

On Wed, 2015-09-23 at 09:33 +0000, Wang Long wrote:
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

I think 'kselftest-clean' would be neater.

That way all the kselftests targets start with 'kselftest'.

cheers


