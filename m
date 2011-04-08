Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:42382 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752664Ab1DHLU3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Apr 2011 07:20:29 -0400
Date: Fri, 8 Apr 2011 13:20:27 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig: Avoid buffer underrun in choice input
Message-ID: <20110408112027.GA4894@sepie.suse.cz>
References: <1300508770.26693.73.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1300508770.26693.73.camel@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

On Sat, Mar 19, 2011 at 04:26:10AM +0000, Ben Hutchings wrote:
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
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: stable@kernel.org [2.6.17+]
> ---
>  scripts/kconfig/conf.c |    2 +-

Applied to kbuild-2.6.git#kconfig, thanks.

Michal
