Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:55122 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642AbaHKRlB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Aug 2014 13:41:01 -0400
Received: by mail-oa0-f52.google.com with SMTP id o6so6289489oag.25
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2014 10:41:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53E8FC07.1090609@gentoo.org>
References: <cover.1407766447.git.silvio.fricke@gmail.com>
	<53E8FC07.1090609@gentoo.org>
Date: Mon, 11 Aug 2014 19:41:00 +0200
Message-ID: <CAHUN2TFXiV6o8SnW3TUBg6sVFDFUfQDKS5VhkPJfSJr=wfmKfQ@mail.gmail.com>
Subject: Re: [RFC] [PATCH] pkg-config default search pathes
From: Silvio Fricke <silvio.fricke@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: justin <jlec@gentoo.org>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org

Hi Justin,


2014-08-11 19:23 GMT+02:00 justin <jlec@gentoo.org>:
>
> On 11/08/14 16:22, Silvio Fricke wrote:
> > please review this patch.
> > I'm a little bit unsure if this patch is technicaly state-of-the-art because
> > kbuild does it right. The problem is that some cross-toolchains (on my box is
> > yocto installed) change the pkg-config search pathes to do some package-config
> > setups for cross compiling.
> > But the init of the toolchain manipulates PKG_CONFIG_SYSROOT_DIR and
> > PKG_CONFIG_PATH variables that a pkg-config call searches in the wrong place to
> > find the package and gives back the wrong values which we use to test the
> > availability of ncurses installation and this break the [x,g,menu]config.
> >
> > Some recommendations for this?
>
> What would happen in a real crosscompile case?


In a real crosscompile case we don't have a "crosscompile" [x,g,menu]config.
This step is ever made with the host-toolchain. Or I miss something here?

Bye,
Silvio
