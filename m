Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:56006 "EHLO
        one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932071AbdK1Quw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 11:50:52 -0500
Date: Tue, 28 Nov 2017 08:50:50 -0800
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 02/21] afs: Fix const confusion in AFS
Message-ID: <20171128165050.GX2482@two.firstfloor.org>
References: <20171127213423.27218-3-andi@firstfloor.org>
 <20171127213423.27218-1-andi@firstfloor.org>
 <11150.1511885078@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11150.1511885078@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

On Tue, Nov 28, 2017 at 04:04:38PM +0000, David Howells wrote:
> Andi Kleen <andi@firstfloor.org> wrote:
> 
> > A trace point string cannot be const because the underlying special
> > section is not marked const. An LTO build complains about the
> > section attribute mismatch. Fix it by not marking the trace point
> > string in afs const.
> 
> Do you want this to go through my tree?

Yes please.

-Andi
