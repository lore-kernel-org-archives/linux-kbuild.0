Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43937 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfDPN5L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Apr 2019 09:57:11 -0400
Received: by mail-ua1-f65.google.com with SMTP id n16so6736988uae.10
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2019 06:57:10 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id m23sm88879865vsl.24.2019.04.16.06.57.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 06:57:08 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id h4so6742809uaj.9
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2019 06:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190411180117.27704-1-keescook@chromium.org> <20190411180117.27704-2-keescook@chromium.org>
 <947dbe9a-3444-6fe4-9f79-f8f210da8960@linux.com> <CAGXu5jJTM=pdAjsC63Z6T=HaztTqSqUQQ8=GN=tqv2n6CKc3nw@mail.gmail.com>
 <450e21b0-606a-f19a-a4fe-f7508d6a215c@linux.com>
In-Reply-To: <450e21b0-606a-f19a-a4fe-f7508d6a215c@linux.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 16 Apr 2019 08:56:55 -0500
Message-ID: <CAGXu5j+bVtkXHhs03t_yb1gp51WRhzZGqNpzV5VPb6dfnptw5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] security: Create "kernel hardening" config area
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Popov <alex.popov@linux.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Alexander Potapenko <glider@google.com>, James Morris <jmorris@namei.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Emese Revfy <re.emese@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Apr 16, 2019 at 8:55 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> On 16.04.2019 7:02, Kees Cook wrote:
> > On Mon, Apr 15, 2019 at 11:44 AM Alexander Popov <alex.popov@linux.com> wrote:
> >>
> >> What do you think about some separator between memory initialization options and
> >> CONFIG_CRYPTO?
> >
> > This was true before too
>
> Hm, yes, it's a generic behavior - there is no any separator at 'endmenu' and
> config options stick together.
>
> I've created a patch to fix that. What do you think about it?
> I can send it to LKML separately.
>
>
> From 50bf59d30fafcdebb3393fb742e1bd51e7d2f2da Mon Sep 17 00:00:00 2001
> From: Alexander Popov <alex.popov@linux.com>
> Date: Tue, 16 Apr 2019 16:09:40 +0300
> Subject: [PATCH 1/1] kconfig: Terminate menu blocks with a newline in the
>  generated config
>
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
>
> Let's terminate menu blocks with a newline in the generated config.
>
> Signed-off-by: Alexander Popov <alex.popov@linux.com>
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

Seems fine to me. I defer to Masahiro, though. :)

-- 
Kees Cook
