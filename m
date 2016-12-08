Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58386 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752249AbcLHL0I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 06:26:08 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB8BNp8d069911
        for <linux-kbuild@vger.kernel.org>; Thu, 8 Dec 2016 06:26:07 -0500
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 27700qvkpf-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Dec 2016 06:26:07 -0500
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <cornelia.huck@de.ibm.com>;
        Thu, 8 Dec 2016 11:26:04 -0000
Date: Thu, 8 Dec 2016 12:25:53 +0100
From: Cornelia Huck <cornelia.huck@de.ibm.com>
Subject: Re: [PATCH] linux/types.h: enable endian checks for all sparse
 builds
In-Reply-To: <1481164052-28036-1-git-send-email-mst@redhat.com>
References: <1481164052-28036-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <20161208122553.5fa5a09c.cornelia.huck@de.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, Jason Wang <jasowang@redhat.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net

On Thu, 8 Dec 2016 04:29:39 +0200
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> By now, linux is mostly endian-clean. Enabling endian-ness
> checks for everyone produces about 200 new sparse warnings for me -
> less than 10% over the 2000 sparse warnings already there.

Out of curiousity: Where do most of those warnings show up?

> 
> Not a big deal, OTOH enabling this helps people notice
> they are introducing new bugs.
> 
> So let's just drop __CHECK_ENDIAN__. Follow-up patches
> can drop distinction between __bitwise and __bitwise__.
> 
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Linus, could you ack this for upstream? If yes I'll
> merge through my tree as a replacement for enabling
> this just for virtio.
> 
>  include/uapi/linux/types.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
> index acf0979..41e5914 100644
> --- a/include/uapi/linux/types.h
> +++ b/include/uapi/linux/types.h
> @@ -23,11 +23,7 @@
>  #else
>  #define __bitwise__
>  #endif
> -#ifdef __CHECK_ENDIAN__
>  #define __bitwise __bitwise__
> -#else
> -#define __bitwise
> -#endif
> 
>  typedef __u16 __bitwise __le16;
>  typedef __u16 __bitwise __be16;

FWIW, I like this better than just enabling it for the virtio code.

