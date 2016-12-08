Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55796 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753219AbcLHLVa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 06:21:30 -0500
Date: Thu, 8 Dec 2016 12:13:25 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] linux/types.h: enable endian checks for all sparse builds
Message-ID: <20161208111325.GB29138@kroah.com>
References: <1481164052-28036-1-git-send-email-mst@redhat.com>
 <BLUPR02MB168374E98A6C86E43DF0BCFE81840@BLUPR02MB1683.namprd02.prod.outlook.com>
 <20161208075152-mutt-send-email-mst@kernel.org>
 <BLUPR02MB168304F8FBA50C916A6A4E6081840@BLUPR02MB1683.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BLUPR02MB168304F8FBA50C916A6A4E6081840@BLUPR02MB1683.namprd02.prod.outlook.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bart Van Assche <Bart.VanAssche@sandisk.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Jason Wang <jasowang@redhat.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>

On Thu, Dec 08, 2016 at 06:38:11AM +0000, Bart Van Assche wrote:
> On 12/07/16 21:54, Michael S. Tsirkin wrote:
> > On Thu, Dec 08, 2016 at 05:21:47AM +0000, Bart Van Assche wrote:
> >> Additionally, there are notable exceptions to the rule that most drivers
> >> are endian-clean, e.g. drivers/scsi/qla2xxx. I would appreciate it if it
> >> would remain possible to check such drivers with sparse without enabling
> >> endianness checks. Have you considered to change #ifdef __CHECK_ENDIAN__
> >> into e.g. #ifndef __DONT_CHECK_ENDIAN__?
> >
> > The right thing is probably just to fix these, isn't it?
> > Until then, why not just ignore the warnings?
> 
> Neither option is realistic. With endian-checking enabled the qla2xxx 
> driver triggers so many warnings that it becomes a real challenge to 
> filter the non-endian warnings out manually:
> 
> $ for f in "" CF=-D__CHECK_ENDIAN__; do make M=drivers/scsi/qla2xxx C=2\
>      $f | &grep -c ': warning:'; done
> 4
> 752
> 
> If you think it would be easy to fix the endian warnings triggered by 
> the qla2xxx driver, you are welcome to try to fix these.

Please don't let one crappy, obviously broken, driver prevent this good
change from happening which will help ensure that the rest of the kernel
(i.e. 99% of it) can be easily tested and fixed for endian issues.

Sounds like you should just fix the driver up if it has so many
problems, and it annoys you so much that you have to filter out some
warnings to see the others :)

thanks,

greg k-h
