Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34597 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752689AbdFUJ0t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 05:26:49 -0400
Received: by mail-pg0-f65.google.com with SMTP id j186so26562108pge.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 02:26:48 -0700 (PDT)
Date: Wed, 21 Jun 2017 19:26:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] drm/i915: select CRC32
Message-ID: <20170621192636.6fdba5cf@roar.ozlabs.ibm.com>
In-Reply-To: <149803655698.29716.6121575885807792619@mail.alporthouse.com>
References: <20170621063420.24913-1-npiggin@gmail.com>
        <20170621091341.spvazz22dodqwfzv@phenom.ffwll.local>
        <149803655698.29716.6121575885807792619@mail.alporthouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@intel.com>

On Wed, 21 Jun 2017 10:15:56 +0100
Chris Wilson <chris@chris-wilson.co.uk> wrote:

> Quoting Daniel Vetter (2017-06-21 10:13:41)
> > On Wed, Jun 21, 2017 at 04:34:20PM +1000, Nicholas Piggin wrote:  
> > > kbuild test robot found a build failure when building with thin
> > > archives:
> > > 
> > > http://marc.info/?l=linux-kbuild&m=149802285009737&w=2
> > > 
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>  
> > 
> > Pushed to drm-intel for 4.14, thanks.  
> 
> Probably deserves to be in fixes if we identify what introduced the CRC
> dep. mst-dp? pipe crc?

Looks like

579cea5f3 ("drm/i915/gvt: golden virtual HW state management")

Thanks,
Nick
