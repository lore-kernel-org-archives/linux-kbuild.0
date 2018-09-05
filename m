Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hurricane.elijah.cs.cmu.edu ([128.2.209.191]:60246 "EHLO
        hurricane.elijah.cs.cmu.edu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727397AbeIEV4U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 17:56:20 -0400
Date: Wed, 5 Sep 2018 12:54:47 -0400
From: Jan Harkes <jaharkes@cs.cmu.edu>
Subject: Re: [PATCH 05/11] UAPI: coda: Don't use internal kernel structs in
 UAPI
Message-ID: <20180905165447.gnjcc2xbgaem3ue3@cs.cmu.edu>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
 <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 05, 2018 at 04:55:10PM +0100, David Howells wrote:
> The size and layout of internal kernel structures may not be relied upon
> outside of the kernel and may even change in a containerised environment if
> a container image is frozen and shifted to another machine.
> 
> Excise these from Coda's upc_req struct.

Argh, that won't work.

I still have to look at where this structure is used exactly, but...

Either this structure is used by the messages that the kernel sends to
userspace, in which case we don't want the kernel to pack the larger
structure that includes a list_head and a wait_queue_head_t in the
message while userspace reads as if it was a smaller structure without
those.

But my gut feeling is that this is not part of the upcall request
messages and never gets to userspace and as such shouldn't be in uapi to
begin with.

Jan
