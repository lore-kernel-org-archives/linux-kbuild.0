Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f69.google.com ([209.85.166.69]:47531 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfCQKnB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 06:43:01 -0400
Received: by mail-io1-f69.google.com with SMTP id b199so11106499iof.14
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Mar 2019 03:43:01 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 17 Mar 2019 03:43:00 -0700
In-Reply-To: <0000000000008a1bce057ede3d13@google.com>
Message-ID: <0000000000009950e1058447ef43@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bacpy
From: syzbot <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davem@davemloft.net, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, marcel@holtmann.org, mmarek@suse.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org

syzbot has bisected this bug to:

commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 19 22:34:00 2017 +0000

     Linux 4.10

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13dbe2cf200000
start commit:   c470abd4 Linux 4.10
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d55557b516c45456
dashboard link: https://syzkaller.appspot.com/bug?extid=660883c56e2fa65d4497
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1756666f400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1397354b400000

Reported-by: syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com
Fixes: c470abd4 ("Linux 4.10")
