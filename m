Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35570 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758655Ab1D0LTz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2011 07:19:55 -0400
Message-ID: <4DB7FBD8.20109@suse.cz>
Date: Wed, 27 Apr 2011 13:19:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Avoid buffer underrun in choice input
References: <1303580576.4815.3.camel@localhost>
In-Reply-To: <1303580576.4815.3.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On 23.4.2011 19:42, Ben Hutchings wrote:
> commit 40aee729b350672c2550640622416a855e27938f ('kconfig: fix default
> value for choice input') fixed some cases where kconfig would select
> the wrong option from a choice with a single valid option and thus
> enter an infinite loop.
>
> However, this broke the test for user input of the form 'N?', because
> when kconfig selects the single valid option the input is zero-length
> and the test will read the byte before the input buffer.  If this
> happens to contain '?' (as it will in a mips build on Debian unstable
> today) then kconfig again enters an infinite loop.
>
> Signed-off-by: Ben Hutchings<ben@decadent.org.uk>
> Cc: stable@kernel.org [2.6.17+]
> ---
> Roman has failed to respond to this after 5 weeks and one reminder, so
> please take it directly.

I applied this on 8th April, see
http://www.spinics.net/lists/linux-kbuild/msg04431.html. Please check 
linux-next before reposting patches next time, now I either have to 
rewind the kconfig branch or let Linus merge it with a duplicate commit :-(.

Michal
