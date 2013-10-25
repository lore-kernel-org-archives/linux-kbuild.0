Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49733 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751548Ab3JYNPR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Oct 2013 09:15:17 -0400
Date: Fri, 25 Oct 2013 15:15:14 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/2] deb-pkg: Add automatic support for s390x architecture
Message-ID: <20131025131513.GA8297@sepie.suse.cz>
References: <1381079114.2788.26.camel@deadeye.wl.decadent.org.uk>
 <20131007133835.GI11166@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131007133835.GI11166@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild <linux-kbuild@vger.kernel.org>, debian-s390@lists.debian.org

On Mon, Oct 07, 2013 at 03:38:35PM +0200, maximilian attems wrote:
> On Sun, Oct 06, 2013 at 06:05:14PM +0100, Ben Hutchings wrote:
> > The Debian s390x architecture has 64-bit userland whereas s390 has
> > 32-bit userland.  A 64-bit kernel can be used with either.  Now that
> > Debian supports multiarch and officially supports s390x, it makes more
> > sense to assign a 64-bit kernel package to s390x.
> > 
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Acked-by: maximilian attems <max@stro.at>

Added to kbuild.git#misc, thanks.

Michal
