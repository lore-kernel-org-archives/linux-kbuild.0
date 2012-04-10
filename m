Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57032 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752448Ab2DJI50 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Apr 2012 04:57:26 -0400
Message-ID: <4F83F5F2.1090305@suse.cz>
Date: Tue, 10 Apr 2012 10:57:22 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/config: properly report and set string options
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr> <20120409153006.GA28221@kroah.com> <201204091802.29839.yann.morin.1998@free.fr>
In-Reply-To: <201204091802.29839.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>

On 9.4.2012 18:02, Yann E. MORIN wrote:
> Greg, All,
>> How does this fit the Documentation/stable_kernel_rules.txt
> 
> Sorry, I was not aware of this list... My bad...
> I'll know for next time. Thanks!
> 
>> qualification for a patch to be added to the stable releases?
> 
> I believe it qualifies because:
>   - it is rather trivial
>   - it breaks the build for users that tweak the kernel configuration from
>     an upper-layer (aka 'integrated') build-system, using this script which
>     is bundled with the kernel in the first place.
>   - I am a 'real people', and 'it bothers' me ;-)
> 
> OTOH, it does not qualify because:
>   - there is no Tested-by:
>   - I forgot to specify which version it should be applied to
>   - obviously, this fix is not yet in Linus' tree

Of course it's not in Linus' tree. But the point of the Cc: stable line
is that you submit your patch to mainline and don't need to follow up
with an extra submission to stable.


> If you think that the first item, above, warrants a -stable fix, then I'll
> properly re-submit once the patch is in Linus' tree.
> 
> Michal, should I re-send an updated patch whithout the CC:stable?

If Greg does not want this for stable, I will drop the line myself.

Michal
