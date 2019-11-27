Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbfK0GTh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Nov 2019 01:19:37 -0500
Date: Tue, 26 Nov 2019 22:19:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: INFO: task hung in do_ip_vs_set_ctl (2)
Message-ID: <20191127061934.GC227319@sol.localdomain>
References: <94eb2c059ce0bca273056940d77d@google.com>
 <0000000000007a85c4059841ca66@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000007a85c4059841ca66@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: syzbot <syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com>
Cc: coreteam@netfilter.org, davem@davemloft.net, fw@strlen.de, horms@verge.net.au, ja@ssi.bg, kadlec@blackhole.kfki.hu, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lvs-devel@vger.kernel.org, mmarek@suse.com, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pablo@netfilter.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, wensong@linux-vs.org, yamada.masahiro@socionext.com

On Tue, Nov 26, 2019 at 07:47:00AM -0800, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit 6f7da290413ba713f0cdd9ff1a2a9bb129ef4f6c
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 2 23:07:02 2017 +0000
> 
>     Linux 4.12
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11a2b78ce00000
> start commit:   17dec0a9 Merge branch 'userns-linus' of git://git.kernel.o..
> git tree:       net-next
> kernel config:  https://syzkaller.appspot.com/x/.config?x=da08d02b86752ade
> dashboard link: https://syzkaller.appspot.com/bug?extid=7810ed2e0cb359580c17
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130abb47800000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150a15bb800000
> 
> Reported-by: syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com
> Fixes: 6f7da290413b ("Linux 4.12")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

This bisection is obviously bogus, though oddly enough the bisection log shows
that v4.12 crashed 10/10 times, while v4.12~1 crashed 0/10 times...

Anyway, this bug looks extremely stale, as it only occurred for a 2-week period
in 2018.  Commit 5c64576a77 ("ipvs: fix rtnl_lock lockups caused by
start_sync_thread") might have been the fix, but I'm just invalidating this:

#syz invalid

- Eric
