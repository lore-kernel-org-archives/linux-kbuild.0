Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:57172 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751857Ab1BDOMb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Feb 2011 09:12:31 -0500
Message-ID: <4D4C094D.3020608@suse.cz>
Date: Fri, 04 Feb 2011 15:12:29 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
References: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr> <4D492525.20402@gmail.com> <20110202095127.GG19835@vostochny.stro.at>
In-Reply-To: <20110202095127.GG19835@vostochny.stro.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Nikolai Kondrashov <spbnick@gmail.com>, =?ISO-8859-1?Q?Nicolas_de_Peslo=FCan?= <nicolas.2p.debian@gmail.com>

On 2.2.2011 10:51, maximilian attems wrote:
> Hello Michal,
> 
> On Wed, Feb 02, 2011 at 10:34:29AM +0100, Nicolas de Pesloüan wrote:
>> Le 24/01/2011 14:41, Nicolas de Pesloüan a écrit :
>>
>> Hi Michal,
>>
>> Any troubles with my patch? I still don't find it in any branchs of  
>> git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
>>
>> It depends on commit 1b9a50d931a04ba007cc1a926fead3ff4b5afa9b, from 
>> Maximilian Attems, (in for-next), because it changes the same lines in 
>> scripts/package/builddeb.
>>
>> But, as the problem it fixes cause make deb-pkg to fail, it might be pushed to rc-fixes... ?
>>
>> Do you want me to rebase it on rc-fixes? (This would cause a future merge 
>> to fail when applying the patch from Maximilian, but...).
> 
> Indeed it be cool to have those fixes landed for 2.6.38.
> 
> I was already a bit upset by your policy to root any deb-pkg
> for the next release cycle (the umask fix for example).
> Especially considering that the first one of aboves listed fixes
> is a *oneliner*.
> 
> Without these 2 fixes it is hard to recommmend to our users to use deb-pkg.
> They are needed for a working make deb-pkg in 2.6.38.

I applied the patch, merged into rc-fixes and will be sending it to
Linus soon (I have to go through the backlog to see if there are any
other urgent things).

Michal
