Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53688 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752799Ab2BRVe7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Feb 2012 16:34:59 -0500
Date: Sat, 18 Feb 2012 22:34:57 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] builddeb: Don't create files in /tmp with predictable
 names
Message-ID: <20120218213457.GA8332@sepie.suse.cz>
References: <1329315449.3048.78.camel@deadeye>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329315449.3048.78.camel@deadeye>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>, Joerg Roedel <joerg.roedel@amd.com>, Maximilian Attems <max@stro.at>

On Wed, Feb 15, 2012 at 02:17:29PM +0000, Ben Hutchings wrote:
> The current use of /tmp for file lists is insecure.  Put them under
> $objtree/debian instead.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: stable@vger.kernel.org

Thanks, applied. How could I have missed that bug :-/.

Michal
