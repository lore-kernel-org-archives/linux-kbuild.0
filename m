Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46964 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfC1RmM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Mar 2019 13:42:12 -0400
MIME-Version: 1.0
References: <20190315101013.GN8455@Legion-PC.fortress> <CAK7LNATsm23e_CuyfFw7_CR8xZQ3HnwNHCXhEm_zQZU2PUGK5A@mail.gmail.com>
 <20190326172411.GA15936@Legion-PC.fortress> <20190327154025.GB23293@linux-8ccs>
In-Reply-To: <20190327154025.GB23293@linux-8ccs>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Thu, 28 Mar 2019 10:41:59 -0700
Message-ID: <CAKi4VA+14kihzGFbMT623BwMbZEzgYU6+jz8MpR9jqoC059oog@mail.gmail.com>
Subject: Re: [RESEND PATCH v1] moduleparam: Save information about built-in
 modules in separate file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Alexey Gladkov <gladkov.alexey@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-api@vger.kernel.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-modules <linux-modules@vger.kernel.org>

On Wed, Mar 27, 2019 at 8:40 AM Jessica Yu <jeyu@kernel.org> wrote:
> >No. There are definitely not all modules. I have a builtin sha256_generic,
> >but I can't find him in the /sys/module.
>
> Yeah, you'll only find builtin modules under /sys/module/ if it has any module
> parameters, otherwise you won't find it there. As Masahiro already mentioned,
> if a builtin module has any parameters, they would be accessible under /sys/module/.

Could we please change that and add the sysfs entry regardless of
what's being discussed
here? Not having the entry there simply because we don't have
parameters for that module
always annoyed me.

Lucas De Marchi
