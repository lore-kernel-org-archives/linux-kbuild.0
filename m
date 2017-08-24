Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from quartz.orcorp.ca ([184.70.90.242]:33622 "EHLO quartz.orcorp.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753367AbdHXP12 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Aug 2017 11:27:28 -0400
Date: Thu, 24 Aug 2017 09:27:13 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: Possible rdma-core header conflict
Message-ID: <20170824152713.GB23110@obsidianresearch.com>
References: <CACTTzNa3EzABie9=h2X-ONBefyaoWE1+RAT-T+uxJVvVij15Rg@mail.gmail.com>
 <20170821120310.GL1724@mtr-leonro.local>
 <20170821155729.GC4401@obsidianresearch.com>
 <CACTTzNar-qBRxkeWHL-gt4C9A6yTbY+GbkTT6tWKvJcnpK=J_g@mail.gmail.com>
 <20170822064704.GR1724@mtr-leonro.local>
 <20170824105007.GH1724@mtr-leonro.local>
 <CACTTzNYiYCg-hYX8WGYpn6Yg4QZ=XqgQcyB-m_9cSd5D+w0juQ@mail.gmail.com>
 <20170824122328.GJ1724@mtr-leonro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170824122328.GJ1724@mtr-leonro.local>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Yigal Korman <yigal@plexistor.com>, mmarek@suse.com, linux-kbuild@vger.kernel.org, dhowells@redhat.com, Linux RDMA Mailing List <linux-rdma@vger.kernel.org>

On Thu, Aug 24, 2017 at 03:23:28PM +0300, Leon Romanovsky wrote:

> For the development, I use ability of rdma-core to run everything in
> place and I don't install anything. I compile with build.sh supplied
> in rdma-core and adjust Makefiles to point to build/lib|include directories
> without need to install.

For development you can also tell rdma-core to refer to the kernel
source tree directly and it will immediately use those kernel
header for RDMA. No need to install things and wreck your distro.

#  -DKERNEL_DIR='.../linux' (default '')
#      If set use the kernel UAPI headers from this kernel source
#      tree.

Jason
