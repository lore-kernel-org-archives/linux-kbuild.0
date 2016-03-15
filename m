Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:46690 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750892AbcCOPQb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 11:16:31 -0400
Date: Tue, 15 Mar 2016 11:16:18 -0400
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160315151618.GQ29218@thunk.org>
References: <20160314235035.GA5799@localhost.localdomain>
 <1457999823.11972.143.camel@perches.com>
 <20160315112458.7248d665@canb.auug.org.au>
 <CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
 <20160315130339.688689bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160315130339.688689bd@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeffrey Merkey <jeffmerkey@gmail.com>, Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Mar 15, 2016 at 01:03:39PM +1100, Stephen Rothwell wrote:
> We don't generally PGP (GPG) sign commits in the kernel tree (so "-S"
> is not required), just tags.  However we always require that anyone who
> handles a patch adds a Signed-off-by line to the final commit.  See
> Documentation/SubmittingPatches Section 11.

In general all commits should have a Signed-Off-By line added.  Once
the git branch gets merged, it's hard to tell what is the final commit
and what isn't, and in general different commits will have different
people needing to vouch for the origins for the contents of that commit.

Cheers,

							- Ted
							
