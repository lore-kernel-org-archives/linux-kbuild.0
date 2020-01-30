Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40406 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbgA3RBt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 12:01:49 -0500
Received: by mail-wr1-f65.google.com with SMTP id j104so4984717wrj.7
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2020 09:01:47 -0800 (PST)
Date: Thu, 30 Jan 2020 17:01:41 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
Message-ID: <20200130170141.GA136787@google.com>
References: <20200129150612.19200-1-qperret@google.com>
 <20200130154530.GA7452@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200130154530.GA7452@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

On Thursday 30 Jan 2020 at 07:45:30 (-0800), Christoph Hellwig wrote:
> On Wed, Jan 29, 2020 at 03:06:12PM +0000, Quentin Perret wrote:
> > CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> > from ksymtab. This works really well when using in-tree drivers, but
> > cannot be used in its current form if some of them are out-of-tree.
> 
> NAK.  The state policy is that we don't care for out of tree modules,
> and this is useful for nothing but.

That is correct. Now, I clearly failed to explain this patch properly,
but the long term goal here _is_ to get vendors to contribute more code
upstream, and have a lot less code downstream / out-of-tree. And I hope
we can agree this would be a good thing. So let me try again, and sorry
if I missed the mark the first time.

As you probably know, the current norm on Android and many other systems
is for vendors to introduce significant changes to their downstream
kernels, and to contribute very little (if any) code back upstream.

One of the goals of the Generic Kernel Image (GKI) project together with
updatability and such is to close the gap between vendor-specific
downstream kernels and upstream. Having one unique kernel for all android
devices of the same architecture regardless of the vendor will
mechanically force all interested parties to agree on a common solution.
And we _are_ pushing for all this to reach upstream and be available to
use by the wider community.

The kernel-to-drivers ABI on Android devices varies significantly from
one vendor kernel to another today (because of changes to exported
symbols, dependencies on vendor symbols, and surely other things). The
first step for GKI is to try and put some order into this by agreeing on
one version of the ABI that works for everybody.

For practical reasons, we need to reduce the ABI surface to a subset of
the exported symbols, simply to make the problem realistically solvable.
Hence this patch.

I understand your point of view, and quite frankly agree with the
message. But I think this patch pushes in the right direction. As I see
it, things like GKI really are significant improvements, so preventing
them from happening by refusing trivial patches such as this one will,
in the long term, do more harm than good to the cause.

Thank you for your time,
Quentin
