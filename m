Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60138 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbfCQTZK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 15:25:10 -0400
Date: Sun, 17 Mar 2019 20:24:55 +0100
From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bacpy
Message-ID: <20190317202455.32a334d1@elisabeth>
In-Reply-To: <CACT4Y+YOWaU8s90joeGB4G1oc-GxrQSDnjpuFOuE4eJd5FHK3g@mail.gmail.com>
References: <0000000000008a1bce057ede3d13@google.com>
        <0000000000009950e1058447ef43@google.com>
        <CAHk-=wjUrznUSUKN1AXQA9kCStQ3MHFY95ZmeTZ5zYDcvMhBiQ@mail.gmail.com>
        <CACT4Y+YOWaU8s90joeGB4G1oc-GxrQSDnjpuFOuE4eJd5FHK3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, syzbot <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com>, David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Michal Marek <mmarek@suse.com>, Netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Sun, 17 Mar 2019 18:11:49 +0100
Dmitry Vyukov <dvyukov@google.com> wrote:

> And in this case it seems to be working as intended bisecting it to a
> release tag.

I guess what went wrong here is that it had to skip quite a few
commits, and the result isn't relevant anymore. Maybe you could improve
this by handling a:

	all runs: boot failed: can't ssh into the instance

case as bad revision? And, also, if scp times out (as it did on
912964eacb11), keep retrying instead of marking the revision as good?

-- 
Stefano
