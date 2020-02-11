Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:32815 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbgBKCgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 21:36:55 -0500
MIME-Version: 1.0
References: <20200210161852.842-1-masahiroy@kernel.org>
In-Reply-To: <20200210161852.842-1-masahiroy@kernel.org>
From: Justin Capella <justincapella@gmail.com>
Date: Mon, 10 Feb 2020 18:36:42 -0800
Message-ID: <CAMrEMU86jmds8LMmbdVk=54h+ziY=6MHwyzHxVRXy5dLGFTmGA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>

Looks like len is already +1, maybe it shouldn't be?

>         len = strlen(name) + 1;
>
> -       sym = malloc(sizeof(*sym) + len);
> +       sym = malloc(sizeof(*sym) + len + 1);


Maybe strlcpy or if len wasn't incremented?

>
> -       memcpy(sym_name(sym), name, len);
> +       strcpy(sym_name(sym), name);
>
