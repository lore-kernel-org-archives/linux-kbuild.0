Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:36153 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752596AbZK0Jmg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2009 04:42:36 -0500
Message-ID: <4B0F9F0D.6010601@suse.cz>
Date: Fri, 27 Nov 2009 10:42:37 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: linux-kbuild.git
References: <4B0E73E1.50900@suse.cz>	<20091126193750.GA15453@merkur.ravnborg.org> <20091127152211.55043dbb.sfr@canb.auug.org.au>
In-Reply-To: <20091127152211.55043dbb.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, =?ISO-8859-2?Q?An=EDbal_Monsalve_?= =?ISO-8859-2?Q?Salazar?= <anibal@debian.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

On 27.11.2009 05:22, Stephen Rothwell wrote:
> Hi Michal,
> 
> On Thu, 26 Nov 2009 20:37:50 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> On Thu, Nov 26, 2009 at 01:26:09PM +0100, Michal Marek wrote:
>>>
>>> I went through the patches posted to linux-kbuild and picked those that
>>> were easy enough to review, looked safe and worked for me. I also took
>>> Sam's series from kbuild-next.git, but I didn't really review it yet, so
>>> there is no signoff from me (TBD). The repo is at
>>>
>>>   git://repo.or.cz/linux-kbuild.git for-next
>>
>> Looks good.
>> Good to see you picked up some of the patches that were pending.
>>
>> Stephen - please replace my kbuild trees with this.
> 
> I have replaced this from today.

Thanks!


>  Do you intend to run the equivalent of
> the kbuild-current tree (bug fixes for the current release while they are
> waiting to go to Linus)?  I have removed the kbuild-current tree for now
> since the only commit in it is in the new kbuild tree.

I plan to maintain such a branch, but I thought I would base the
for-next branch on top of it, so that you get everything in one pack. Or
would you still prefer to have two kbuild branches in linux-next, so
that you can remove the for-next branch if necessary and keep the
for-current branch? Just tell me what fits you best.



> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

OK, will keep that in mind.

Michal
