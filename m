Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48915 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751479AbcEJTPa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 15:15:30 -0400
Date: Tue, 10 May 2016 21:15:29 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH v5] kconfig/symbol.c: handle choice_values that depend
	on 'm' symbols
Message-ID: <20160510191529.GA18472@pobox.suse.cz>
References: <201604201924.7peNMcCF%fengguang.wu@intel.com> <ghinz04yaz.fsf@lena.gouders.net> <57271332.1090308@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57271332.1090308@ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roger Quadros <rogerq@ti.com>
Cc: Dirk Gouders <dirk@gouders.net>, Michal Marek <mmarek@suse.cz>, kbuild-all@01.org, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Bin Liu <binmlist@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>

On Mon, May 02, 2016 at 11:43:30AM +0300, Roger Quadros wrote:
> On 29/04/16 11:24, Dirk Gouders wrote:
> > If choices consist of choice_values of type tristate that depend on
> > symbols set to 'm', those choice_values are not set to 'n' if the
> > choice is changed from 'm' to 'y' (in which case only one active
> > choice_value is allowed). Those values are also written to the config
> > file causing modules to be built when they should not.
> > 
> > The following config can be used to reproduce and examine the problem;
> > with the frontend of your choice set "Choice 0" and "Choice 1" to 'm',
> > then set "Tristate Choice" to 'y' and save the configuration:
> > 
> > config modules
> > 	boolean modules
> > 	default y
> > 	option modules
> > 
> > config dependency
> > 	tristate "Dependency"
> > 	default m
> > 
> > choice
> > 	prompt "Tristate Choice"
> > 	default choice0
> > 
> > config choice0
> > 	tristate "Choice 0"
> > 
> > config choice1
> > 	tristate "Choice 1"
> > 	depends on dependency
> > 
> > endchoice
> > 
> > This patch sets tristate choice_values' visibility that depend on
> > symbols set to 'm' to 'n' if the corresponding choice is set to 'y'.
> > 
> > This makes them disappear from the choice list and will also cause the
> > choice_values' value set to 'n' in sym_calc_value() and as a result
> > they are written as "not set" to the resulting .config file.
> > 
> > Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Signed-off-by: Dirk Gouders <dirk@gouders.net>
> > Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> > v5: This patch should handle tristate choice-values, only.
> > 
> >     I assumed that only tristate choice-values can have visibility 'm',
> >     which was wrong: tristate dependencies can result in 'm'
> >     visibility.
> > 
> >     So, add an explicit test if a symbol is of type tristate.
> > 
> >     I am a bit unsure how to handle Tested-By credits when patches change
> >     substantially and left the credits untouched but new test reports
> >     are welcome.
> 
> If you made a non cosmetic change old Tested-By tags aren't valid.
> 
> > 
> > ---
> 
> The USB gadget case works fine for me. Thanks :)
> 
> Tested-by: Roger Quadros <rogerq@ti.com>

Applied to kbuild.git#kconfig.

Michal
