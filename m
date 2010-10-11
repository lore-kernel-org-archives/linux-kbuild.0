Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60678 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756431Ab0JKVrE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Oct 2010 17:47:04 -0400
Message-ID: <4CB385C8.7010109@suse.cz>
Date: Mon, 11 Oct 2010 23:46:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Temporarily disable dependency warnings
References: <20101008150343.GF4088@hack>	 <1286660701-31557-1-git-send-email-mmarek@suse.cz> <1286810580.19739.108.camel@e102109-lin.cambridge.arm.com>
In-Reply-To: <1286810580.19739.108.camel@e102109-lin.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kbuild@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, lacombar@gmail.com, xiyou.wangcong@gmail.com

On 11.10.2010 17:23, Catalin Marinas wrote:
> On Sat, 2010-10-09 at 22:45 +0100, Michal Marek wrote:
>> After fixing a use-after-free bug in kconfig, a 'make defconfig' or
>> 'make allmodconfig' fills the screen with warnings that were not
>> detected before. Given that we are close to the release now, disable the
>> warnings temporarily and deal with them after 2.6.36.
>>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks, but I already pushed it on Saturday. The good news is that Linus
did pull from me, so 2.6.36 will have this.

Michal
