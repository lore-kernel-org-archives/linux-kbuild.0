Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932759AbcLHC3p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Dec 2016 21:29:45 -0500
Date: Thu, 8 Dec 2016 04:29:39 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] linux/types.h: enable endian checks for all sparse builds
Message-ID: <1481164052-28036-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>
Cc: Jason Wang <jasowang@redhat.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net

By now, linux is mostly endian-clean. Enabling endian-ness
checks for everyone produces about 200 new sparse warnings for me -
less than 10% over the 2000 sparse warnings already there.

Not a big deal, OTOH enabling this helps people notice
they are introducing new bugs.

So let's just drop __CHECK_ENDIAN__. Follow-up patches
can drop distinction between __bitwise and __bitwise__.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Linus, could you ack this for upstream? If yes I'll
merge through my tree as a replacement for enabling
this just for virtio.

 include/uapi/linux/types.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index acf0979..41e5914 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -23,11 +23,7 @@
 #else
 #define __bitwise__
 #endif
-#ifdef __CHECK_ENDIAN__
 #define __bitwise __bitwise__
-#else
-#define __bitwise
-#endif
 
 typedef __u16 __bitwise __le16;
 typedef __u16 __bitwise __be16;
-- 
MST
