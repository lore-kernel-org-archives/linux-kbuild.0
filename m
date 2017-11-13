Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:2472 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751736AbdKMVlu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 16:41:50 -0500
Date: Mon, 13 Nov 2017 13:41:48 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: CONFIG_DEBUG_INFO_SPLIT impacts on faddr2line
Message-ID: <20171113214148.GP8522@tassilo.jf.intel.com>
References: <CA+55aFwqxZiN_XrZqvbtCsc8W=w895RaB1sjuVP1aTj8JStxzg@mail.gmail.com>
 <20171108094832.qxvkawpw2snpcbvh@wfg-t540p.sh.intel.com>
 <CA+55aFwK7935r325nmR-eQvanVCN3A+v3wEQHsW4NpSeBsybeA@mail.gmail.com>
 <20171108171230.ccf7lwutjysk26fc@wfg-t540p.sh.intel.com>
 <CA+55aFx0O+NTbBjavPm_jPucqHdXFYPmUya4kw=ps7LSqTFd5w@mail.gmail.com>
 <20171113011338.3qmnp64pttyscuus@wfg-t540p.sh.intel.com>
 <20171113185227.GM8522@tassilo.jf.intel.com>
 <CA+55aFzbQBPOwah9gQPHR9WL+zZBOXnHsP6GKmC=QE7qOn+psw@mail.gmail.com>
 <20171113201013.GO8522@tassilo.jf.intel.com>
 <CA+55aFzFUuCniKCutTVNchuhY-bkB=3JkPv46rYwpx1Q0_5n0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+55aFzFUuCniKCutTVNchuhY-bkB=3JkPv46rYwpx1Q0_5n0w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-wired-lan@lists.osuosl.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kbuild test robot <lkp@intel.com>, "Zhang, Rui" <rui.zhang@intel.com>, "Lu, Aaron" <aaron.lu@intel.com>, "H.J. Lu" <hjl.tools@gmail.com>

On Mon, Nov 13, 2017 at 12:56:31PM -0800, Linus Torvalds wrote:
> On Mon, Nov 13, 2017 at 12:10 PM, Andi Kleen <ak@linux.intel.com> wrote:
> >
> > You're right. It works for line information, but strangely not for
> > inlines. I assume it can be fixed.
> 
> So I'm not 100% sure it's strictly a addr2line bug.

It seems to be broken for normal programs too

$ cat tinline.c

int i;

static inline int finline(void)
{
	i++;
}

main()
{
	finline();
}

$ gcc -O2 -gsplit-dwarf tinline.c
$ addr2line -i -e a.out 0x4003b0
/home/ak/tsrc/tinline.c:6
$ gcc -O2  -g tinline.c
$ addr2line -i -e a.out 0x4003b0
/home/ak/tsrc/tinline.c:6
/home/ak/tsrc/tinline.c:12
$

I filed https://sourceware.org/bugzilla/show_bug.cgi?id=22434


-Andi

