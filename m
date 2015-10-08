Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46452 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbbJHDwF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2015 23:52:05 -0400
Message-ID: <1444276324.9940.6.camel@ellerman.id.au>
Subject: Re: [PATCH v2] kselftest: add kselftest-clean rule
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 08 Oct 2015 14:52:04 +1100
In-Reply-To: <1444272078-7087-1-git-send-email-long.wanglong@huawei.com>
References: <560E9242.9000402@osg.samsung.com>
	 <1444272078-7087-1-git-send-email-long.wanglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang Long <long.wanglong@huawei.com>
Cc: shuahkh@osg.samsung.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com

On Thu, 2015-10-08 at 02:41 +0000, Wang Long wrote:
> We use
> 
>     $make TARGETS="size timers" kselftest
> 
> to build and run selftests. but there is no rule
> for us to clean the kselftest generated files.
> 
> This patch add the rules, for example:
> 
> 	$ make TARGETS="size timers" kselftest-clean
> 
> can clean all kselftest generated files.
> 
> Signed-off-by: Wang Long <long.wanglong@huawei.com>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)

Thanks that's much neater.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers



