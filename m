Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f200.google.com ([209.85.166.200]:52827 "EHLO
        mail-it1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbfDKBBB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Apr 2019 21:01:01 -0400
Received: by mail-it1-f200.google.com with SMTP id 73so4217952itl.2
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Apr 2019 18:01:00 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 10 Apr 2019 18:01:00 -0700
In-Reply-To: <00000000000065a79f057a095de8@google.com>
Message-ID: <00000000000033a06b058636b877@google.com>
Subject: Re: WARNING in usb_submit_urb (4)
From: syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thinh.Nguyen@synopsys.com, andreyknvl@google.com, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, mmarek@suse.com, shuah@kernel.org, stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org

syzbot has bisected this bug to:

commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Feb 19 22:34:00 2017 +0000

     Linux 4.10

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11b415ed200000
start commit:   e12e00e3 Merge tag 'kbuild-fixes-v4.20' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8f215f21f041a0d7
dashboard link: https://syzkaller.appspot.com/bug?extid=7634edaea4d0b341c625
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ce6fbd400000

Reported-by: syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com
Fixes: c470abd4fde4 ("Linux 4.10")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
