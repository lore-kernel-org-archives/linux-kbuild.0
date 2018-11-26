Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35743 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeK0Bsf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 20:48:35 -0500
MIME-Version: 1.0
References: <1542860922-9730-1-git-send-email-yamada.masahiro@socionext.com> <1542860922-9730-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542860922-9730-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 26 Nov 2018 23:53:30 +0900
Message-ID: <CAK7LNAR7vGAjHbXSeE6yh4u8Dcr+ZZpADmxvBN9Co2=42=gXzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] modpost: file2alias: check prototype of handler
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jessica Yu <jeyu@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Mathieu Malaterre <malat@debian.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 23, 2018 at 1:51 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Use specific prototype instead of an opaque pointer so that the
> compiler can catch incompatible pointer type.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



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
>
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


-- 
Best Regards
Masahiro Yamada
