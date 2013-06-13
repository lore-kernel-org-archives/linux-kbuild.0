Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41807 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750762Ab3FMHL4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jun 2013 03:11:56 -0400
Subject: Re: Dependencies in the HID subsystem
From: Jean Delvare <jdelvare@suse.de>
In-Reply-To: <alpine.LNX.2.00.1305292245090.30576@pobox.suse.cz>
References: <1369855174.4306.198.camel@chaos.site>
	 <alpine.LNX.2.00.1305292245090.30576@pobox.suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Jun 2013 09:11:46 +0200
Message-ID: <1371107506.4289.25.camel@chaos.site>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: Michal Marek <mmarek@suse.cz>, linux-input@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Jiri,

Sorry for the late reply.

Le Wednesday 29 May 2013 à 22:52 +0200, Jiri Kosina a écrit :
> On Wed, 29 May 2013, Jean Delvare wrote:
> 
> > I am worried and confused by some Kconfig dependencies in the HID
> > subsystem.
> > 
> > There are 11 HID device drivers which are defined in drivers/hid/Kconfig
> > with:
> > 
> > 	tristate "..." if EXPERT
> > 	default !EXPERT
> > 
> > Unless EXPERT is enabled (and that's not the default), these driver
> > entries are hidden and automatically selected. If CONFIG_HID=m, they are
> > selected as modules. If CONFIG_HID=y, they are built into the kernel. So
> > it is impossible to have CONFIG_HID=y and build these device drivers as
> > modules - as device drivers typically are.
> > 
> > I would like to understand the reasoning behind this complexity. What is
> > so special about these 11 drivers, that we can't just let the (kernel
> > configuring) user chose if he/she wants them and in what form?
> 
> That's quite a old story with some history behind. Linus himself 
> originally requested it, then much later asked the same question you did. 
> See some background here:
> 
> 	https://lkml.org/lkml/2010/5/20/227

This explains it all, thank you.

>> (...)
> > Put in short, I don't like the way things are today and would welcome
> > changes in this area.
> 
> As things have changed a lot since 2.6.28, we can try to put things more 
> in line now for 3.11 or so.

This is great news. Will it just happen, or is some contribution
expected from me? That's not my area, but if you want me to write some
patches or test things, just ask and I'll do my best.

Thanks,
-- 
Jean Delvare
Suse L3

