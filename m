Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:43332 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfIOHYJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Sep 2019 03:24:09 -0400
Date: Sun, 15 Sep 2019 01:24:03 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2] Documentation: kbuild: Add document about
 reproducible builds
Message-ID: <20190915012403.7173b503@lwn.net>
In-Reply-To: <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
References: <20190914112420.qift4wjk7llxg57x@decadent.org.uk>
        <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ab@php.net

On Sun, 15 Sep 2019 12:24:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> On Sat, Sep 14, 2019 at 8:24 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> >
> > In the Distribution Kernels track at Linux Plumbers Conference there
> > was some discussion around the difficulty of making kernel builds
> > reproducible.
> >
> > This is a solved problem, but the solutions don't appear to be
> > documented in one place.  This document lists the issues I know about
> > and the settings needed to ensure reproducibility.
> >
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>  
> 
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I have applied this, thanks.

jon
