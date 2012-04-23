Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:54155 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754575Ab2DWUMa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Apr 2012 16:12:30 -0400
Received: by dadz8 with SMTP id z8so16009119dad.10
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Apr 2012 13:12:30 -0700 (PDT)
Date: Mon, 23 Apr 2012 13:12:26 -0700
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT] modpost fix for newer toolchain
Message-ID: <20120423201226.GA22593@kroah.com>
References: <20120423184918.GA27862@sepie.suse.cz>
 <20120423192201.GA18512@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120423192201.GA18512@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Mon, Apr 23, 2012 at 09:22:01PM +0200, Sam Ravnborg wrote:
> On Mon, Apr 23, 2012 at 08:49:18PM +0200, Michal Marek wrote:
> > Hi Linus,
> > 
> > Please pull this modpost patch. It fixes build failure with newer gcc that adds
> > some internal symbols that end in "__mod_*_device_table", but are not
> > actually the tables themselves.
> > 
> > Michal
> > 
> > The following changes since commit 0eb043d0eec44cd083ea6910b1db2f77eb212ebd:
> > 
> >   Subject: [PATCH] tags.sh: Add missing quotes (2012-04-02 11:28:17 +0200)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git rc-fixes
> > 
> > for you to fetch changes up to e88aa7bbbe3046a125ea1936b16bb921cc9c6349:
> > 
> >   Fix modpost failures in fedora 17 (2012-04-18 21:42:07 +0200)
> 
> Hi Michal.
> 
> The patch missed a "Cc: stable..." as discussed in the thread about
> said patch.

What is the git commit id of the patch in Linus's tree that I should add
to stable?

thanks,

greg k-h
