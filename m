Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:35602 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568AbYLCVc1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:32:27 -0500
Date: Wed, 3 Dec 2008 22:33:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 2/8] genksyms: allow to ignore symbol checksum changes
Message-ID: <20081203213348.GE7599@uranus.ravnborg.org>
References: <200812012221.mB1ML37d013060@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML37d013060@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, agruen@suse.de, randy.dunlap@oracle.com

On Mon, Dec 01, 2008 at 02:21:03PM -0800, akpm@linux-foundation.org wrote:
> From: Andreas Gruenbacher <agruen@suse.de>
> 
> This adds an "override" keyword for use in *.symvers / *.symref files. 
> When a symbol is overridden, the symbol's old definition will be used for
> computing checksums instead of the new one, preserving the previous
> checksum.  (Genksyms will still warn about the change.)
> 
> This is meant to allow distributions to hide minor actual as well as fake
> ABI changes.  (For example, when extra type information becomes available
> because additional headers are included, this may change checksums even
> though none of the types used have actully changed.)
> 
> This approach also allows to get rid of "#ifdef __GENKSYMS__" hacks in the
> code, which are currently used in some vendor kernels to work around
> checksum changes.
> 
> Signed-off-by: Andreas Gruenbacher <agruen@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied.

	Sam
