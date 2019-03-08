Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr690105.outbound.protection.outlook.com ([40.107.69.105]:2882
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726267AbfCHV6L (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 16:58:11 -0500
Date: Fri, 8 Mar 2019 16:57:24 -0500
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: Debian build polishing
Message-ID: <20190308215724.GA22319@mit.edu>
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <20190308175703.GA7178@lambda>
 <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

On Fri, Mar 08, 2019 at 10:10:19PM +0100, Enrico Weigelt, metux IT consult wrote:
> > So I really hope your patches don't break this.  
> 
> It shouldn't (at least I dont intend to). Haven't tried where exactly
> the generated debian/rules file lands in your case.

The full debian directory lands in the O= directory.  So presumably
you could make it work for use case if there was a "make O=/build/dir
debian-prepare" which copies the necessary debian/ files into the
build directory and then someone could cd into /build/dir and run
"dpkg-buildpackage"?

						- Ted
