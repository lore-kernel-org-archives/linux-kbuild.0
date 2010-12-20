Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43006 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757180Ab0LTPjs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 10:39:48 -0500
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.suse.de (Postfix) with ESMTP id E13AE94E22
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2010 16:39:47 +0100 (CET)
Date: Mon, 20 Dec 2010 16:39:47 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] miscellaneous Kconfig cleanup
Message-ID: <20101220153947.GD20492@sepie.suse.cz>
References: <4CFD1D7F0200007800026260@vpn.id2.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4CFD1D7F0200007800026260@vpn.id2.novell.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Dec 06, 2010 at 04:29:35PM +0000, Jan Beulich wrote:
> Even generally, having a defualt of "n" isn't very useful (as that's
> what kconfig defaults to anyway), but it is potentially going to cause
> confusion when enforced on options with invisible (or even withou any
> prompt: If such an option's prompt becomes visible later, the user
> will not be asked whether (s)he wants to turn on the option.
> 
> Besides that, use def_bool instead of the bool/default pair to make
> things a little shorter.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>

You can add
Acked-by: Michal Marek <mmarek@suse.cz>
on the patch if you like, but IMO this should go as individual patches
to the subsystem maintainers. Alternatively, you could use
trivial@kernel.org for such tree-wide fix.

Michal
