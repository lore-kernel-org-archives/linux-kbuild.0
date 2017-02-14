Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751893AbdBNTeS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Feb 2017 14:34:18 -0500
Date: Tue, 14 Feb 2017 20:34:15 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2] firmware/Makefile: force recompilation if makefile
 changes
Message-ID: <20170214193415.GY24047@wotan.suse.de>
References: <20170118173156.16060-1-mcgrof@kernel.org>
 <20170123150727.4883-1-mcgrof@kernel.org>
 <20170206220352.GB24047@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170206220352.GB24047@wotan.suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, ming.lei@canonical.com, gregkh@linuxfoundation.org, teg@jklm.no, linux-kernel@vger.kernel.org, dwmw2@infradead.org

On Mon, Feb 06, 2017 at 11:03:52PM +0100, Luis R. Rodriguez wrote:
> On Mon, Jan 23, 2017 at 07:07:27AM -0800, Luis R. Rodriguez wrote:
> > If you modify the target asm we currently do not force the
> > recompilation of the firmware files. The target asm is in
> > the firmware/Makefile, peg this file as a dependency to
> > require re-compilation of firmware targets when the asm
> > changes.
> > 
> > Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
> > ---
> > 
> > Michal,
> > 
> > I had this patch as part of my linker table series [0] but have split it
> > off as its a small atomic separate change and can go in separately. Greg
> > prefers this be reviewed by the kbuild tree so sending it your way.
> > This v2 has no modifications, just resending it to the kbuild tree.
> > 
> > [0] https://lkml.kernel.org/r/20170115211057.17167-1-mcgrof@kernel.org
> 
> *Poke*

*Re-poke*

 Luis
