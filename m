Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37235 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732392AbfAKRU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Jan 2019 12:20:26 -0500
Received: by mail-vs1-f68.google.com with SMTP id n13so9673153vsk.4
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jan 2019 09:20:25 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id p8sm39220340vke.27.2019.01.11.09.20.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 09:20:23 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id x64so9652957vsa.5
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jan 2019 09:20:22 -0800 (PST)
MIME-Version: 1.0
References: <1547198328-26359-1-git-send-email-yamada.masahiro@socionext.com> <1547198328-26359-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547198328-26359-2-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 11 Jan 2019 09:20:05 -0800
Message-ID: <CAGXu5jJCZ35qM6y8p+J=1Z58cGM-ZZTpbcke46uQmCNBpptRmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: simplify GCC plugin build rules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Jan 11, 2019 at 1:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> GCC-plugin is the only user of the shared library build rules in
> scripts/Makefile.host. Hence, those rules do not need to be treewide
> available.
>
> The build rules in scripts/Makefile.host are written in a too generic
> way. I guess the main reason is because commit 24403874316a ("Shared
> library support") revived the code ripped off by commit 62e2210798ed
> ("kbuild: drop shared library support from Makefile.host").
>
> Currently, every plugin is built from a single C file. So, all we need
> is a pattern rule to create %.so from %.c.

What'll it look like if we get a multi-file plugin in the future?
There are existing out-of-tree plugins that this change may make
porting more difficult...

-- 
Kees Cook
