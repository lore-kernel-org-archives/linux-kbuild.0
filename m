Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:60654 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbeIYN5W (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Sep 2018 09:57:22 -0400
Date: Tue, 25 Sep 2018 09:51:04 +0200
From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v9 2/2] iommu/amd: Add basic debugfs infrastructure for
 AMD IOMMU
Message-ID: <20180925075104.GA18287@8bytes.org>
References: <152883965482.1936.13657625103232933481.stgit@taos>
 <152883969032.1936.15155267369758178246.stgit@taos>
 <CAMuHMdVf-QDAVh-vHF_xyvX73_nsO9X7RnDc=yCK_FS68i6zTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVf-QDAVh-vHF_xyvX73_nsO9X7RnDc=yCK_FS68i6zTw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gary.hook@amd.com, Linux IOMMU <iommu@lists.linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Aug 27, 2018 at 08:56:50AM +0200, Geert Uytterhoeven wrote:
> If it is that bad, shouldn't this option be protected by some Kconfig
> trickery to avoid it being enabled in allmodconfig/allyesconfig builds?

It is fine to have it in allmodconfig/allyesconfig, I just don't want
any distro-kernel enable it so that these internals become a user-space
ABI or leak security sensitive data on everyones system. This is
intended to be a pure debugging feature for development.


Regards,

	Joerg
