Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:35055 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932224AbcLIDkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 22:40:23 -0500
Received: by mail-io0-f169.google.com with SMTP id h30so36502292iod.2
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Dec 2016 19:40:23 -0800 (PST)
Date: Thu, 8 Dec 2016 22:40:21 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [regression ?] kbuild: fix building bzImage with CONFIG_TRIM_UNUSED_KSYMS
 enabled
In-Reply-To: <20161209025637.GC4661@jagdpanzerIV.localdomain>
Message-ID: <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain> <20161209025637.GC4661@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 9 Dec 2016, Sergey Senozhatsky wrote:

> On (12/09/16 11:43), Sergey Senozhatsky wrote:
> > 
> > after 53924022d8a ("kbuild: fix building bzImage withCONFIG_TRIM_UNUSED_KSYMS
> > enabled") all of my build scripts build the kernel without the modules.
> 
> [..]
> > +# For the kernel to actually contain only the needed exported symbols,
> > +# we have to build modules as well to determine what those symbols are.
> > +# (this can be evaluated only once include/config/auto.conf has been included)
> 					^^^^^
> 
> ah, the config. so the patch is wrong.

Furthermore, the export statement exports the variable not its value. 
Even if the value is changed afterwards, referencing the exported 
variable will see the new value.

You can try out this little Makefile to prove it:

FOOBAR := 0
export FOOBAR
FOOBAR := 1
all:
	echo FOOBAR is $$FOOBAR


Nicolas
