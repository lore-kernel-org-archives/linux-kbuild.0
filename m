Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:54945 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbeI0BM6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Sep 2018 21:12:58 -0400
Received: by mail-it1-f194.google.com with SMTP id f14-v6so4461901ita.4
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Sep 2018 11:58:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 26 Sep 2018 20:58:36 +0200
Message-ID: <CAKwiHFj5yGtsR+s0Ukjy0Pe1pDpd_euyT0MRZdTt0H3ssXqYXQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Kbuild: Some fixdep tweaks
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>

On 15 August 2018 at 16:27, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> These patches eliminate two (albeit tiny and shortlived) processes
> from the cmd_and_fixdep rule, i.e. from every TU being
> compiled. Whether the diffstat below is worth it I'll leave to Kbuild
> maintainers to decide.

Ping.
