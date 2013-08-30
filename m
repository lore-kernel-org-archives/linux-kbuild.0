Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:49005 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756845Ab3H3Tlp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Aug 2013 15:41:45 -0400
Date: Fri, 30 Aug 2013 15:41:45 -0400
From: Mike Pagano <mpagano@gentoo.org>
Subject: Re: [PATCH RESEND] diffconfig: Update script to support python
 versions 2.5 through 3.3
Message-ID: <20130830194145.GA6522@woodpecker.gentoo.org>
References: <20130820184112.GA18525@woodpecker.gentoo.org>
 <20130828115706.GA17212@woodpecker.gentoo.org>
 <5220B236.1040009@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5220B236.1040009@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Fri, Aug 30, 2013 at 04:54:46PM +0200, Michal Marek wrote:
> On 28.8.2013 13:57, Mike Pagano wrote:
> > On Tue, Aug 20, 2013 at 02:41:12PM -0400, Mike Pagano wrote:
> >> Support past and active versions of python while maintaining backward compatibility.
> > Any feedback or thoughts on this patch?
> 
> Sorry for the delay. It works great, even with 2.4. You just forgot to
> add your signoff, can I add
> 
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> 
> ?
> 
> Michal


Yes, sorry about that and thanks for taking the time to look at it.
