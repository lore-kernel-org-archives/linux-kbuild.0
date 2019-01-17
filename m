Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:38574 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728971AbfAQRJL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jan 2019 12:09:11 -0500
Date: Thu, 17 Jan 2019 18:09:09 +0100
From: Christoph Hellwig <hch@lst.de>
Subject: Re: SUBDIRS= replacement
Message-ID: <20190117170909.GB31280@lst.de>
References: <20190117145531.GA21429@lst.de> <20190117162921.GB31768@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190117162921.GB31768@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 17, 2019 at 05:29:21PM +0100, Sam Ravnborg wrote:
> Try:
> 
> make -j4 fs/xfs/
> 
> This is the recommend way to do so.
> Let us know if you see problem with this approach.

Yes, that seems to work.  I think the warning should suggest that as
well, as it probably is the more common use compare to building
external modules.
