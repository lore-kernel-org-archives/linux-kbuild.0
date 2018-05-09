Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:44240 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbeEIMR1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 May 2018 08:17:27 -0400
MIME-Version: 1.0
In-Reply-To: <20180509160449.68b865a2@canb.auug.org.au>
References: <20180509160449.68b865a2@canb.auug.org.au>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 9 May 2018 07:17:06 -0500
Message-ID: <CAL_Jsq+nbTv-bnjo=OQR+P49MgjwL7qkcc+47=jRHb4z0V94Vw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, May 9, 2018 at 1:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rob,
>
> After merging the devicetree tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@3/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb90000/ports/port@0/endpoint' is not bidirectional
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@1/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb90000/ports/port@0/endpoint' is not bidirectional
> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb: Warning (graph_endpoint): /fragment@1/__overlay__/port@2/endpoint: graph connection to node '/fragment@0/__overlay__/lvds@feb94000/ports/port@0/endpoint' is not bidirectional

I forgot about this one hiding in the tree.

> and over 2000 more :-(

I assume you mean on other files. I've already sent out patches for
arm and arm64 dts files.

Rob
