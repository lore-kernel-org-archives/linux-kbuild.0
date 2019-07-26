Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41121 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbfGZVfp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 17:35:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so33152983lfa.8
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2019 14:35:44 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id j7sm11551366lji.27.2019.07.26.14.35.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id r9so52802270ljg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jul 2019 14:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b4358f058e924c6d@google.com> <000000000000e87d14058e9728d7@google.com>
In-Reply-To: <000000000000e87d14058e9728d7@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 26 Jul 2019 14:35:25 -0700
Message-ID: <CAHk-=whnM5+FBJuVoxXELvFgecuc0+vW7ibWy4Gc5qJbW8HL2Q@mail.gmail.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>
Cc: Jason Wang <jasowang@redhat.com>, KVM list <kvm@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, michal.lkml@markovi.net, "Michael S. Tsirkin" <mst@redhat.com>, Netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, virtualization@lists.linux-foundation.org, Masahiro Yamada <yamada.masahiro@socionext.com>

On Fri, Jul 26, 2019 at 8:26 AM syzbot
<syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this bug to:
>
> commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sun Jul 7 22:41:56 2019 +0000
>
>      Linux 5.2

That seems very unlikely. That commit literally just changes the
EXTRAVERSION part of the version string.

So even if something actually depended on the version number, even
that wouldn't have triggered any semantic change.

              Linus
