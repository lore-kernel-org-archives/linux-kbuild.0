Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:39520 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfCQRMB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 13:12:01 -0400
Received: by mail-io1-f68.google.com with SMTP id e13so2100902ioq.6
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Mar 2019 10:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008a1bce057ede3d13@google.com> <0000000000009950e1058447ef43@google.com>
 <CAHk-=wjUrznUSUKN1AXQA9kCStQ3MHFY95ZmeTZ5zYDcvMhBiQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjUrznUSUKN1AXQA9kCStQ3MHFY95ZmeTZ5zYDcvMhBiQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 17 Mar 2019 18:11:49 +0100
Message-ID: <CACT4Y+YOWaU8s90joeGB4G1oc-GxrQSDnjpuFOuE4eJd5FHK3g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bacpy
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: syzbot <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com>, David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Michal Marek <mmarek@suse.com>, Netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Sun, Mar 17, 2019 at 5:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, Mar 17, 2019 at 3:43 AM syzbot
> <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has bisected this bug to:
> >
> > commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Feb 19 22:34:00 2017 +0000
>
> Heh. Yeah, I doubt it.
>
> It would probably be good if syzbot did some confidence testing before
> bisecting.
>
> Don't get me wrong, "git bisect" is absolutely wonderful and has done
> a ton to help us fix bugs, but bisection has one major downside: if
> the bug you are bisecting isn't 100% repeatable, the bisection will go
> off into the random weeds and give completely nonsensical results.
> They won't even be *close*. What makes bisection so powerful is also
> what makes it then completely random if there's even *one* mistaken
> bisection point.
>
> So it would probably be good to test each bisection point at least
> twice, and if they don't agree, report it as being unbisectable rather
> than give a random "this is what introduced the problem".
>
> Hmm?


Hi Linus,

Please see https://github.com/google/syzkaller/blob/master/docs/syzbot.md#bisection
it should answer all of your questions. It does 2 and more.
And in this case it seems to be working as intended bisecting it to a
release tag.
