Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f177.google.com ([209.85.166.177]:32894 "EHLO
        mail-it1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfCRNAS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 09:00:18 -0400
Received: by mail-it1-f177.google.com with SMTP id f186so16630349ita.0
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 06:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008a1bce057ede3d13@google.com> <0000000000009950e1058447ef43@google.com>
 <CAHk-=wjUrznUSUKN1AXQA9kCStQ3MHFY95ZmeTZ5zYDcvMhBiQ@mail.gmail.com>
 <CACT4Y+YOWaU8s90joeGB4G1oc-GxrQSDnjpuFOuE4eJd5FHK3g@mail.gmail.com> <20190317202455.32a334d1@elisabeth>
In-Reply-To: <20190317202455.32a334d1@elisabeth>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 18 Mar 2019 14:00:05 +0100
Message-ID: <CACT4Y+bo1PC_fBHy1wtkfhtaY1Au9CwLtQphbsHDA24Xx7o+-g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bacpy
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, syzbot <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com>, David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Michal Marek <mmarek@suse.com>, Netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Sun, Mar 17, 2019 at 8:25 PM Stefano Brivio <sbrivio@redhat.com> wrote:
>
> On Sun, 17 Mar 2019 18:11:49 +0100
> Dmitry Vyukov <dvyukov@google.com> wrote:
>
> > And in this case it seems to be working as intended bisecting it to a
> > release tag.
>
> I guess what went wrong here is that it had to skip quite a few
> commits, and the result isn't relevant anymore. Maybe you could improve
> this by handling a:
>
>         all runs: boot failed: can't ssh into the instance
>
> case as bad revision? And, also, if scp times out (as it did on
> 912964eacb11), keep retrying instead of marking the revision as good?

Skipping revisions does not make the result wrong. In the worst case
git bisect will point to a range of commits.
But marking non-building/booting revisions as bad can actually diverge
bisection in the wrong direction and will result in pointing to
completely irrelevant commits. git skip is meant exactly for such
cases.
And in this case, skipping did not affect the process, it just needed
to do few more additional steps.
