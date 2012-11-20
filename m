Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41046 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751937Ab2KTKWw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Nov 2012 05:22:52 -0500
Date: Tue, 20 Nov 2012 11:22:51 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 0/3 v3] kconfig: get the CONFIG_ prefix from the
 environment
Message-ID: <20121120102251.GA31243@sepie.suse.cz>
References: <1350687985-21053-1-git-send-email-yann.morin.1998@free.fr>
 <201210302336.15882.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201210302336.15882.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

On Tue, Oct 30, 2012 at 11:36:15PM +0100, Yann E. MORIN wrote:
> Hello!
> 
> On Saturday 20 October 2012 Yann E. MORIN wrote:
> > This little patch series allows one to override the CONFIG_ prefix at 
> > runtime, without the need to rebuild the frontends.
> 
> Any status on this one? ;-)

Applied to kbuild.git#kconfig now, sorry for the delay.

Michal
