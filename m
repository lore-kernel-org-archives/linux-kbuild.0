Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qa0-f41.google.com ([209.85.216.41]:50606 "EHLO
	mail-qa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757245AbaEKMeX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 May 2014 08:34:23 -0400
Received: by mail-qa0-f41.google.com with SMTP id dc16so6010852qab.28
        for <linux-kbuild@vger.kernel.org>; Sun, 11 May 2014 05:34:23 -0700 (PDT)
Date: Sun, 11 May 2014 08:34:20 -0400
From: Tejun Heo <tj@kernel.org>
Subject: Re: Searching for insight into lib-y and lib-m
Message-ID: <20140511123420.GA22945@htj.dyndns.org>
References: <20140511022458.12073.qmail@ns.horizon.com>
 <536EFC71.3070209@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536EFC71.3070209@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: George Spelvin <linux@horizon.com>, linux-kbuild@vger.kernel.org

On Sat, May 10, 2014 at 09:28:33PM -0700, Randy Dunlap wrote:
> > Documentation/kbuild/makefiles.txt suggests that CONFIG_GLOB=m would
> > be synonymous with CONFIG_GLOB=y in this case, so the net effect would
> > be identical to case 3.  Am I right?
> > 
> 
> 'git log lib/Makefile' shows me patches that I have submitted where
> kernel modules were built as loadable modules (=m) and library code was
> built but then apparently discarded, so the "driver" modules could not
> load (were missing some needed symbols).

Shouldn't we fix that?  At least for in-kernel modules?

> See fcd40d69afea8700eda8cbf381f6d160cf757ebf
> and b4d3ba3346f092b9185da991414775281ceacaac.
> I'm sure that there have been others that were similar.
> These are just the most recent two patches in that category.
> > 
> > May I humbly beg some guidance as to the best way to proceed?  My current code
> > takes option 2 and builds its own module if CONFIG_ATA=m, but people are asking if
> > that's really necessary.
> 
> I don't see a problem with that, but Michal should be able to speak about that.

It's more cumbersome and involved.  It's kinda sad to have to do this
because our lib-* can't handle in-kernel modules.

Thanks.

-- 
tejun
