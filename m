Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.asbjorn.biz ([217.195.185.3]:54083 "EHLO mail.asbjorn.biz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753323Ab0LCTh2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Dec 2010 14:37:28 -0500
Message-ID: <4CF946F5.6040103@asbjorn.biz>
Date: Fri, 03 Dec 2010 19:37:25 +0000
From: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <asbjorn@asbjorn.biz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, deb-pkg: support overriding userland architecture
References: <4CD5A6C8.8030603@asbjorn.biz> <1289070320-20726-1-git-send-email-asbjorn@asbjorn.biz> <20101203174800.GA952@stro.at>
In-Reply-To: <20101203174800.GA952@stro.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, debian-kernel@lists.debian.org

Hi Max,

On 12/03/2010 05:48 PM, maximilian attems wrote:
> On Sat, 06 Nov 2010, Asbjoern Sloth Toennesen wrote:
>> Usefull if building for sparc64 userland, because the
>> sparc and sparc64 userlands use the same 64-bit kernel,
>> making it impossible to always select the correct userland
>> architecture for the resulting debian package.
>>
>> Might also be usefull, if you want a i386 userland with a amd64 kernel.
>>
>> Example usage:
>> 	make DEBARCH=i386 deb-pkg
>>
>> This patch is based on my 'kbuild, deb-pkg: select
>> userland architecture based on UTS_MACHINE' patch.
>
> care to repost with KBUILD_ prefix, to keep namespace sane and mention
> in  Documentation/kbuild/kbuild.txt together with the relevant acks.
> It be really cool to have that in next 2.6.38.

Sure its on my todo for the weekend, have just had an insane week.

I just noticed the armhf port effort yesterday, that would also need
this patch, I will add your Ack-by when sending the updated patch.

I also have a bunch of e1000e cleanups scheduled for 2.6.38, will submit
to netdev this weekend as well.

Thanks, for the reminding effort.

-- 
Best regards
Asbjørn Sloth Tønnesen
asbjorn.biz
