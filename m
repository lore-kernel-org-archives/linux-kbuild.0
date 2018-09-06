Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49492 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729155AbeIFT3t (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 15:29:49 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2e337313415a1ede1fb7a777902a0de7cb7c2602.camel@opteya.com>
References: <2e337313415a1ede1fb7a777902a0de7cb7c2602.camel@opteya.com> <1c57005277ac723ebb670a1dc847a205f0529d53.camel@opteya.com> <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk> <9916.1536218032@warthog.procyon.org.uk>
Subject: Re: [PATCH 05/11] UAPI: coda: Don't use internal kernel structs in UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25411.1536245633.1@warthog.procyon.org.uk>
Date: Thu, 06 Sep 2018 15:53:53 +0100
Message-ID: <25412.1536245633@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yann Droneaud <ydroneaud@opteya.com>
Cc: dhowells@redhat.com, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Yann Droneaud <ydroneaud@opteya.com> wrote:

> At first I thought the first lines (see below) could have been useful
> for userspace:
> 
>   #define CODA_PSDEV_MAJOR 67
>   #define MAX_CODADEVS  5    /* how many do we allow */

Note that I was asking about include/linux/coda_psdev.h (the internal kernel
header), not include/uapi/linux/coda_psdev.h (the UAPI header).

David
