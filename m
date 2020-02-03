Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39419 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbgBCRfa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 12:35:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id o15so9996833ljg.6
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:35:28 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 11sm10264042lju.103.2020.02.03.09.35.26
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 09:35:26 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id v201so10268255lfa.11
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20200203164708.17478-1-masahiroy@kernel.org>
In-Reply-To: <20200203164708.17478-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 3 Feb 2020 17:35:09 +0000
Message-ID: <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Mon, Feb 3, 2020 at 4:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This commit hides the Kconfig choice in that case. The default cpio
> is embedded without compression, which was the original behavior.

Btw, is there any way to figure out automatically what the initrd
compression is (for the external case)?

Because I think it would be lovely to be able to have sane defaults
for the CONFIG_RD_xyz things.

I'm assuming the answer is "no", simply because it comes from distro
installs, but I thought I'd check.

                 Linus
