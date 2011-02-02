Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:44589 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751706Ab1BBJv2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Feb 2011 04:51:28 -0500
Date: Wed, 2 Feb 2011 09:51:27 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
Message-ID: <20110202095127.GG19835@vostochny.stro.at>
References: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr> <4D492525.20402@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4D492525.20402@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Nikolai Kondrashov <spbnick@gmail.com>, Nicolas de =?iso-8859-1?Q?Peslo=FCan?= <nicolas.2p.debian@gmail.com>

Hello Michal,

On Wed, Feb 02, 2011 at 10:34:29AM +0100, Nicolas de Pesloüan wrote:
> Le 24/01/2011 14:41, Nicolas de Pesloüan a écrit :
>
> Hi Michal,
>
> Any troubles with my patch? I still don't find it in any branchs of  
> git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild-2.6.git
>
> It depends on commit 1b9a50d931a04ba007cc1a926fead3ff4b5afa9b, from 
> Maximilian Attems, (in for-next), because it changes the same lines in 
> scripts/package/builddeb.
>
> But, as the problem it fixes cause make deb-pkg to fail, it might be pushed to rc-fixes... ?
>
> Do you want me to rebase it on rc-fixes? (This would cause a future merge 
> to fail when applying the patch from Maximilian, but...).

Indeed it be cool to have those fixes landed for 2.6.38.

I was already a bit upset by your policy to root any deb-pkg
for the next release cycle (the umask fix for example).
Especially considering that the first one of aboves listed fixes
is a *oneliner*.

Without these 2 fixes it is hard to recommmend to our users to use deb-pkg.
They are needed for a working make deb-pkg in 2.6.38.

thank you

-- 
maks
