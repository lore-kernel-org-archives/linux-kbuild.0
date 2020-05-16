Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f200.google.com ([209.85.166.200]:38552 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgEPV1F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 May 2020 17:27:05 -0400
Received: by mail-il1-f200.google.com with SMTP id u11so5863495ilg.5
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2020 14:27:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 16 May 2020 14:27:03 -0700
In-Reply-To: <0000000000003692760578e651dd@google.com>
Message-ID: <00000000000044329005a5ca97eb@google.com>
Subject: Re: KASAN: use-after-free Write in hci_sock_release
From: syzbot <syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: bigeasy@linutronix.de, davem@davemloft.net, dvyukov@google.com, jack@suse.cz, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, marcel@holtmann.org, mmarek@suse.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, torvalds@linux-foundation.org, xiyou.wangcong@gmail.com

syzbot suspects this bug was fixed by commit:

commit f1e67e355c2aafeddf1eac31335709236996d2fe
Author: Thomas Gleixner <tglx@linutronix.de>
Date:   Mon Nov 18 13:28:24 2019 +0000

    fs/buffer: Make BH_Uptodate_Lock bit_spin_lock a regular spinlock_t

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1761ce06100000
start commit:   645ff1e8 Merge branch 'for-linus' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7308e68273924137
dashboard link: https://syzkaller.appspot.com/bug?extid=b364ed862aa07c74bc62
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152532bb400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f73320c00000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: fs/buffer: Make BH_Uptodate_Lock bit_spin_lock a regular spinlock_t

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
