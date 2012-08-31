Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39839 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751923Ab2HaNfE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Aug 2012 09:35:04 -0400
Date: Fri, 31 Aug 2012 15:35:01 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/kernel-doc: added support for html5
Message-ID: <20120831133501.GA11531@sepie.suse.cz>
References: <1344761175-19370-1-git-send-email-mail@danrl.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344761175-19370-1-git-send-email-mail@danrl.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Luedtke <mail@danrl.de>
Cc: linux-kbuild@vger.kernel.org, rdunlap@xenotime.net

On Sun, Aug 12, 2012 at 10:46:15AM +0200, Dan Luedtke wrote:
> New output option html5 writes validating HTML5 and adds
> CSS classes ready to be selected by third-party stylesheets.
> HTML ids have been added to block-level elements "article" for
> direct reference of particular objects via URL.
> 
> Signed-off-by: Dan Luedtke <mail@danrl.de>
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>
> ---
> Patch got first submitted split up in multiple patches at
> Wed, 25 Jul 2012 15:38:08 +0200 on LKML. Due to bad timing
> (in the middle of Randy Dunlop dropping maintainership) and
> maybe all of us are going on vacation in different weeks, the
> patch had no chance to make it through. Randy suggested to
> resend the patch and kindly acked-by it already.
> Thank you for your patience and help.

I applied it to kbuild.git#misc now, thanks.

Michal
