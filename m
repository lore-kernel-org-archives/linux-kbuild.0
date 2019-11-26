Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f70.google.com ([209.85.166.70]:50845 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbfKZPrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Nov 2019 10:47:02 -0500
Received: by mail-io1-f70.google.com with SMTP id t193so13578339iof.17
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Nov 2019 07:47:01 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 26 Nov 2019 07:47:00 -0800
In-Reply-To: <94eb2c059ce0bca273056940d77d@google.com>
Message-ID: <0000000000007a85c4059841ca66@google.com>
Subject: Re: INFO: task hung in do_ip_vs_set_ctl (2)
From: syzbot <syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: coreteam@netfilter.org, davem@davemloft.net, fw@strlen.de, horms@verge.net.au, ja@ssi.bg, kadlec@blackhole.kfki.hu, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lvs-devel@vger.kernel.org, mmarek@suse.com, netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pablo@netfilter.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, wensong@linux-vs.org, yamada.masahiro@socionext.com

syzbot has bisected this bug to:

commit 6f7da290413ba713f0cdd9ff1a2a9bb129ef4f6c
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 2 23:07:02 2017 +0000

     Linux 4.12

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11a2b78ce00000
start commit:   17dec0a9 Merge branch 'userns-linus' of git://git.kernel.o..
git tree:       net-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=da08d02b86752ade
dashboard link: https://syzkaller.appspot.com/bug?extid=7810ed2e0cb359580c17
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130abb47800000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150a15bb800000

Reported-by: syzbot+7810ed2e0cb359580c17@syzkaller.appspotmail.com
Fixes: 6f7da290413b ("Linux 4.12")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
