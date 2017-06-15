Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33020 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751727AbdFOBhg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 21:37:36 -0400
Received: by mail-pf0-f196.google.com with SMTP id w12so95384pfk.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jun 2017 18:37:35 -0700 (PDT)
Date: Thu, 15 Jun 2017 11:37:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [lkp] [+16673 bytes kernel size regression] [i386-tinyconfig]
 [b990389179] kbuild: switch to thin archives
Message-ID: <20170615113719.16cfe185@roar.ozlabs.ibm.com>
In-Reply-To: <20170614223353.GA1670@cloud>
References: <59391052.ngo8ElPla53Vg9/O%xiaolong.ye@intel.com>
        <20170608190025.48923437@roar.ozlabs.ibm.com>
        <20170612185258.GA24471@cloud>
        <20170613144520.31f07045@roar.ozlabs.ibm.com>
        <20170613221335.GA30312@cloud>
        <20170614095507.16365013@roar.ozlabs.ibm.com>
        <20170614223353.GA1670@cloud>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: kbuild test robot <xiaolong.ye@intel.com>, 0day robot <fengguang.wu@intel.com>, kbuild-all@01.org, linux-kbuild <linux-kbuild@vger.kernel.org>

cc'ing linux-kbuild

On Wed, 14 Jun 2017 15:33:53 -0700
Josh Triplett <josh@joshtriplett.org> wrote:

> On Wed, Jun 14, 2017 at 09:55:07AM +1000, Nicholas Piggin wrote:
> > On Tue, 13 Jun 2017 15:13:35 -0700
> > Josh Triplett <josh@joshtriplett.org> wrote:
> >   
> > > On Tue, Jun 13, 2017 at 02:45:20PM +1000, Nicholas Piggin wrote:  
> > > > On Mon, 12 Jun 2017 11:52:58 -0700
> > > > Josh Triplett <josh@joshtriplett.org> wrote:
> > > >     
> > > > > On Thu, Jun 08, 2017 at 07:00:25PM +1000, Nicholas Piggin wrote:    
> > > > > > FWIW, this is likely because existing linker attempts some type of
> > > > > > elimination of dead code/data on a per-compilation-unit basis,
> > > > > > which is probably slightly buggy anyway if you have implicit
> > > > > > references.
> > > > > > 
> > > > > > It's far more effective to do real link-time analysis of unused
> > > > > > code and data. Even with -ffunction-sections/-gc-sections (see
> > > > > > LD_DEAD_CODE_DATA_ELIMINATION) already in tree which is quite
> > > > > > basic, you can usually see some pretty big savings especially on
> > > > > > tiny configs.      
> > > > > 
> > > > > Enabling LD_DEAD_CODE_DATA_ELIMINATION within tinyconfig might be a good
> > > > > idea. However, is there a fundamental reason why this particular link
> > > > > change needs to break the *existing* dead-code elimination? I'd much
> > > > > rather avoid regressions, rather than just saying "we have another thing
> > > > > that might handle this".    
> > > > 
> > > > The build stuff to do it is a bit tricky. I think it's possible but I
> > > > have not quite managed it. It would require some more special casing of
> > > > lib targets which I did not spend too much time on that because I'd
> > > > rather go the other way and get rid of the lib handling stuff completely,
> > > > and move to real DCE -- most of the kernel is "library" anyway, lib/ is
> > > > not really special except being a bit more self-contained.
> > > > 
> > > > Here's i386-tinyconfig with LD_DEAD_CODE_DATA_ELIMINATION plus a small
> > > > fix for it:
> > > > 
> > > >    text	   data	    bss	    dec	    hex	filename
> > > >  655686	 203096	1191328	2050110	 1f483e	vmlinux.thin
> > > >  515359	 184856	1193996	1894211	 1ce743	vmlinux.dce
> > > > 
> > > > I'd rather just work toward that. We're almost there already.    
> > > 
> > > That does look promising. Would you consider sending in a patch to add
> > > CONFIG_LD_DEAD_CODE_DATA_ELIMINATION to tinyconfig, with the above stats
> > > (along with the pre-thin baseline stats), and I'll happily offer a
> > > Reviewed-by for it?  
> > 
> > Yes I would like to start providing it as an option for archs, we have
> > just a little more work to get in -- some of the MIPS and ARM guys
> > have been looking at it too. I would say 4.14 could be realistic if
> > this goes smoothly.
> > 
> > What I'd like to do is get the thin archives build working on all
> > archs, then start introducing this option. I realize 16K regressiion
> > intermediate is not ideal, but it could be pretty subtle breakage if
> > we get it wrong..  
> 
> The amount of savings here does certainly help, though. I'd really
> appreciate it if you tried to get both in during the same kernel cycle
> (at least for the most popular architectures), rather than having a
> substantial gap between the two.
> 
> Would you consider adding a note to the "thin" series providing some
> information about regaining the lost space via
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION?  And adding a patch to the
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION series that adds it to tinyconfig?
> (Or, alternatively, invert the sense of the config option, so that 'y'
> is a debug option to opt *out* of dead code elimination, which makes
> allnoconfig DTRT.)

I can add a note, but the DCE fixes and enablement really do have to
go through arch trees. It's a different kettle of fish than thin
archives and need linker script changes etc.

I was going to do the thin archives series on a per-arch basis too, but
Linus probably rightfully said just bite the bullet and switch them all
over. It would be nice to switch those and iron out any issues there
first.

You're right it would have been good to avoid the intermediate
regression. It's fairly small though and with definite path to resolving
it.

Thanks,
Nick
