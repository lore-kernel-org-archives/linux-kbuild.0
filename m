Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD9AC433F5
	for <linux-kbuild@archiver.kernel.org>; Tue,  3 May 2022 21:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243261AbiECV6k (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 3 May 2022 17:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbiECV6h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 May 2022 17:58:37 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362823A731
        for <linux-kbuild@vger.kernel.org>; Tue,  3 May 2022 14:55:04 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id m23so23724043ljc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 May 2022 14:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRqQ6md8oXZUAxpQNWuFfsuLgkVAHVB4ABTBtcxd60I=;
        b=KXwmzUG9fBG72FLoLS+CkAITuvrHFe1o4QZNhYyhhpbF3sZAczPRJyCiFaqmIsS2TO
         0n1ajjwyfuR9TDh4prbEzV/CMMuK2DAK0gG7DfyaUI6CL4XQOuI6tUyHH6MLeal3jVq2
         6omx5v/dEDq61WiyuOKe+tqsbEXQ0DZvpMctxmsgmXuc6BgCDGMhd5seZn6JAd3cGAoj
         PR12btlln8MIyvOYGGX5TZRg1Gx00znlGnbGc2R8B2TCD9C7DW5dAxqk2kHcpAj62SMT
         9EY7nj2Y6XF6hVkxfN/2lMI/h160zU2UxyBtH4XSaT9slrFLj6qvXBbixxe0SxvM7SgB
         G7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRqQ6md8oXZUAxpQNWuFfsuLgkVAHVB4ABTBtcxd60I=;
        b=K4pE4zZmPyrz4SQKQTUNCkjfRHnsIpn0JsDART8RTxsDbxU7+GFu7FttqxCV2rGrch
         a6doqhzt5r4FJjLHjvu8wydS1zeuAd44af2NDeLObqZPUEE/PRd40V79ULwV6F0JzwzR
         YsigvH0BQU3Sz9VW3/yzeXlKZOHHbXKzW0R4TyHkvkCOjuaMcoxDZHM954Mo+EqlNwVE
         /chE/+hy2mL2VBnqVZyouV/wQ+Zxua+OPMqdnRm2UEWYdaWZq6ss5tqV2dIPYYdhVQtQ
         neLTRoYrKur18evb0VgDMfdRQMLzaiN/bWpLM2V50Rx2CKHmmfxMjzqcZNXwAewVQzw/
         hIlA==
X-Gm-Message-State: AOAM532oyNDc6BcrbybGCdJM+bBVvS5D2tWHjidJobMs8UhhAhoExMsX
        9gcncXtKdb3k9XicpuxieSPDBtVSeRNsca4OZNnwZD44DcA=
X-Google-Smtp-Source: ABdhPJy5wScXsBi82dv7rf9MooYymn4WbuH+TxtXSWPOk1ytvgPuoiZV2R2QHScqc4sUrC0LipOvPjx7Pddq/s59yQw=
X-Received: by 2002:a05:651c:1a09:b0:250:5bd1:6daf with SMTP id
 by9-20020a05651c1a0900b002505bd16dafmr5533750ljb.468.1651614902306; Tue, 03
 May 2022 14:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220501084032.1025918-1-masahiroy@kernel.org> <20220501084032.1025918-11-masahiroy@kernel.org>
In-Reply-To: <20220501084032.1025918-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 May 2022 14:54:51 -0700
Message-ID: <CAKwvOd=JAhex+9fM7jrMJwrBkvwewnUrh_sUZk6Re=VY+P+Bow@mail.gmail.com>
Subject: Re: [PATCH v2 10/26] modpost: move static EXPORT_SYMBOL check to check_exports()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 1, 2022 at 1:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Now that struct module has a list of symbols it exports, this check
> can go into check_exports(). The code becomes shorter.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> (no changes since v1)
>
>  scripts/mod/modpost.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index cd49ef7b5953..4ce8d164b8e0 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2199,6 +2199,12 @@ static void check_exports(struct module *mod)
>                 if (!mod->is_gpl_compatible)
>                         check_for_gpl_usage(exp->export, basename, exp->name);
>         }
> +
> +       list_for_each_entry(s, &mod->exported_symbols, list) {
> +               if (s->is_static)
> +                       error("\"%s\" [%s] is a static %s\n",
> +                             s->name, mod->name, export_str(s->export));
> +       }
>  }
>
>  static void check_modname_len(struct module *mod)
> @@ -2510,7 +2516,6 @@ int main(int argc, char **argv)
>         char *missing_namespace_deps = NULL;
>         char *dump_write = NULL, *files_source = NULL;
>         int opt;
> -       int n;
>         LIST_HEAD(dump_lists);
>         struct dump_list *dl, *dl2;
>
> @@ -2606,16 +2611,6 @@ int main(int argc, char **argv)
>         if (sec_mismatch_count && !sec_mismatch_warn_only)
>                 error("Section mismatches detected.\n"
>                       "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
> -       for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
> -               struct symbol *s;
> -
> -               for (s = symbolhash[n]; s; s = s->next) {
> -                       if (s->is_static)
> -                               error("\"%s\" [%s] is a static %s\n",
> -                                     s->name, s->module->name,
> -                                     export_str(s->export));
> -               }
> -       }
>
>         if (nr_unresolved > MAX_UNRESOLVED_REPORTS)
>                 warn("suppressed %u unresolved symbol warnings because there were too many)\n",
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
