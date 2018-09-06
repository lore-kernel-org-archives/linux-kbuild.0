Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41756 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbeIFLr4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 07:47:56 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1c57005277ac723ebb670a1dc847a205f0529d53.camel@opteya.com>
References: <1c57005277ac723ebb670a1dc847a205f0529d53.camel@opteya.com> <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk>
Subject: Re: [PATCH 05/11] UAPI: coda: Don't use internal kernel structs in UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9915.1536218032.1@warthog.procyon.org.uk>
Date: Thu, 06 Sep 2018 08:13:52 +0100
Message-ID: <9916.1536218032@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yann Droneaud <ydroneaud@opteya.com>
Cc: dhowells@redhat.com, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Yann Droneaud <ydroneaud@opteya.com> wrote:

> This structure should not have been exposed to userspace in the first
> place: it's unusable by userspace as it is. It was incorrect to have it
> outside of #ifdef __KERNEL__ before commit 607ca46e97a1b ... 
> ...
> All CODA_REQ_* defines internals to kernel side and not exchanged with
> userspace.
> 
> Please move them back to <linux/coda_psdev.h>

Is there any reason coda_psdev.h needs to be in include/linux/ rather than
fs/coda/?

David
