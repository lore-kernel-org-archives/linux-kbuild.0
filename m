Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33760 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbdHTTWs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 15:22:48 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNATndykM25k_-ra+R=GptoETMJYuYZs04+=Eb9GiYUVkjQ@mail.gmail.com>
References: <20170726133655.2137437-1-arnd@arndb.de> <CAK7LNATndykM25k_-ra+R=GptoETMJYuYZs04+=Eb9GiYUVkjQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Aug 2017 21:22:46 +0200
Message-ID: <CAK8P3a0WibLt9Bozj8F-jwkW+4-NvGb7dXJCcSZ5mr-ubt3s2Q@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: use -fshort-wchar globally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>

On Sun, Aug 20, 2017 at 2:31 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Arnd,
>
> This patch was picked up for linux-next
> (I assume it was queued up for 4.14-rc1)
> but I see this warning in Linus' tree.
>
> If we are not comfortable with this warning in the 4.13 release,
> shall I include this patch in the kbuild/fixes pull request?
> (planned this week)
>
> Please let me know your thought.

Yes, I think it would be good to have in 4.13, since it's a regression
against older kernels.

> 2017-07-26 22:36 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> A previous patch added the --no-wchar-size-warning to the Makefile to
>> avoid this harmless warning:
>
> "A previous patch" sounds ambiguous.
>
> The previous patch was applied one year ago.
>
>
> If it is OK, I can reword like
>
> Commit 971a69db7dc0 ("Xen: don't warn about 2-byte wchar_t in efi") added ...

Good idea, thanks!

       Arnd
