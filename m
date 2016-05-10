Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49569 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751227AbcEJTWH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 15:22:07 -0400
Date: Tue, 10 May 2016 21:22:07 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH v2] kbuild: fix if_change and friends to consider
	argument order
Message-ID: <20160510192206.GB18472@pobox.suse.cz>
References: <1462603706-6324-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462603706-6324-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

On Sat, May 07, 2016 at 03:48:26PM +0900, Masahiro Yamada wrote:
> Currently, arg-check is implemented as follows:
> 
>   arg-check = $(strip $(filter-out $(cmd_$(1)), $(cmd_$@)) \
>                       $(filter-out $(cmd_$@),   $(cmd_$(1))) )
> 
> This does not care about the order of arguments that appear in
> $(cmd_$(1)) and $(cmd_$@).  So, if_changed and friends never rebuild
> the target if only the argument order is changed.  This is a problem
> when the link order is changed.
> 
> Apparently,
> 
>   obj-y += foo.o
>   obj-y += bar.o
> 
> and
> 
>   obj-y += bar.o
>   obj-y += foo.o
> 
> should be distinguished because the link order determines the probe
> order of drivers.  So, built-in.o should be rebuilt when the order
> of objects is changed.
> 
> This commit fixes arg-check to compare the old/current commands
> including the argument order.
> 
> Of course, this change has a side effect; Kbuild will react to the
> change of compile option order.  For example, "-DFOO -DBAR" and
> "-DBAR -DFOO" should give no difference to the build result, but
> false positive should be better than false negative.

Agreed. Applied to kbuild.git#kbuild now.

Michal
