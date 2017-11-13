Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:17266 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754248AbdKMSw3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 13:52:29 -0500
Date: Mon, 13 Nov 2017 10:52:27 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: CONFIG_DEBUG_INFO_SPLIT impacts on faddr2line
Message-ID: <20171113185227.GM8522@tassilo.jf.intel.com>
References: <20171107102156.3fgxt6y6v5y2kqnf@wfg-t540p.sh.intel.com>
 <CA+55aFwqxZiN_XrZqvbtCsc8W=w895RaB1sjuVP1aTj8JStxzg@mail.gmail.com>
 <20171108094832.qxvkawpw2snpcbvh@wfg-t540p.sh.intel.com>
 <CA+55aFwK7935r325nmR-eQvanVCN3A+v3wEQHsW4NpSeBsybeA@mail.gmail.com>
 <20171108171230.ccf7lwutjysk26fc@wfg-t540p.sh.intel.com>
 <CA+55aFx0O+NTbBjavPm_jPucqHdXFYPmUya4kw=ps7LSqTFd5w@mail.gmail.com>
 <20171113011338.3qmnp64pttyscuus@wfg-t540p.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171113011338.3qmnp64pttyscuus@wfg-t540p.sh.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, linux-kbuild@vger.kernel.org, lkp@intel.com, "Zhang, Rui" <rui.zhang@intel.com>, "Lu, Aaron" <aaron.lu@intel.com>

> > It's the "CONFIG_DEBUG_INFO_SPLIT" thing that makes faddr2line unable
> > to see the inlining information,
> > 
> > Using OPTIMIZE_INLINING is fine.
> 
> Good to know that!

It works for me. Perhaps your binutils is too old? It was
added at some point. Can you try upgrading?

% ./linux/scripts/faddr2line obj/vmlinux schedule+10
schedule+10/0x80:
schedule at arch/x86/include/asm/current.h:15

% addr2line --version
GNU addr2line version 2.27-24.fc26

-Andi
