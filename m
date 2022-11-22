Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D5AC43219
	for <linux-kbuild@archiver.kernel.org>; Tue, 22 Nov 2022 13:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233110AbiKVNA7 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 22 Nov 2022 08:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiKVNA4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Nov 2022 08:00:56 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E1461BB6;
        Tue, 22 Nov 2022 05:00:54 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id c15so17198210ybf.1;
        Tue, 22 Nov 2022 05:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bzFWaMTOU84LonhG6RqUM6eS/ww8ShETQwxQFHcZhzQ=;
        b=hWFG/bBbLnshBsRtcZgg0ZK2MTCNImlyP7W0RP11CSS81Klbd0GiGl5SdbT2tMJBwa
         Wi+XD+Ia7y6J0EAhtcDIN6HTKJBGRmfxZuERDMOCGbfaaMW3Xv4j1uyr51fnG9LNMX/+
         l0Witm1A84qPPOgT5T4FrqTzILrSOSjVsa28MIO+WFtb2gfKHHtdZtroOiUpFbry6kAE
         WkYNbjP3wn0ONrU569BWszTzlds+3zpLpdvKGvocHXFW6miZmbGTv2yri/Et4F7OfcBS
         r7171vCkGRoWg6HKR+8dAhvNABplUNADTml6epTufg03NJ06R57EWUxn+W+bUADqsxTy
         RcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzFWaMTOU84LonhG6RqUM6eS/ww8ShETQwxQFHcZhzQ=;
        b=yrjS8fcqmotLHwp9qkUX/4fwYEl3hovhZfHtd/c8/rRcwK7VKdqr252oEwV0/jy7DN
         a8K2bkneZ9T9eM1EJVkSslonynNovA6PBuXLXAnjX9r73FnGLEv6ploPBS821bSP+6sz
         vGrEbSw/7A6z1uLutNwI3nR+GJrknyVydCtnImFgUwsV25LIt8YWkvgt3lpicvsyFN6s
         pZS+yPMlFCWn/iZis775f/FhpHxslENl7B2cmkpifqMQKBYiTXFjZF836PKVarghp6cc
         g6dK8hrMk3sb0sQYpchqP4Qxc0ZRCVsZfWfo/5tVZboQnbrtou1M0ZChIt9HTCTkNakK
         bm1g==
X-Gm-Message-State: ANoB5pntZ3Wm4w/F8N/pkka0bRGq7fIoA667HmFJdIuYxr26+393Holo
        +nCLY3FmQ2hcaAGvMMks+a7cywEchWXwswDfwODR3ucuQ1LOTQ==
X-Google-Smtp-Source: AA0mqf69nBW8D0HRJNqZOBk25rF8Gtu3woMz3lZYawkR/Dl8xdcolr0QdPhoZNJA2AGtPB3SHLnXWSWpIORSmqGwacA=
X-Received: by 2002:a25:7655:0:b0:6d3:7617:b8ea with SMTP id
 r82-20020a257655000000b006d37617b8eamr3507384ybc.75.1669122054123; Tue, 22
 Nov 2022 05:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20221121162016.GA2422@DESKTOP-NK4TH6S.localdomain>
In-Reply-To: <20221121162016.GA2422@DESKTOP-NK4TH6S.localdomain>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 22 Nov 2022 14:00:43 +0100
Message-ID: <CANiq72nGhJqrZOXhNio0Uu-OfUC5BOTzMLgAMO4r0WZdt1uzCw@mail.gmail.com>
Subject: Re: [PATCH] scripts: add rust in scripts/Makefile.package
To:     Paran Lee <p4ranlee@gmail.com>
Cc:     ojeda@kernel.org, austindh.kim@gmail.com, pmnxis@gmail.com,
        rust-for-linux@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Paran,

On Mon, Nov 21, 2022 at 5:26 PM Paran Lee <p4ranlee@gmail.com> wrote:
>
> -               security sound tools usr virt \
> +               security sound tools usr virt rust \

Looks like this list is intended to be sorted, right?

Thanks for the patch!

(Also, please use `scripts/get_maintainers.pl` to find the most
relevant maintainers and lists -- I have Cc'd them here)

Cheers,
Miguel
