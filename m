Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20533 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbeDEOue (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 10:50:34 -0400
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com [209.85.217.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w35EoNPK013067
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Apr 2018 23:50:24 +0900
Received: by mail-ua0-f169.google.com with SMTP id a17so8483600uaf.13
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Apr 2018 07:50:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180405112229.5576-1-riku.voipio@linaro.org>
References: <20180405112229.5576-1-riku.voipio@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Apr 2018 23:49:42 +0900
Message-ID: <CAK7LNASm_7+vRr_uM8efR+UgUaQzJYQH=mE9DCv3yv46F0sV9Q@mail.gmail.com>
Subject: Re: [PATCH v5] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

2018-04-05 20:22 GMT+09:00  <riku.voipio@linaro.org>:
> From: Riku Voipio <riku.voipio@linaro.org>
>
> Move debian/ directory generation out of builddeb to a new script,
> mkdebian. The package build commands are kept in builddeb, which
> is now an internal command called from debian/rules.
>
> With these changes in place, we can now use dpkg-buildpackage from
> deb-pkg and bindeb-pkg removing need for handrolled source/changes
> generation.
>
> This patch is based on the criticism of the current state of builddeb
> discussed on:
>
> https://patchwork.kernel.org/patch/9656403/
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---

Applied to linux-kbuild
with the following fix-up.  Thanks!


> +cat <<EOF > debian/rules
> +#!$(command -v $MAKE)  -f

I see two spaces between '$(command -v $MAKE)' and '-f'

I removed one space.
