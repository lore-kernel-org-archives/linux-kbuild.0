Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:35517 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbYLCVcH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:32:07 -0500
Date: Wed, 3 Dec 2008 22:33:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 1/8] genksyms: track symbol checksum changes
Message-ID: <20081203213331.GD7599@uranus.ravnborg.org>
References: <200812012221.mB1ML2lO013046@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML2lO013046@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, agruen@suse.de, randy.dunlap@oracle.com

On Mon, Dec 01, 2008 at 02:21:01PM -0800, akpm@linux-foundation.org wrote:
> From: Andreas Gruenbacher <agruen@suse.de>
> 
> Sometimes it is preferable to avoid changes of exported symbol checksums
> (to avoid breaking externally provided modules).  When a checksum change
> occurs, it can be hard to figure out what caused this change: underlying
> types may have changed, or additional type information may simply have
> become available at the point where a symbol is exported.
> 
> Add a new --reference option to genksyms which allows it to report why
> checksums change, based on the type information dumps it creates with the
> --dump-types flag.  Genksyms will read in such a dump from a previous run,
> and report which symbols have changed (and why).
> 
> The behavior can be controlled for an entire build as follows: If
> KBUILD_SYMTYPES is set, genksyms uses --dump-types to produce *.symtypes
> dump files.  If any *.symref files exist, those will be used as the
> reference to check against.  If KBUILD_PRESERVE is set, checksum changes
> will fail the build.
> 
> Signed-off-by: Andreas Gruenbacher <agruen@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Randy Dunlap <randy.dunlap@oracle.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied.

	Sam
