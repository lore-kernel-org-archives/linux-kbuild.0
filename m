Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF13C07E9D
	for <linux-kbuild@archiver.kernel.org>; Sun,  4 Jul 2021 23:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D76860234
	for <linux-kbuild@archiver.kernel.org>; Sun,  4 Jul 2021 23:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhGDXSs (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 4 Jul 2021 19:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhGDXQB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 19:16:01 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A81C0613E4;
        Sun,  4 Jul 2021 16:12:09 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id u7so16702008ion.3;
        Sun, 04 Jul 2021 16:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uzWB3AHLUJlLSAZZ+MVckrPCb57gpxCEJ5H6xaA3pgM=;
        b=vK8bMK9DBHv1SP5pxbUtkWveCCrSoObzk1GLRdlxLWu6/SDfrVkeqFDYDh/tCrnshu
         r2WAje5FXSusjfJk3Z0ZSN7hczhsCsR9EmG1WRYszBKms9dh4RlfWB5lv3sBb9uhWVcQ
         HpGp1k9nl2SdlAw4OdTJGcE2NNB4FXxWQs5xtQvtL+YsjBSRedmXKJeydVETIBz/tQ1+
         OmrP6QM7CM6E+fvi6nq+MUCgwUP+AWvys/pyitr5rwrbHQ1tBtblGGsKNFv4ktsHcT7S
         yoMStje2lpnX/DqoJRrBqu+XxGpVyxk0ENHecwLTu0I/Rcl9fJ8SNjOaMudS0FZrcL1T
         uy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzWB3AHLUJlLSAZZ+MVckrPCb57gpxCEJ5H6xaA3pgM=;
        b=c5FLLyddT0SFLcD6XCjINKFVyQ/PcGONAcmVOQT/6nVUFqrVOfJWg86SmJ/x80L1zY
         5G/mYHqE5J3r9AYV9Mmju7zhN7Cx+akhujpUPjK6lnm1vbMJ1NzLRuYtwvRCIBnnkJd8
         EhlST2KXYM02u17/7vYezVD1HlHNLT5Io325X57vYdFW4WC1WMg+agVcPAucTOCo6hu7
         xji2nNYB6EpZYthaWCNf2/7oXvbE4zQOhdAv0QHnMKhQJCp1BFREvyLcNDvLTjFKlEaB
         N4Qyl9att03L4X2kq7y86vkTU3qS+K/y6+tykgBLviUWGmtnxQGee6ZxtDNVG9GlqEly
         Uy1g==
X-Gm-Message-State: AOAM5316g+WGJGjLCIO3ZJ7IprwxDYXqGoku30X120aGGv7DEBfnlopZ
        5bpNSRanaUsZy4dc9gD0SlkJpn9fDG6guO5pyfM=
X-Google-Smtp-Source: ABdhPJyWS8uFmP4Zn1lIgpyrEfgqdC1kj3MgjjkSOVFr2wDSyeXy0+JxFSbvIQqNFOG+GQ/umB9osbv8UxiyGXSNWj0=
X-Received: by 2002:a05:6638:43:: with SMTP id a3mr9673706jap.41.1625440329412;
 Sun, 04 Jul 2021 16:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 5 Jul 2021 01:11:58 +0200
Message-ID: <CANiq72nQq8Y8v9Pyf7JFq6Kf-+doNP+mHAFNzj_cSFBa3KwS5w@mail.gmail.com>
Subject: Re: [PATCH 00/17] Rust support
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 10:28 PM <ojeda@kernel.org> wrote:
>
> This is the patch series to add support for Rust as a second language
> to the Linux kernel.

In case somebody wonders: patch 07 was particularly big and lore does
not seem to be showing it.

Let me know if you want me to split it; otherwise I will ask
Konstantin when he is back from holidays.

>   - Many folks that have reported issues, tested the project,
>     helped spread the word, joined discussions and contributed in
>     other ways! In no particular order: Chenguang Wang, Greg Morenz,
>     John Baublitz, Leah Leshchinsky, Caedin Cook, Liam Arzola,
>     Fabio Aiuto, Hanqing Zhao, Robin Randhawa, Michal Rostecki,
>     Wei Liu...

I forgot to mention Samantha Miller, Santosh Sivaraj, Vegard Nossum
and Leandro Coutinho.

My apologies!

Cheers,
Miguel
