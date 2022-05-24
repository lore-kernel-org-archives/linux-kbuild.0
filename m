Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B392BC433EF
	for <linux-kbuild@archiver.kernel.org>; Tue, 24 May 2022 20:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241715AbiEXUuI (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 24 May 2022 16:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241696AbiEXUuH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 May 2022 16:50:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C78074DC2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:50:06 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id l13so26156485lfp.11
        for <linux-kbuild@vger.kernel.org>; Tue, 24 May 2022 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xu6EHDS01LsOIawXUSDVH/r2oXuTsWqPdMuqTq7O8gE=;
        b=Z2hxmeMr7k/9U4EfcQyebztkuf6MneNT2zAKD72w7RpTggD7ZjCpMMA+AG0iEZYZKM
         nOv7+3nIHvnBr5jgJfjTANm4EXdEmDCo8F/IpMM9lU6y+ts6orITJzVAE8boMr5q+Eoa
         ByPPQHu+fV51HhIJ8ProKLOEOz2Xtc7SmJo/AGhQGcfaeKUFha4vIjRO+ML3+eEZfL7V
         q/J83Wecu938JJEhD81Z1yrhLoS8N0dkLwtyvSWexc3D+ObPIISMyWEpfg6lOtYCkh4c
         aNwCpw7UoT3wICVZZlCRluqnisVWjS5dvL9P6H0hxrfkZk2Z3uD+2bzaO7XMNSuuZ/6C
         jrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xu6EHDS01LsOIawXUSDVH/r2oXuTsWqPdMuqTq7O8gE=;
        b=f5NikMbp6no4u60IMS5BRXrN2jCovl1PBMFc5Vj9DOhXH4cgkxy51kfNBErcrkOJqV
         SO1uSc+u17j31AuQ0PHa2LIEcXXaprgjhRy7VvDopg5a6oBEJaN6mLYNbMC8sWg51oWT
         BXIHRU/4EvgHWOkBTP2AZrI1ncQM/9Q006zcsD4WG1Tw/27vZTQr9hsBAyEFEvfHWQEF
         ylUuF8nFH+k54v/4Wie2lKt0GGRTx8TrqiEJXDZiogEV7VR+LTKHb0N0vsWDXXFuXi3k
         yB6nef0AaBMUDTBtYClfAQ11WME3TsVTveyd1WP6m7/JTqGYBaSVdqhj9Fj9erSOEsKT
         5CKQ==
X-Gm-Message-State: AOAM532rY9CS/N4qiI0Y1z+IkPS9N+elC3zhPFqGJHxAITpLhph9tDA9
        IxvXdSM0K+GC47DuXg1C38iVWbNWtVjovPw4WBqwng==
X-Google-Smtp-Source: ABdhPJyQjBwigtLjvLrVIrEOtKpFLfkTj0wS9QvXw6Cn04KWi9naGQql0vuzXi7YhavlMsx6rr6NzVNT2XkyQjqwJTY=
X-Received: by 2002:a05:6512:ace:b0:478:9af3:d9cb with SMTP id
 n14-20020a0565120ace00b004789af3d9cbmr1136279lfu.103.1653425404449; Tue, 24
 May 2022 13:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220523164626.858340-1-masahiroy@kernel.org> <20220523164626.858340-4-masahiroy@kernel.org>
In-Reply-To: <20220523164626.858340-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 May 2022 13:49:53 -0700
Message-ID: <CAKwvOd=6GHg7z_0-2wsF0Z9Jk1Cb_j=Z4_roYBRpHvj-MCzwTw@mail.gmail.com>
Subject: Re: [PATCH 4/5] modpost: reuse ARRAY_SIZE() macro for section_mismatch()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 23, 2022 at 9:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Move ARRAY_SIZE() from file2alias.c to modpost.h to reuse it in
> section_mismatch().
>
> Also, move the variable 'check' inside the for-loop.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/file2alias.c | 2 --
>  scripts/mod/modpost.c    | 7 +++----
>  scripts/mod/modpost.h    | 3 +++
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 5258247d78ac..e8a9c6816fec 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -734,8 +734,6 @@ static int do_vio_entry(const char *filename, void *symval,
>         return 1;
>  }
>
> -#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> -
>  static void do_input(char *alias,
>                      kernel_ulong_t *arr, unsigned int min, unsigned int max)
>  {
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 77c315dea1a3..48a18b59f908 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1049,8 +1049,6 @@ static const struct sectioncheck *section_mismatch(
>                 const char *fromsec, const char *tosec)
>  {
>         int i;
> -       int elems = sizeof(sectioncheck) / sizeof(struct sectioncheck);
> -       const struct sectioncheck *check = &sectioncheck[0];
>
>         /*
>          * The target section could be the SHT_NUL section when we're
> @@ -1061,14 +1059,15 @@ static const struct sectioncheck *section_mismatch(
>         if (*tosec == '\0')
>                 return NULL;
>
> -       for (i = 0; i < elems; i++) {
> +       for (i = 0; i < ARRAY_SIZE(sectioncheck); i++) {
> +               const struct sectioncheck *check = &sectioncheck[i];
> +
>                 if (match(fromsec, check->fromsec)) {
>                         if (check->bad_tosec[0] && match(tosec, check->bad_tosec))
>                                 return check;
>                         if (check->good_tosec[0] && !match(tosec, check->good_tosec))
>                                 return check;
>                 }
> -               check++;
>         }
>         return NULL;
>  }
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index d9daeff07b83..044bdfb894b7 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -97,6 +97,9 @@ static inline void __endian(const void *src, void *dest, unsigned int size)
>  #endif
>
>  #define NOFAIL(ptr)   do_nofail((ptr), #ptr)
> +
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +
>  void *do_nofail(void *ptr, const char *expr);
>
>  struct buffer {
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
