Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f193.google.com ([209.85.166.193]:56073 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390294AbfCVMQ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Mar 2019 08:16:56 -0400
Received: by mail-it1-f193.google.com with SMTP id z126so3293518itd.5
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Mar 2019 05:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000003692760578e651dd@google.com> <0000000000007917ff0584ada6e7@google.com>
In-Reply-To: <0000000000007917ff0584ada6e7@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 22 Mar 2019 13:16:44 +0100
Message-ID: <CACT4Y+b0Onk4AB0hkvhXgZPdk+rERFsYAQra681o6QLDH_Ct-g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Write in hci_sock_release
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: syzbot <syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com>
Cc: David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Michal Marek <mmarek@suse.com>, netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Linus Torvalds <torvalds@linux-foundation.org>

On Fri, Mar 22, 2019 at 1:04 PM syzbot
<syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Feb 19 22:34:00 2017 +0000
>
>      Linux 4.10
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1664c6df200000
> start commit:   c470abd4 Linux 4.10
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7308e68273924137
> dashboard link: https://syzkaller.appspot.com/bug?extid=b364ed862aa07c74bc62
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152532bb400000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f73320c00000
>
> Reported-by: syzbot+b364ed862aa07c74bc62@syzkaller.appspotmail.com
> Fixes: c470abd4fde4 ("Linux 4.10")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

The same story of HCI being broken before v4.10, so this is bisected
to the release.
