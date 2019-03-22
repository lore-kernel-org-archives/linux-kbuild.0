Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f200.google.com ([209.85.166.200]:42670 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388595AbfCVMEB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Mar 2019 08:04:01 -0400
Received: by mail-it1-f200.google.com with SMTP id j127so1835315itj.7
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2019 05:04:01 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 22 Mar 2019 05:04:00 -0700
In-Reply-To: <0000000000003692760578e651dd@google.com>
Message-ID: <0000000000007917ff0584ada6e7@google.com>
Subject: Re: KASAN: use-after-free Write in hci_sock_release
From: syzbot <syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davem@davemloft.net, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, marcel@holtmann.org, mmarek@suse.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org

syzbot has bisected this bug to:

commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 19 22:34:00 2017 +0000

     Linux 4.10

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1664c6df200000
start commit:   c470abd4 Linux 4.10
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7308e68273924137
dashboard link: https://syzkaller.appspot.com/bug?extid=b364ed862aa07c74bc62
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152532bb400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f73320c00000

Reported-by: syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com
Fixes: c470abd4fde4 ("Linux 4.10")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
