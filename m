Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44000 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfCWUZV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Mar 2019 16:25:21 -0400
MIME-Version: 1.0
References: <0000000000003692760578e651dd@google.com> <0000000000007917ff0584ada6e7@google.com>
 <CACT4Y+b0Onk4AB0hkvhXgZPdk+rERFsYAQra681o6QLDH_Ct-g@mail.gmail.com>
In-Reply-To: <CACT4Y+b0Onk4AB0hkvhXgZPdk+rERFsYAQra681o6QLDH_Ct-g@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 23 Mar 2019 13:25:08 -0700
Message-ID: <CAM_iQpVHgHM-5NCE+FNZfpH6CWtYdt8BSmHJj_oa7CLKxYKLQw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Write in hci_sock_release
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot <syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com>, David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Michal Marek <mmarek@suse.com>, netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Mar 22, 2019 at 5:19 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Mar 22, 2019 at 1:04 PM syzbot
> <syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has bisected this bug to:
> >
> > commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Feb 19 22:34:00 2017 +0000
> >
> >      Linux 4.10
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1664c6df200000
> > start commit:   c470abd4 Linux 4.10
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=7308e68273924137
> > dashboard link: https://syzkaller.appspot.com/bug?extid=b364ed862aa07c74bc62
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152532bb400000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f73320c00000
> >
> > Reported-by: syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com
> > Fixes: c470abd4fde4 ("Linux 4.10")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> The same story of HCI being broken before v4.10, so this is bisected
> to the release.

Does syzbot test the latest upstream? Isn't this supposed to be fixed by

commit e20a2e9c42c9e4002d9e338d74e7819e88d77162
Author: Myungho Jung <mhjungk@gmail.com>
Date:   Sat Feb 2 16:56:36 2019 -0800

    Bluetooth: Fix decrementing reference count twice in releasing socket

?
