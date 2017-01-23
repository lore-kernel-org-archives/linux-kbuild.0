Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42880 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751183AbdAWPCi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 10:02:38 -0500
Date: Mon, 23 Jan 2017 16:02:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] firmware/Makefile: force recompilation if makefile
 changes
Message-ID: <20170123150235.GA26884@kroah.com>
References: <20170118173156.16060-1-mcgrof@kernel.org>
 <20170119101507.GA18592@kroah.com>
 <20170123145952.GM13946@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170123145952.GM13946@wotan.suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: ming.lei@canonical.com, wagi@monom.org, dwmw2@infradead.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

On Mon, Jan 23, 2017 at 03:59:52PM +0100, Luis R. Rodriguez wrote:
> On Thu, Jan 19, 2017 at 11:15:07AM +0100, Greg KH wrote:
> > On Wed, Jan 18, 2017 at 09:31:56AM -0800, Luis R. Rodriguez wrote:
> > > If you modify the target asm we currently do not force the
> > > recompilation of the firmware files. The target asm is in
> > > the firmware/Makefile, peg this file as a dependency to
> > > require re-compilation of firmware targets when the asm
> > > changes.
> > 
> > Why would changing the Makefile require the asm to change?
> 
> The Makefile is the file that provides the assembly logic, so
> changing the asm should affect recreating the binary.

Ah, I see it now, that's horrid, echoing asm from the Makefile itself :)

thanks,

greg k-h
