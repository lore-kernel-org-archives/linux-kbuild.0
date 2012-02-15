Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:47167 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750904Ab2BOPYU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Feb 2012 10:24:20 -0500
Date: Wed, 15 Feb 2012 15:24:19 +0000
From: Maximilian Attems <max@stro.at>
Subject: Re: [PATCH] builddeb: Don't create files in /tmp with predictable
 names
Message-ID: <20120215152416.GB30020@vostochny.stro.at>
References: <1329315449.3048.78.camel@deadeye>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1329315449.3048.78.camel@deadeye>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Debian kernel maintainers <debian-kernel@lists.debian.org>, Joerg Roedel <joerg.roedel@amd.com>

On Wed, Feb 15, 2012 at 02:17:29PM +0000, Ben Hutchings wrote:
> The current use of /tmp for file lists is insecure.  Put them under
> $objtree/debian instead.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: stable@vger.kernel.org

Thanks Ben, this seems to have been added in 
cd8d60a20a4516016c117ac0f1ac7b06ff606f7e so affects >= 3.0 stable trees.

Acked-by: maximilian attems <max@stro.at>

