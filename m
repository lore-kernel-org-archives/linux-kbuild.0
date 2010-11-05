Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.asbjorn.biz ([217.195.185.3]:40568 "EHLO mail.asbjorn.biz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751782Ab0KEN3p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Nov 2010 09:29:45 -0400
Message-ID: <4CD406C7.8090801@asbjorn.biz>
Date: Fri, 05 Nov 2010 13:29:43 +0000
From: =?ISO-8859-1?Q?Asbj=F8rn_Sloth_T=F8nnesen?= <asbjorn@asbjorn.biz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: select userland architectire based on
 UTS_MACHINE
References: <4CD2A8BC.3010500@suse.cz> <1288960361-6407-1-git-send-email-asbjorn@asbjorn.biz> <20101105124129.GO15146@vostochny.stro.at>
In-Reply-To: <20101105124129.GO15146@vostochny.stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, debian-kernel@lists.debian.org

On 11/05/2010 12:41 PM, maximilian attems wrote:
> On Fri, Nov 05, 2010 at 12:32:41PM +0000, Asbjoern Sloth Toennesen wrote:
>> Instead of creating the debian package for the compiling userland,
>> create it for a userland matching the kernel thats being compiled.
>>
>> This patch supports all Lenny release architectures,
>> and Linux-based architecture candidates for Squeeze.
>>
>> If it can't find a proper Debian userspace it displays a warning,
>> and fallback to let deb-gencontrol use the host's userspace arch.
>>
>> Eg. with this patch the following make command:
>>
>> 	make ARCH=i386 deb-pkg
>>
>> will output an i386 Debian package instead of an amd64 one,
>> when run on an amd64 machine.
>>
>> Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
> 
> thank you, indeed very cool.

Thanks.

>> [...]
>> +	case "$UTS_MACHINE" in
>> +	i386|ia64|alpha|hppa)
>> +		debarch="$UTS_MACHINE" ;;
> 
> small nitpick parisc* != hppa

Right, hppa should be by it self.
