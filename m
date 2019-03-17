Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f46.google.com ([209.85.167.46]:45502 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfCQQfY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Mar 2019 12:35:24 -0400
Received: by mail-lf1-f46.google.com with SMTP id f16so9944711lfk.12
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Mar 2019 09:35:23 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id s14sm1732727ljh.0.2019.03.17.09.35.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Mar 2019 09:35:19 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id j89so448957ljb.1
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Mar 2019 09:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008a1bce057ede3d13@google.com> <0000000000009950e1058447ef43@google.com>
In-Reply-To: <0000000000009950e1058447ef43@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Mar 2019 09:35:02 -0700
Message-ID: <CAHk-=wjUrznUSUKN1AXQA9kCStQ3MHFY95ZmeTZ5zYDcvMhBiQ@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bacpy
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: syzbot <syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com>
Cc: David Miller <davem@davemloft.net>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, mmarek@suse.com, Netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com

On Sun, Mar 17, 2019 at 3:43 AM syzbot
<syzbot+660883c56e2fa65d4497@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit c470abd4fde40ea6a0846a2beab642a578c0b8cd
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Feb 19 22:34:00 2017 +0000

Heh. Yeah, I doubt it.

It would probably be good if syzbot did some confidence testing before
bisecting.

Don't get me wrong, "git bisect" is absolutely wonderful and has done
a ton to help us fix bugs, but bisection has one major downside: if
the bug you are bisecting isn't 100% repeatable, the bisection will go
off into the random weeds and give completely nonsensical results.
They won't even be *close*. What makes bisection so powerful is also
what makes it then completely random if there's even *one* mistaken
bisection point.

So it would probably be good to test each bisection point at least
twice, and if they don't agree, report it as being unbisectable rather
than give a random "this is what introduced the problem".

Hmm?

            Linus
