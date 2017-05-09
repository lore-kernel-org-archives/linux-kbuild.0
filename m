Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:59491 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdEIURP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 May 2017 16:17:15 -0400
Date: Tue, 9 May 2017 13:17:14 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: sparse on scripts/kconfig/*.c
Message-ID: <20170509201714.GA24001@infradead.org>
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, May 09, 2017 at 09:47:41AM -0700, Randy Dunlap wrote:
> Hi,
> 
> I've been attempting to run sparse on the kconfig/ C files -- without success.
> 
> The kbuild files don't try to support CHECK in scripts/kconfig/ AFAICT,
> and just running sparse on the C files has issues with not being able to
> find header files.
> 
> Has anyone done this?  Any clues about how to do it?

As a wild guess from using sparse on various userspace projects:

have you tried simply setting HOSTCC to cgcc?
