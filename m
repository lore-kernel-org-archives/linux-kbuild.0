Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f199.google.com ([209.85.166.199]:41570 "EHLO
        mail-it1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfCQKnB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 06:43:01 -0400
Received: by mail-it1-f199.google.com with SMTP id q184so12180328itd.6
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Mar 2019 03:43:01 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 17 Mar 2019 03:43:00 -0700
In-Reply-To: <000000000000696949057ee26e44@google.com>
Message-ID: <000000000000974cbc058447ef88@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hci_event_packet
From: syzbot <syzbot+cec7a50c412a2c03f8f5@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davem@davemloft.net, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, marcel@holtmann.org, mmarek@suse.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org

syzbot has bisected this bug to:

commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 19 22:34:00 2017 +0000

     Linux 4.10

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=127bd0f7200000
start commit:   c470abd4 Linux 4.10
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d55557b516c45456
dashboard link: https://syzkaller.appspot.com/bug?extid=cec7a50c412a2c03f8f5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1643bfbf400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12d6c8f7400000

Reported-by: syzbot+cec7a50c412a2c03f8f5@syzkaller.appspotmail.com
Fixes: c470abd4 ("Linux 4.10")
