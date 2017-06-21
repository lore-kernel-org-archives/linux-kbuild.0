Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.fireflyinternet.com ([109.228.58.192]:62131 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751093AbdFUJQS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 05:16:18 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20170621091341.spvazz22dodqwfzv@phenom.ffwll.local>
References: <20170621063420.24913-1-npiggin@gmail.com>
 <20170621091341.spvazz22dodqwfzv@phenom.ffwll.local>
Message-ID: <149803655698.29716.6121575885807792619@mail.alporthouse.com>
Subject: Re: [PATCH] drm/i915: select CRC32
Date: Wed, 21 Jun 2017 10:15:56 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@intel.com>

Quoting Daniel Vetter (2017-06-21 10:13:41)
> On Wed, Jun 21, 2017 at 04:34:20PM +1000, Nicholas Piggin wrote:
> > kbuild test robot found a build failure when building with thin
> > archives:
> > 
> > http://marc.info/?l=linux-kbuild&m=149802285009737&w=2
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Pushed to drm-intel for 4.14, thanks.

Probably deserves to be in fixes if we identify what introduced the CRC
dep. mst-dp? pipe crc?
-Chris
