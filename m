Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43465 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbeKZVeu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 16:34:50 -0500
MIME-Version: 1.0
References: <1542860922-9730-1-git-send-email-yamada.masahiro@socionext.com> <1542860922-9730-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542860922-9730-2-git-send-email-yamada.masahiro@socionext.com>
From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 26 Nov 2018 11:40:55 +0100
Message-ID: <CA+7wUsz6amd-Kp3Gf4fK5VyuwAB8ZkJpgKkAy+DYJxvfaLEczQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] modpost: file2alias: check prototype of handler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>, rusty@rustcorp.com.au, miguel.ojeda.sandonis@gmail.com, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Thu, Nov 22, 2018 at 5:29 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Use specific prototype instead of an opaque pointer so that the
> compiler can catch incompatible pointer type.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/file2alias.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 7e4aede..a37af7d 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -47,7 +47,7 @@ typedef struct {
>  struct devtable {
>         const char *device_id; /* name of table, __mod_<name>__*_device_table. */
>         unsigned long id_size;
> -       void *function;
> +       int (*do_entry)(const char *filename, void *symval, char *alias);
>  };

It makes sense to do this cleanup.

Reviewed-by: Mathieu Malaterre <malat@debian.org>


>  /* Define a variable f that holds the value of field f of struct devid
> @@ -1299,12 +1299,11 @@ static bool sym_is(const char *name, unsigned namelen, const char *symbol)
>  static void do_table(void *symval, unsigned long size,
>                      unsigned long id_size,
>                      const char *device_id,
> -                    void *function,
> +                    int (*do_entry)(const char *filename, void *symval, char *alias),
>                      struct module *mod)
>  {
>         unsigned int i;
>         char alias[500];
> -       int (*do_entry)(const char *, void *entry, char *alias) = function;
>
>         device_id_check(mod->name, device_id, size, id_size, symval);
>         /* Leave last one: it's the terminator. */
> @@ -1420,7 +1419,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>
>                         if (sym_is(name, namelen, p->device_id)) {
>                                 do_table(symval, sym->st_size, p->id_size,
> -                                        p->device_id, p->function, mod);
> +                                        p->device_id, p->do_entry, mod);
>                                 break;
>                         }
>                 }
> --
> 2.7.4
>
