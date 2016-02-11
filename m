Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:46094 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752170AbcBKNAf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Feb 2016 08:00:35 -0500
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S27012512AbcBKNAcCrZkJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org> + 1 other);
        Thu, 11 Feb 2016 14:00:32 +0100
Date: Thu, 11 Feb 2016 13:00:32 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] ld-version: fix it on Fedora
In-Reply-To: <20160107181920.GE17031@linux-mips.org>
Message-ID: <alpine.LFD.2.20.1602111249400.2715@eddie.linux-mips.org>
References: <1452189189-31188-1-git-send-email-mst@redhat.com> <20160107181920.GE17031@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>

On Thu, 7 Jan 2016, Ralf Baechle wrote:

> > GNU ld version 2.25-15.fc23
> > 
> > But ld-version.sh fails to parse this, so e.g.  mips build fails to
> > enable VDSO, printing a warning that binutils >= 2.24 is required.
> > 
> > To fix, teach ld-version to parse this format.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > 
> > Which tree should this be merged through? Mine? MIPS?
> 
> MIPS is the sole user of ld-ifversion at this time and taking this through
> the MIPS tree will avoid possible merge conflicts with James Hogan's
> pending d5ece1cb074b2c7082c9a2948ac598dd0ad40657 fix ("Fix ld-version.sh to
> handle large 3rd version part").  So I think I should take this through
> the MIPS tree.

 FYI, I'm still getting a failure here, with:

$ mips64el-linux-ld --version
GNU ld (GNU Binutils) 2.20.1.20100303
[...]
$

-- so this is a plain upstream development snapshot as these have their 
date appended.  Can we just get rid of the subversion components beyond 
the third, as I already suggested?  I.e. stop on the third point and in 
any case on a non-point-non-digit.

 I'll post a minimal fix shortly, feel free to enhance it if needed.

  Maciej
