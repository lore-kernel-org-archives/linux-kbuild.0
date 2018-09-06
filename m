Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52526 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725940AbeIFLnY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 07:43:24 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20180905125636-mutt-send-email-mst@kernel.org>
References: <20180905125636-mutt-send-email-mst@kernel.org> <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <153616289529.23468.7498785670556620808.stgit@warthog.procyon.org.uk>
Subject: Re: [PATCH 03/11] UAPI: virtio_net: Fix use of C++ keywords as structural members
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9356.1536217759.1@warthog.procyon.org.uk>
Date: Thu, 06 Sep 2018 08:09:19 +0100
Message-ID: <9357.1536217759@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: dhowells@redhat.com, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org

Michael S. Tsirkin <mst@redhat.com> wrote:

> As long as you do not intend to use any classes, how about
> simply adding
> 
> -Dclass=_class
> 
> to your command line?

That kind of misses the point;-).  It's not reasonable to expect all userspace
C++ users to do this.

David
