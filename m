Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53202 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752110AbcCOAZB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 20:25:01 -0400
Date: Tue, 15 Mar 2016 11:24:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL v4.6]  MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160315112458.7248d665@canb.auug.org.au>
In-Reply-To: <1457999823.11972.143.camel@perches.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Jeffrey Merkey <jeffmerkey@gmail.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Joe,

On Mon, 14 Mar 2016 16:57:03 -0700 Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2016-03-14 at 17:50 -0600, Jeffrey Merkey wrote:
> > The following changes since commit b562e44f507e863c6792946e4e1b1449fbbac85d:
> > 
> >   Linux 4.5 (2016-03-13 21:28:54 -0700)
> > 
> > are available in the git repository at:
> > 
> >   https://github.com/jeffmerkey/linux.git tags/mdb-v4.5-signed
> > 
> > for you to fetch changes up to 2e9c184e1215dca2b4c59c347f40a0986b8e7460:
> > 
> >   Add MDB Debugger to linux v4.5 (2016-03-14 15:17:44 -0600)  
> 
> If Linus doesn't pull this, Stephen, could you please add this
> tree to -next so it has some testing and validation done?

Well, I really need a request from the ongoing maintainer and also some
indication of which kernel release (if any) it is likely to be merged
into ...

As a general rule, I do not add trees to linux-next during the merge
window (there have been some special cases when something was going in
during that merge window).

I do note that the single commit in that tag has no Signed-off-by,
Reviewed-by or Acked-by tags at all.  As such I can't see Linus merging
it as is.  The commit message also has no detail at all.  It is also
based on v4.5 which was only released yesterday.
-- 
Cheers,
Stephen Rothwell
