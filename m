Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f69.google.com ([209.85.166.69]:41325 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387750AbfGZP0B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 11:26:01 -0400
Received: by mail-io1-f69.google.com with SMTP id x17so58659658iog.8
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2019 08:26:01 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 26 Jul 2019 08:26:01 -0700
In-Reply-To: <000000000000b4358f058e924c6d@google.com>
Message-ID: <000000000000e87d14058e9728d7@google.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
From: syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: jasowang@redhat.com, kvm@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, michal.lkml@markovi.net, mst@redhat.com, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, virtualization@lists.linux-foundation.org, yamada.masahiro@socionext.com

syzbot has bisected this bug to:

commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Jul 7 22:41:56 2019 +0000

     Linux 5.2

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118810bfa00000
start commit:   13bf6d6a Add linux-next specific files for 20190725
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ae987d803395886
dashboard link: https://syzkaller.appspot.com/bug?extid=36e93b425cd6eb54fcc1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15112f3fa00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131ab578600000

Reported-by: syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com
Fixes: 0ecfebd2b524 ("Linux 5.2")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
