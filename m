Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42858 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdEJH2e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 May 2017 03:28:34 -0400
Date: Wed, 10 May 2017 00:28:33 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: sparse on scripts/kconfig/*.c
Message-ID: <20170510072833.GA4619@infradead.org>
References: <fa98e27a-c08d-170f-68d1-2ab2918ef5d1@infradead.org>
 <20170509201714.GA24001@infradead.org>
 <d799e97d-36de-67c8-3740-41482b279c0b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d799e97d-36de-67c8-3740-41482b279c0b@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, May 09, 2017 at 05:27:01PM -0700, Randy Dunlap wrote:
> On 05/09/17 13:17, Christoph Hellwig wrote:
> > On Tue, May 09, 2017 at 09:47:41AM -0700, Randy Dunlap wrote:
> >> Hi,
> >>
> >> I've been attempting to run sparse on the kconfig/ C files -- without success.
> >>
> >> The kbuild files don't try to support CHECK in scripts/kconfig/ AFAICT,
> >> and just running sparse on the C files has issues with not being able to
> >> find header files.
> >>
> >> Has anyone done this?  Any clues about how to do it?
> > 
> > As a wild guess from using sparse on various userspace projects:
> > 
> > have you tried simply setting HOSTCC to cgcc?
> 
> I don't quite see what that has to do with running sparse ($CHECK, not $HOSTCC).

cgcc is a gcc wrappr that calls sparse.  I just trie quickly to patch
Makefile to run cgcc instead of gcc as HOSTCC an it seems to work:

  HOSTCC  scripts/basic/fixdep
scripts/basic/fixdep.c:117:5: warning: symbol 'insert_extra_deps' was not declared. Should it be static?
scripts/basic/fixdep.c:118:6: warning: symbol 'target' was not declared. Should it be static?
scripts/basic/fixdep.c:119:6: warning: symbol 'depfile' was not declared. Should it be static?
scripts/basic/fixdep.c:120:6: warning: symbol 'cmdline' was not declared. Should it be static?

But then I run into the known cgcc bug that it also calls sparse when
called for linking.  Which reminds me that I need to go back and fix
that.
