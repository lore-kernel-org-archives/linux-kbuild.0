Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:34657 "EHLO vena.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753547AbcHSAsj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Aug 2016 20:48:39 -0400
Date: Thu, 18 Aug 2016 15:25:24 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] kconfig-language: improve menuconfig usage description
Message-ID: <20160818152524.3a8cc010@lwn.net>
In-Reply-To: <20160802224034.GA30411@eugeniu-X230>
References: <20160802224034.GA30411@eugeniu-X230>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: yann.morin.1998@free.fr, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, rosca.eugeniu@gmail.com

On Wed, 3 Aug 2016 00:40:34 +0200
Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:

> Improper menuconfig usage leads to empty menu entries.
> zconfdump() is able to reveal some real-life examples:
> - menuconfig VFIO_NOIOMMU
> - menuconfig RESET_CONTROLLER
> - menuconfig SND_ARM
> 
> To avoid future occurrences of those, improve the menuconfig syntax
> description.

I've applied this to the docs tree, thanks.

Hopefully you sent patches to fix up the broken menus? :)

jon
