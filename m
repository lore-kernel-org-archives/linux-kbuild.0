Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:33392 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfG1Igs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 04:36:48 -0400
Received: by mail-io1-f68.google.com with SMTP id z3so3887620iog.0
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Jul 2019 01:36:47 -0700 (PDT)
Date: Sun, 28 Jul 2019 04:36:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: INFO: rcu detected stall in vhost_worker
Message-ID: <20190728043619-mutt-send-email-mst@kernel.org>
References: <000000000000b4358f058e924c6d@google.com>
 <000000000000e87d14058e9728d7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e87d14058e9728d7@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com>, jasowang@redhat.com, kvm@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, michal.lkml@markovi.net, netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, virtualization@lists.linux-foundation.org, yamada.masahiro@socionext.com

On Sat, Jul 27, 2019 at 04:23:23PM +0800, Hillf Danton wrote:
> 
> Fri, 26 Jul 2019 08:26:01 -0700 (PDT)
> > syzbot has bisected this bug to:
> > 
> > commit 0ecfebd2b52404ae0c54a878c872bb93363ada36
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Sun Jul 7 22:41:56 2019 +0000
> > 
> >      Linux 5.2
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=118810bfa00000
> > start commit:   13bf6d6a Add linux-next specific files for 20190725
> > git tree:       linux-next
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=8ae987d803395886
> > dashboard link: https://syzkaller.appspot.com/bug?extid=36e93b425cd6eb54fcc1
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15112f3fa00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131ab578600000
> > 
> > Reported-by: syzbot+36e93b425cd6eb54fcc1@syzkaller.appspotmail.com
> > Fixes: 0ecfebd2b524 ("Linux 5.2")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -787,7 +787,6 @@ static void vhost_setup_uaddr(struct vho
> 			      size_t size, bool write)
> {
> 	struct vhost_uaddr *addr = &vq->uaddrs[index];
> -	spin_lock(&vq->mmu_lock);
> 
> 	addr->uaddr = uaddr;
> 	addr->size = size;
> @@ -797,7 +796,10 @@ static void vhost_setup_uaddr(struct vho
> static void vhost_setup_vq_uaddr(struct vhost_virtqueue *vq)
> {
> 	spin_lock(&vq->mmu_lock);
> -
> +	/*
> +	 * deadlock if managing to take mmu_lock again while
> +	 * setting up uaddr
> +	 */
> 	vhost_setup_uaddr(vq, VHOST_ADDR_DESC,
> 			  (unsigned long)vq->desc,
> 			  vhost_get_desc_size(vq, vq->num),
> --

Thanks!
I reverted this whole commit.

-- 
MST
