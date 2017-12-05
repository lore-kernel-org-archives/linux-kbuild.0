Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:40992 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751847AbdLEUaK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Dec 2017 15:30:10 -0500
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+fG=A5KRDEH3aawbcEyf+fYNwOKS6x08SHDhEhfMP9RA@mail.gmail.com>
References: <20171205153259.2522368-1-arnd@arndb.de> <CAGXu5j+fG=A5KRDEH3aawbcEyf+fYNwOKS6x08SHDhEhfMP9RA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Dec 2017 21:30:08 +0100
Message-ID: <CAK8P3a30r8ZCQY1ZqisXfnbbN7W-NiizExD857UsqMZpZfdt4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] kbuild: add macro for controlling warnings to linux/compiler.h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Douglas Anderson <dianders@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Matthias Kaehlcke <mka@chromium.org>, Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Gideon Israel Dsouza <gidisrael@gmail.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Dec 5, 2017 at 8:25 PM, Kees Cook <keescook@chromium.org> wrote:

> I like this. I wonder if it would be a good idea to add an additional
> argument that forces documentation of the reason for adding a diag
> marking? Something like:
>
> __diag_warn(GCC_7, vla, "No VLAs should be used in this code");

This would be similar to what glibc does, it names the (ignore) macro
DIAG_IGNORE_NEEDS_COMMENT(), and by convention requires
a comment block in front of it. Not sure if it will actually work in the kernel
where the reviews are much more scattered across subsystem maintainers,
but we could try it.

       Arnd
