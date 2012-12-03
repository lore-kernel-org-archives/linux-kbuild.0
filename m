Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51211 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754395Ab2LCErW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 2 Dec 2012 23:47:22 -0500
Date: Mon, 3 Dec 2012 12:47:27 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: Re: [PATCH] lxdialog:inputbox: Fix can't change selected button with
 Left/Right when input box selected
Message-ID: <20121203044727.GA3856@udknight>
References: <20121202163509.GB20796@udknight>
 <201212021832.44326.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201212021832.44326.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

On Sun, Dec 02, 2012 at 06:32:43PM +0100, Yann E. MORIN wrote:
> Wang, All,
> 
> On Sunday 02 December 2012 Wang YanQing wrote:
> > inputbox code don't support use Left/Right to change input
> > position in the input box, so it use continue to skip them
> > when input key is Left/Right, but use break for Up/Down, so
> > we can change selected button with Up/Down but we can't do it
> > with Left/Right key when input box selected.
> > This patch fix it.
> 
> Although I do understand the motivation behind your change, may I suggest
> that left/right are used to navigate *inside* the input field, so it is
> possible to modify the text in place?
Hi Yann,All,
I understand what you say, and I also want inputbox support
changing input position with Left/Right. But this patch is accepted 
before somebody make it come true, right?

Thanks
