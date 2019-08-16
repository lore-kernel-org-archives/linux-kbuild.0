Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40836 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726575AbfHPITy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Aug 2019 04:19:54 -0400
Date: Fri, 16 Aug 2019 10:19:46 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch
 modules
In-Reply-To: <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
Message-ID: <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz>
References: <20190509143859.9050-1-joe.lawrence@redhat.com> <20190509143859.9050-7-joe.lawrence@redhat.com> <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com> <20190812155626.GA19845@redhat.com>
 <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

> I cleaned up the build system, and pushed it based on my
> kbuild tree.
> 
> Please see:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> klp-cleanup

This indeed looks much simpler and cleaner (as far as I can judge with my 
limited kbuild knowledge). We just need to remove MODULE_INFO(livepatch, 
"Y") from lib/livepatch/test_klp_convert_mod_a.c to make it compile and 
work (test_klp_convert_mod_a is not a livepatch module, it is just a dummy 
module which is then livepatched by lib/livepatch/test_klp_convert1.c).

Thanks a lot!

Miroslav
