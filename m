Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56068 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751382AbdH1GxW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Aug 2017 02:53:22 -0400
Date: Mon, 28 Aug 2017 08:53:20 +0200
From: Johannes Thumshirn <jthumshirn@suse.de>
Subject: Re: [PATCH] Kbuild: enable -Wunused-macros warning for "make W=1"
Message-ID: <20170828065320.GA4038@linux-x5ow.site>
References: <20170803100924.8791-1-jthumshirn@suse.de>
 <CAK7LNATUHBZYMA7Bv4T4bM2ygzCZ5v2yLtyWYLATvR+hLCKAdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATUHBZYMA7Bv4T4bM2ygzCZ5v2yLtyWYLATvR+hLCKAdg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Aug 25, 2017 at 01:19:39AM +0900, Masahiro Yamada wrote:
> This makes W=1 too noisy.
> 
> For example, drivers often define unused register macros
> for completeness.  I do not think it is too bad in my opinion.
> 
> Perhaps, should it be moved to warning-2 ?
> 

Sure, I'll send a v2 in a few days.

Thanks,
	Johannes

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
