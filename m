Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59151 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754292Ab1DONbg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Apr 2011 09:31:36 -0400
Date: Fri, 15 Apr 2011 15:31:30 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 0/2] kconfig: allow multiple inclusion of the same file
 (resent)
Message-ID: <20110415133129.GA10833@sepie.suse.cz>
References: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <201103152058.57151.yann.morin.1998@anciens.enib.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201103152058.57151.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

On Tue, Mar 15, 2011 at 08:58:57PM +0100, Yann E. MORIN wrote:
> Hello !
> 
> On Thursday 24 February 2011 19:36:41 Yann E. MORIN wrote:
> > This patch series makes it possible to source a file multiple times,
> > eg. from different files, and/or under different conditions. Care has
> > been taken to avoid circular inclusion, of course.
> 
> Really, no comment on this? :-)
> 
> Even if it is not wanted upstream, any comment on the validity of the code?

Sorry for the delay. I had a look at the patch now, and it doesn't allow
anything worse than what is already possible if you open-code the
included kconfig snippet. So I merged it into kbuild-2.6.git#kconfig.

Thanks,
Michal
