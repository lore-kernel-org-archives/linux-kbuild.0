Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52267 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751083AbdAWO74 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 09:59:56 -0500
Date: Mon, 23 Jan 2017 15:59:52 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH] firmware/Makefile: force recompilation if makefile
 changes
Message-ID: <20170123145952.GM13946@wotan.suse.de>
References: <20170118173156.16060-1-mcgrof@kernel.org>
 <20170119101507.GA18592@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170119101507.GA18592@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ming.lei@canonical.com, wagi@monom.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On Thu, Jan 19, 2017 at 11:15:07AM +0100, Greg KH wrote:
> On Wed, Jan 18, 2017 at 09:31:56AM -0800, Luis R. Rodriguez wrote:
> > If you modify the target asm we currently do not force the
> > recompilation of the firmware files. The target asm is in
> > the firmware/Makefile, peg this file as a dependency to
> > require re-compilation of firmware targets when the asm
> > changes.
> 
> Why would changing the Makefile require the asm to change?

The Makefile is the file that provides the assembly logic, so
changing the asm should affect recreating the binary.

> Anyway, this should go through the kbuild tree, not mine, they know
> Makefiles much better than I do...

Will send it there. Thanks.

  Luis
