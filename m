Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:41914 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220AbcAGST1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2016 13:19:27 -0500
Received: from localhost.localdomain ([127.0.0.1]:37158 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27014701AbcAGSTZ0MAce (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org> + 1 other);
        Thu, 7 Jan 2016 19:19:25 +0100
Date: Thu, 7 Jan 2016 19:19:20 +0100
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] ld-version: fix it on Fedora
Message-ID: <20160107181920.GE17031@linux-mips.org>
References: <1452189189-31188-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452189189-31188-1-git-send-email-mst@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <james.hogan@imgtec.com>

On Thu, Jan 07, 2016 at 07:55:24PM +0200, Michael S. Tsirkin wrote:

> On Fedora 23, ld --version outputs:
> GNU ld version 2.25-15.fc23
> 
> But ld-version.sh fails to parse this, so e.g.  mips build fails to
> enable VDSO, printing a warning that binutils >= 2.24 is required.
> 
> To fix, teach ld-version to parse this format.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Which tree should this be merged through? Mine? MIPS?

MIPS is the sole user of ld-ifversion at this time and taking this through
the MIPS tree will avoid possible merge conflicts with James Hogan's
pending d5ece1cb074b2c7082c9a2948ac598dd0ad40657 fix ("Fix ld-version.sh to
handle large 3rd version part").  So I think I should take this through
the MIPS tree.

Thanks!

  Ralf
