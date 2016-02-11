Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34412 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750771AbcBKPxM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Feb 2016 10:53:12 -0500
Subject: Re: [PATCH] ld-version: Drop the 4th and 5th version components
References: <alpine.DEB.2.00.1602111359390.15885@tp.orcam.me.uk>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56BCAE65.5060103@suse.com>
Date: Thu, 11 Feb 2016 16:53:09 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1602111359390.15885@tp.orcam.me.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "Michael S. Tsirkin" <mst@redhat.com>, James Hogan <james.hogan@imgtec.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On 2016-02-11 15:25, Maciej W. Rozycki wrote:
> ... making upstream development binutils snapshots work as expected,
> e.g.:
> 
> $ mips64el-linux-ld --version
> GNU ld (GNU Binutils) 2.20.1.20100303
> [...]
> $ 
> 
> Signed-off-by: Maciej W. Rozycki <macro@imgtec.com>

fwiw, Acked-by: Michal Marek <mmarek@suse.cz>


>  NB comments in scripts/Kbuild.include around `ld-version' have not been 
> accordingly updated in the course of changes made to `ld-version.sh' and 
> they still need such an update, unless we right-shift the version code 
> calculated back by 4 decimal digits, which I hesitated doing here for 
> simplicity.  What was the original reason to add the 4th and 5th 
> components?

No idea, but I don't think we will ever need this level of detail. So
yes, the script and its only in-tree user could be updated to divide the
numbers by 10000.

Michal
