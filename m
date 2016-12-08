Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43224 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750758AbcLHFyI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 00:54:08 -0500
Date: Thu, 8 Dec 2016 07:53:59 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] linux/types.h: enable endian checks for all sparse builds
Message-ID: <20161208075152-mutt-send-email-mst@kernel.org>
References: <1481164052-28036-1-git-send-email-mst@redhat.com>
 <BLUPR02MB168374E98A6C86E43DF0BCFE81840@BLUPR02MB1683.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLUPR02MB168374E98A6C86E43DF0BCFE81840@BLUPR02MB1683.namprd02.prod.outlook.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@sandisk.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Jason Wang <jasowang@redhat.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>

On Thu, Dec 08, 2016 at 05:21:47AM +0000, Bart Van Assche wrote:
> On 12/07/16 18:29, Michael S. Tsirkin wrote:
> > By now, linux is mostly endian-clean. Enabling endian-ness
> > checks for everyone produces about 200 new sparse warnings for me -
> > less than 10% over the 2000 sparse warnings already there.
> >
> > Not a big deal, OTOH enabling this helps people notice
> > they are introducing new bugs.
> >
> > So let's just drop __CHECK_ENDIAN__. Follow-up patches
> > can drop distinction between __bitwise and __bitwise__.
> 
> Hello Michael,
> 
> This patch makes a whole bunch of ccflags-y += -D__CHECK_ENDIAN__ 
> statements obsolete. Have you considered to remove these statements?

Absolutely. Just waiting for feedback on the idea.

> Additionally, there are notable exceptions to the rule that most drivers 
> are endian-clean, e.g. drivers/scsi/qla2xxx. I would appreciate it if it 
> would remain possible to check such drivers with sparse without enabling 
> endianness checks. Have you considered to change #ifdef __CHECK_ENDIAN__ 
> into e.g. #ifndef __DONT_CHECK_ENDIAN__?
> 
> Thanks,
> 
> Bart.

The right thing is probably just to fix these, isn't it?
Until then, why not just ignore the warnings?

-- 
MST
