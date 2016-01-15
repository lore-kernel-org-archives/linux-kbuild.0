Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46999 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbcAOW17 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Jan 2016 17:27:59 -0500
Date: Fri, 15 Jan 2016 23:27:57 +0100
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [kconfig-sat] New satconfig version (for 4.3.0)
Message-ID: <20160115222757.GP11277@wotan.suse.de>
References: <CAOMGZ=FvbWy+WYCmsWmN+sGL_z8T=8XMsV3YCkHwP+Cs4WZu3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMGZ=FvbWy+WYCmsWmN+sGL_z8T=8XMsV3YCkHwP+Cs4WZu3w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kconfig-sat <kconfig-sat@googlegroups.com>, kbuild <linux-kbuild@vger.kernel.org>

On Sun, Dec 27, 2015 at 06:54:27PM +0100, Vegard Nossum wrote:
> Hi all,
> 
> I've rebased my satconfig branch onto v4.3 and fixed a couple of bugs
> which now actually makes satconfig quite usable (depending on what you
> feed it as input, of course).

Nice work! My recommendation is to just always work on Linus'
latest tree, and rebase regularly so you don't have to address
large chunks of code shuffling.

  Luis
