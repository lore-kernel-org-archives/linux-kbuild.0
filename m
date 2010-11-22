Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:51736 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754157Ab0KVN0X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Nov 2010 08:26:23 -0500
Message-ID: <4CEA6F70.50200@infradead.org>
Date: Mon, 22 Nov 2010 11:26:08 -0200
From: Mauro Carvalho Chehab <mchehab@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>	<1286889586-13483-1-git-send-email-mmarek@suse.cz>	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com> <20101122135715.121b5eb7.sfr@canb.auug.org.au>
In-Reply-To: <20101122135715.121b5eb7.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Michal Marek <mmarek@suse.cz>, randy.dunlap@oracle.com, catalin.marinas@arm.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com

Em 22-11-2010 00:57, Stephen Rothwell escreveu:
> Hi,
> 
> On Sun, 21 Nov 2010 20:58:54 -0500 Arnaud Lacombe <lacombar@gmail.com> wrote:
>>
>> There is 2 patches which fixes that by adding to the kconfig language
>> a "visible" property to menus, 1 revert of "another" solution (which
>> works but does not scale) and 2 patch which makes usage of the new
>> property. Ack-ed and complemented by Mauro, but still waiting
>> review/blessing by Michal.
>>
>> The core change is available here: https://patchwork.kernel.org/patch/306412/
>>
>> Alternatively, if you don't care about the menu structure, Randy
>> proposed a one-liner.
> 
> OK, good to know it is being worked on.  Thanks.
> 

I added a branch on my tree with Arnaud patches and my additional patch, at:

http://git.kernel.org/?p=linux/kernel/git/mchehab/linux-next.git;a=shortlog;h=refs/heads/kconfig_fixes

This way, we avoid loosing the patches, and people might use it to remove those warnings.

Cheers,
Mauro

PS.: I don't intend to merge them on my master branch, as the proper way is to submit it
to 2.6.37 via Michal's tree. Also, it will may cause conflicts on linux-next, due to the
bison-generated files.
