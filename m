Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:2528 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbdKMXvm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 18:51:42 -0500
Date: Mon, 13 Nov 2017 15:51:40 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: CONFIG_DEBUG_INFO_SPLIT impacts on faddr2line
Message-ID: <20171113235140.GR8522@tassilo.jf.intel.com>
References: <CA+55aFwK7935r325nmR-eQvanVCN3A+v3wEQHsW4NpSeBsybeA@mail.gmail.com>
 <20171108171230.ccf7lwutjysk26fc@wfg-t540p.sh.intel.com>
 <CA+55aFx0O+NTbBjavPm_jPucqHdXFYPmUya4kw=ps7LSqTFd5w@mail.gmail.com>
 <20171113011338.3qmnp64pttyscuus@wfg-t540p.sh.intel.com>
 <20171113185227.GM8522@tassilo.jf.intel.com>
 <CA+55aFzbQBPOwah9gQPHR9WL+zZBOXnHsP6GKmC=QE7qOn+psw@mail.gmail.com>
 <20171113201013.GO8522@tassilo.jf.intel.com>
 <CA+55aFzFUuCniKCutTVNchuhY-bkB=3JkPv46rYwpx1Q0_5n0w@mail.gmail.com>
 <20171113214148.GP8522@tassilo.jf.intel.com>
 <CA+55aFzEb1qp872nO4Y20cY9WHdek2MC=7XX1xNcN8q1WvTOaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFzEb1qp872nO4Y20cY9WHdek2MC=7XX1xNcN8q1WvTOaw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kbuild test robot <lkp@intel.com>, "Zhang, Rui" <rui.zhang@intel.com>, "Lu, Aaron" <aaron.lu@intel.com>, "H.J. Lu" <hjl.tools@gmail.com>

> I wonder if there is some way to use the split format for the
> intermediate files, but then for the very final link bring them all in
> and make the end result be a traditional single binary. I'm not
> talking the separate "dwp" package that packs multiple dwo files into
> one, but to actually link them all in at the one.
> 
> Sure, it would lose some of the advantage, but I think a large portion
> of the -gsplit-dwarf advantage is about the intermediate state. No?

Not sure it's worth to do complicated workarounds. I assume
it will be not that difficult to fix binutils (after all
gdb works), and disabling the option is a reasonable workaround.

> 
> I tried to google for it, but couldn't find anything. But apparently
> elfutils doesn't support dwo files either. It seems mainly the linker
> and gdb itself that supports it.

The original design document is

https://gcc.gnu.org/wiki/DebugFission

-Andi
