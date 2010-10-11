Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:54873 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754825Ab0JKPXr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Oct 2010 11:23:47 -0400
Subject: Re: [PATCH] kconfig: Temporarily disable dependency warnings
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <1286660701-31557-1-git-send-email-mmarek@suse.cz>
References: <20101008150343.GF4088@hack>
	 <1286660701-31557-1-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Oct 2010 16:23:00 +0100
Message-ID: <1286810580.19739.108.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, lacombar@gmail.com, xiyou.wangcong@gmail.com

On Sat, 2010-10-09 at 22:45 +0100, Michal Marek wrote:
> After fixing a use-after-free bug in kconfig, a 'make defconfig' or
> 'make allmodconfig' fills the screen with warnings that were not
> detected before. Given that we are close to the release now, disable the
> warnings temporarily and deal with them after 2.6.36.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

