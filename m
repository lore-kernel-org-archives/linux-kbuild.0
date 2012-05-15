Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:37683 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S965749Ab2EOWUn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 May 2012 18:20:43 -0400
Date: Wed, 16 May 2012 00:14:27 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Message-ID: <20120515221427.GA9277@pobox.suse.cz>
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr> <201204192307.28282.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201204192307.28282.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

On Thu, Apr 19, 2012 at 11:07:28PM +0200, Yann E. MORIN wrote:
> Michal, All,
> 
> On Monday 09 April 2012 14:49:10 Yann E. MORIN wrote:
> > Currently, scripts/config removes the leading double-quote from
> > string options, but leaves the trailing double-quote.
> > 
> > Also, double-quotes in a string are escaped, but scripts/config
> > does not unescape those when printing
> > 
> > Finally, scripts/config does not escape double-quotes when setting
> > string options.
> 
> Ping? I have not seen this be applied to your tree, neither in for-next,
> nor in rc-fixes.

I applied it to kbuild.git#kconfig now, sorry for the delay.
