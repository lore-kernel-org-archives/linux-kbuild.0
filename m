Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36180 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751382AbcKIAQy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Nov 2016 19:16:54 -0500
Received: by mail-wm0-f46.google.com with SMTP id p190so278077745wmp.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Nov 2016 16:16:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161102065241.985-1-andrew.donnellan@au1.ibm.com>
References: <20161102065241.985-1-andrew.donnellan@au1.ibm.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 8 Nov 2016 16:16:51 -0800
Message-ID: <CAGXu5jJK37NEW0nR_JTs77pXdUbszuKo+mG+DyTCKftiZEKBTA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add GCC plugins Makefile
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Nov 1, 2016 at 11:52 PM, Andrew Donnellan
<andrew.donnellan@au1.ibm.com> wrote:
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4012c2f..76049e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5202,6 +5202,7 @@ L:        kernel-hardening@lists.openwall.com
>  S:     Maintained
>  F:     scripts/gcc-plugins/
>  F:     scripts/gcc-plugin.sh
> +F:     scripts/Makefile.gcc-plugins
>  F:     Documentation/gcc-plugins.txt
>
>  GCOV BASED KERNEL PROFILING

Ah, good call. I've added this for -next now. Thanks!

-Kees

-- 
Kees Cook
Nexus Security
