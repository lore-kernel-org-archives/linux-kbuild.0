Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36638 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035138AbdD1LZT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Apr 2017 07:25:19 -0400
MIME-Version: 1.0
In-Reply-To: <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com> <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2017 13:25:17 +0200
Message-ID: <CAMuHMdWLhLqjNgz6iUOY8LY1Jjn3-_iV2ncbOxYLCLZbf=Rz+w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Frank,

On Wed, Apr 26, 2017 at 2:09 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Existing overlay unit tests examine individual pieces of the overlay
> code.  The new tests target the entire process of applying an overlay.
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>
> There are checkpatch warnings.  I have reviewed them and feel they
> can be ignored.
>
>  drivers/of/fdt.c                                 |  14 +-
>  drivers/of/of_private.h                          |  12 +
>  drivers/of/unittest-data/Makefile                |  17 +-
>  drivers/of/unittest-data/overlay.dts             |  53 ++++
>  drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
>  drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
>  drivers/of/unittest.c                            | 317 +++++++++++++++++++++++
>  7 files changed, 505 insertions(+), 8 deletions(-)
>
>  create mode 100644 drivers/of/unittest-data/overlay.dts
>  create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
>  create mode 100644 drivers/of/unittest-data/overlay_base.dts

Shouldn't these be called .dtso instead of .dts?

> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile

> +# enable creation of __symbols__ node
> +DTC_FLAGS_overlay := -@
> +DTC_FLAGS_overlay_bad_phandle := -@
> +DTC_FLAGS_overlay_base := -@

This flag is needed for all DTs that will be involved with overlays.

Hence what about enabling this globally instead, cfr. "Enable DT symbols when"
CONFIG_OF_OVERLAY is used
("http://www.spinics.net/lists/devicetree/msg103363.html")?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
