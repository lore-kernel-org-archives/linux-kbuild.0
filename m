Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:60869 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbeJRCTR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 22:19:17 -0400
Date: Wed, 17 Oct 2018 20:22:18 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/3] x86/mcelog: Remove one mce_helper definition
In-Reply-To: <20181017171034.GO22571@zn.tnic>
Message-ID: <alpine.DEB.2.21.1810172020070.1517@nanos.tec.linutronix.de>
References: <20181017170554.18841-1-bigeasy@linutronix.de> <20181017170554.18841-3-bigeasy@linutronix.de> <20181017171034.GO22571@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Tony Luck <tony.luck@intel.com>, linux-edac <linux-edac@vger.kernel.org>, x86@kernel.org

On Wed, 17 Oct 2018, Borislav Petkov wrote:

> On Wed, Oct 17, 2018 at 07:05:53PM +0200, Sebastian Andrzej Siewior wrote:
> > Commit 5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog
> > driver") moved the old interface into one file including mce_helper
> > definition as static and "extern".
> > 
> > Cc: Tony Luck <tony.luck@intel.com>
> > Cc: Borislav Petkov <bp@suse.de>
> > Cc: linux-edac <linux-edac@vger.kernel.org>
> > Cc: x86@kernel.org
> > Fixes:  5de97c9f6d85f ("x86/mce: Factor out and deprecate the /dev/mcelog driver")
> 
> I'm not sure about the Fixes: tag - it'll trigger a flood of backporting
> for no reason AFAICT.

Not when there is no Cc: stable. If the stable folks pick up stuff
nevertheless, shrug.

The fixes tag is interesting even for stuff which does not go into stable
because you can extract it properly and look at relations between original
commit and fix.

Thanks,

	tglx
