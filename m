Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35675 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751049AbdESSJZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 14:09:25 -0400
Received: by mail-io0-f180.google.com with SMTP id f102so51736766ioi.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 May 2017 11:09:25 -0700 (PDT)
Date: Fri, 19 May 2017 12:09:23 -0600
From: Tycho Andersen <tycho@docker.com>
Subject: Re: [PATCH] kconfig: always use user input symbols
Message-ID: <20170519180923.eim267rfbtlwrd6p@smitten>
References: <20170519150813.27845-1-tycho@docker.com>
 <CAMuHMdUjyatcp5ROwOW3JJWsTHqc79PCpdVrhFYCSFoFQr5YTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjyatcp5ROwOW3JJWsTHqc79PCpdVrhFYCSFoFQr5YTg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>

Hi Geert,

On Fri, May 19, 2017 at 07:29:05PM +0200, Geert Uytterhoeven wrote:
> Hi Tycho,
> 
> On Fri, May 19, 2017 at 5:08 PM, Tycho Andersen <tycho@docker.com> wrote:
> > ...regardless of visibility.
> >
> > When a symbol that is not visible by default (e.g. PNFS_FLEXFILE_LAYOUT)
> > has a default value, it is impossible to set the value to something not the
> > default:
> >
> > ~/packages/linux render-symbol-inputs grep FLEXFILE .config
> > CONFIG_PNFS_FLEXFILE_LAYOUT=y
> > ~/packages/linux render-symbol-inputs make oldconfig
> > scripts/kconfig/conf  --oldconfig Kconfig
> > ~/packages/linux render-symbol-inputs grep FLEXFILE .config
> > CONFIG_PNFS_FLEXFILE_LAYOUT=m
> >
> > There are two reasons for this: the symbol's user input value is only
> > considered when it is visible (hunks 2 and 3), and the user values are
> > explicitly ignored (hunk 1) if the symbols are not visible.
> >
> > It's not clear to me why hunk 1 exists. I'm sure it solve some problem, but
> > I'm not sure why we would ever want to discard user input values, and
> > causes a problem exactly as the comment describes.
> 
> This is intentional.  If a symbol is not visible, it's not meant to be changed
> by the user, as doing so may break things (at build or runtime).
> 
> E.g. running "make oldconfig" after a kernel upgrade may retain the old
> state of a variable, which is now invalid.  Ignoring invisible symbols
> avoids this.

Makes sense. Thanks!

Tycho
