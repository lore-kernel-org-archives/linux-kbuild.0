Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35206 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbeBFJNq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 04:13:46 -0500
Received: by mail-oi0-f67.google.com with SMTP id e15so827474oiy.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 01:13:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
 <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 6 Feb 2018 01:13:45 -0800
Message-ID: <CAGw6cBvju1xb5q9ax=GWKeda+CYjztK371gJYETN9YC_Vs+Pww@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2018-02-06, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> I sometimes see patches that address portability.
> But, the resulted code is generally ugly.
> (I would not say this is too ugly in this case.)
>
>
> Also, I see some more instances.
> If 'stat' is a problem,
> do you have an idea for alternative of "stat -c %Y"?

I'm not aware of a portable alternative for that. However, it is only
used in a single place for backing up uImage and System.map. If the
`stat -c %Y` command produces no stdout, it uses the .old extension
instead which seems like reasonable fallback behavior.

> $ git grep 'stat -c'
> Documentation/acpi/ssdt-overlays.txt:dd if=$tmp
> of="$EFIVARFS/$name-$guid" bs=$(stat -c %s $tmp)
> arch/arm/boot/deflate_xip_data.sh:file_end=$(stat -c "%s" "$XIPIMAGE")
> arch/blackfin/boot/install.sh:  local stamp=$(stat -c %Y ${file}
> 2>/dev/null)
> arch/powerpc/boot/wrapper:strip_size=$(stat -c %s $vmz.$$)
> tools/testing/selftests/efivarfs/efivarfs.sh:   if [ $(stat -c %s
> $file) -ne 5 ]; then

Would you like me to include those other instances of `stat -c %s` in
this patch? I left them out for now because I wasn't sure if they
needed to be sent to various other maintainers as separate patches.
