Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2485C433EF
	for <linux-kbuild@archiver.kernel.org>; Fri, 10 Jun 2022 22:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344416AbiFJW1D (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 10 Jun 2022 18:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343526AbiFJW1B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jun 2022 18:27:01 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F1845AE6
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jun 2022 15:26:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s6so525417lfo.13
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Jun 2022 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tfd/TAR0ufan394wnNBz+IKQVbIk+aytMj5qI0Sj/hk=;
        b=THD3zqVbgeWQWfIvdLAsxo39zXC/mI7Xdkz4psppRHS0LXhBGK2htigBMZ5+eAWN/G
         H/2hftNy1wYLZX7FFcmZeXIRfhkOIvuBL33ITi8ncT0RIWDW7EwBhIQ3zL1kH+Pam1kr
         ClfM8PSldRRLXwp0urc4FcTyMvlIx1QCXsbPaINSPypVfTyB2WIOKopzVSGuc2m8+KNA
         qj4E2aeNXAWs+Qb4WMHF6mimnXzCagjk9GChVXAnFimUQ7nJpY4eH95bvhidpvjATTe8
         vKS8t3BIGDEkrU5cE3qG/E5vCkbLYBXN/QWkHPys9HXIHzBRxU/X9Wbpi8gBb4fUEDKc
         UDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tfd/TAR0ufan394wnNBz+IKQVbIk+aytMj5qI0Sj/hk=;
        b=sXqHEZz4BhLLpxKFHRMoXJn+mLDEkHV7kb/UohUI4OeEk5mIZwQN5eE8IaalZa4baf
         ozdWC/Q5Vd22CWc6KiuhFHf7tqLayzNgq3P89HXTMh5FQTIAGQyL/jCXElF72X4HuM6P
         N59gQvZ18DQwjRJsLAKosOFUJEkA4Jhwj4fnPJgjJBTqy3ONa2wlYp9zEdeUgtCDRDht
         WSoutD67tS3aiCMcZaSoUvsQNimJQGP+fJFOksKoFZ1+srtVnfL4QfLBmzJuZ2ltNaQG
         0zDmvQN1bFVV+z8o2/8E19aZvUGKHh+4D10SEmMCeNpbeFBj8FZ36v+lB1AKRFTjikJ1
         2G/g==
X-Gm-Message-State: AOAM533XD1+k+RuNoWqgKoJf6vP695BVSAXuYSkGj+J/wLWWMMEiMPUR
        68xG1Y/p0sxT01W1g6//WXSiVDXoQpFwgZnPocuyTA==
X-Google-Smtp-Source: ABdhPJxb5CTKop1RwIBIe8ZOCCTPU8a0rjXQU054V+HvLqSQh5V//sbYOcEKwkYosQQa63ufD4Uiy/BTeHtP948qXgg=
X-Received: by 2002:a05:6512:ad6:b0:479:5599:d834 with SMTP id
 n22-20020a0565120ad600b004795599d834mr14594725lfu.103.1654900017856; Fri, 10
 Jun 2022 15:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220610183236.1272216-1-masahiroy@kernel.org> <20220610183236.1272216-7-masahiroy@kernel.org>
In-Reply-To: <20220610183236.1272216-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Jun 2022 15:26:46 -0700
Message-ID: <CAKwvOdk++w0K+y-spCn1fHbhO+G3oJ8LF9LDFJKWg-acW04XBQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] modpost: merge sym_update_namespace() into sym_add_exported()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nicolas Pitre <npitre@baylibre.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 10, 2022 at 11:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Pass a set of the name, license, and namespace to sym_add_exported().
>
> sym_update_namespace() is unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 41 +++++++++--------------------------------
>  1 file changed, 9 insertions(+), 32 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f738dddde7b8..0db2cbb74a2a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -357,26 +357,8 @@ static const char *sec_name_of_symbol(const struct elf_info *info,
>
>  #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
>
> -static void sym_update_namespace(const char *symname, const char *namespace)
> -{
> -       struct symbol *s = find_symbol(symname);
> -
> -       /*
> -        * That symbol should have been created earlier and thus this is
> -        * actually an assertion.
> -        */
> -       if (!s) {
> -               error("Could not update namespace(%s) for symbol %s\n",
> -                     namespace, symname);
> -               return;
> -       }
> -
> -       free(s->namespace);
> -       s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
> -}
> -
>  static struct symbol *sym_add_exported(const char *name, struct module *mod,
> -                                      bool gpl_only)
> +                                      bool gpl_only, const char *namespace)
>  {
>         struct symbol *s = find_symbol(name);
>
> @@ -389,6 +371,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
>         s = alloc_symbol(name);
>         s->module = mod;
>         s->is_gpl_only = gpl_only;
> +       s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
>         list_add_tail(&s->list, &mod->exported_symbols);
>         hash_add_symbol(s);
>
> @@ -658,17 +641,12 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
>                 break;
>         default:
>                 if (sym->st_shndx == info->export_symbol_sec) {
> -                       const char *name;
> -
> -                       if (strstarts(symname, "__export_symbol_gpl.")) {
> -                               name = symname + strlen("__export_symbol_gpl.");
> -                               sym_add_exported(name, mod, true);
> -                               sym_update_namespace(name, sym_get_data(info, sym));
> -                       } else if (strstarts(symname, "__export_symbol.")) {
> -                               name = symname + strlen("__export_symbol.");
> -                               sym_add_exported(name, mod, false);
> -                               sym_update_namespace(name, sym_get_data(info, sym));
> -                       }
> +                       if (strstarts(symname, "__export_symbol_gpl."))
> +                               sym_add_exported(symname + strlen("__export_symbol_gpl."),
> +                                                mod, true, sym_get_data(info, sym));
> +                       else if (strstarts(symname, "__export_symbol."))
> +                               sym_add_exported(symname + strlen("__export_symbol."),
> +                                                mod, false, sym_get_data(info, sym));
>
>                         break;
>                 }
> @@ -2470,9 +2448,8 @@ static void read_dump(const char *fname)
>                         mod = new_module(modname, strlen(modname));
>                         mod->from_dump = true;
>                 }
> -               s = sym_add_exported(symname, mod, gpl_only);
> +               s = sym_add_exported(symname, mod, gpl_only, namespace);
>                 sym_set_crc(s, crc);
> -               sym_update_namespace(symname, namespace);
>         }
>         free(buf);
>         return;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
