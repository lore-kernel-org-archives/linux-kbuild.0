Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:43763 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbfDSS5h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Apr 2019 14:57:37 -0400
Received: by mail-vs1-f67.google.com with SMTP id t23so3274063vso.10
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2019 11:57:37 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 110sm4059149uaq.7.2019.04.19.08.02.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 08:02:42 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id n16so1821576uae.10
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2019 08:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
In-Reply-To: <1555669773-9766-1-git-send-email-alex.popov@linux.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 19 Apr 2019 10:02:29 -0500
Message-ID: <CAGXu5j+qUm_ad6XOU7eLbCEdV3bUjJeYoseZrWdpzXqe84-5Bw@mail.gmail.com>
Subject: Re: [PATCH 1/1] kconfig: Terminate menu blocks with a newline in the
 generated config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 19, 2019 at 5:29 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
>
> Let's terminate menu blocks with a newline in the generated config.
>
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Seems fine to improve readability at a few bytes size increase.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  scripts/kconfig/confdata.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 08ba146..1459153 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -888,6 +888,8 @@ int conf_write(const char *name)
>                 if (menu->next)
>                         menu = menu->next;
>                 else while ((menu = menu->parent)) {
> +                       if (!menu->sym && menu_is_visible(menu))
> +                               fprintf(out, "\n");
>                         if (menu->next) {
>                                 menu = menu->next;
>                                 break;
> --
> 2.7.4
>


-- 
Kees Cook
