Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:34428 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753997AbdDKHbw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2017 03:31:52 -0400
Received: by mail-lf0-f45.google.com with SMTP id z15so82241956lfd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2017 00:31:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170331130941.5250-1-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 11 Apr 2017 10:31:34 +0300
Message-ID: <CAAqcGH=CksAWXJyOwh5wqQMekwsfPft+RDMYM+v4dxr+52-Uxw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] builddeb updates for v4.12
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, debian-kernel <debian-kernel@lists.debian.org>, Riku Voipio <riku.voipio@linaro.org>

Hi Masahiro,

On 31 March 2017 at 16:09,  <riku.voipio@linaro.org> wrote:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Resend of the builddeb script updates that missed v4.11
> round.

Can you please take a look at the series?

> Changes from v1 series:
>
> Standards-Version: line is removed instead of updating
>
> Andrew Donnellan (1):
>   builddeb: fix typo
>
> Riku Voipio (2):
>   builddeb: Update a few outdated and hardcoded strings
>   builddeb: add make fastdeb-pkg target
>
>  scripts/package/Makefile |  7 +++++-
>  scripts/package/builddeb | 58 +++++++++++++++++++++++-------------------------
>  2 files changed, 34 insertions(+), 31 deletions(-)
>
> --
> 2.11.0
>
