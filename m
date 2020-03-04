Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgCDQK2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 11:10:28 -0500
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-3-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-3-masahiroy@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 4 Mar 2020 10:10:15 -0600
Message-ID: <CAL_JsqKrdC7B_8TfbgESq1ZR3TVxR9bGvpxUDVVmMxi6tceQ=A@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: allow to run dt_binding_check and dtbs_check
 in a single command
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Tue, Mar 3, 2020 at 9:20 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 93512dad334d ("dt-bindings: Improve validation build error
> handling"), 'make dtbs_check' does not validate the schema fully.
>
> If you want to check everything, you need to run two commands.
>
>   $ make ARCH=arm dt_binding_check
>   $ make ARCH=arm dtbs_check
>
> They are exclusive each other, so you cannot do like this:
>
>   $ make ARCH=arm dt_binding_check dtbs_check
>
> In this case, dt-doc-validate and dt-extract-example are skipped
> because CHECK_DTBS is set.
>
> Let's make it possible to run those two targets simultaneously.
> It will be useful for schema writers.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Documentation/devicetree/bindings/Makefile  | 8 +++-----
>  Documentation/devicetree/writing-schema.rst | 4 ++++
>  Makefile                                    | 6 +++++-
>  3 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
