Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36696 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752622AbcGSJhN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Jul 2016 05:37:13 -0400
Date: Tue, 19 Jul 2016 11:37:09 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [REPOST 2, PATCH] builddeb: really include objtool binary in
 headers package
Message-ID: <20160719093709.GA12864@sepie.suse.cz>
References: <20160628122133.GE3554@kaos.lebenslange-mailadresse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160628122133.GE3554@kaos.lebenslange-mailadresse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bjorn@mork.no, mmarek@suse.cz

On Tue, Jun 28, 2016 at 12:21:33PM +0000, Wilfried Klaebe wrote:
> [added linux-kbuild@vger.kernel.org to Cc:, added Fixes:]
> 
> On May 4th, Bjørn Mork provided patch
> 697bbc7b832048d3a679cd55caf2268a325efbe0 to include objtool binaries in
> the headers package. However, that one only works if $srctree=$objtree,
> because the objtool binaries are not written to the srctree, but
> to the objtree.
> 
> Signed-off-by: Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>
> Fixes: 697bbc7b8320 ("builddeb: include objtool binary in headers package")

Applied to kbuild.git#misc.

Thanks,
Michal
