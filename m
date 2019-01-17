Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:54793 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbfAQQ30 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 11:29:26 -0500
Date: Thu, 17 Jan 2019 17:29:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: SUBDIRS= replacement
Message-ID: <20190117162921.GB31768@ravnborg.org>
References: <20190117145531.GA21429@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117145531.GA21429@lst.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Christoph

On Thu, Jan 17, 2019 at 03:55:31PM +0100, Christoph Hellwig wrote:
> Hi Masahiro, hi Michal,
> 
> I just got this beatiful warning:
> 
> hch@carbon:~/work/xfs$ make -j4 SUBDIRS=fs/xfs
> Makefile:189: ================= WARNING ================
> Makefile:190: 'SUBDIRS' will be removed after Linux 5.3
> Makefile:191: Please use 'M=' or 'KBUILD_EXTMOD' instead
> Makefile:192: ==========================================
> 
> Both the replacement seem to be geared towards building externals
> modules.  But what is the replacement for just building a directory
> of the normal kernel tree?
> 
> E.g. what hit this is that I rebased an XFS series, and wanted to
> compile test just the xfs code for each step using
> 
> make -j4 SUBDIRS=fs/xfs

Try:

make -j4 fs/xfs/

This is the recommend way to do so.
Let us know if you see problem with this approach.

	Sam
