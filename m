Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48370 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727397AbeIEV4A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 17:56:00 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1c57005277ac723ebb670a1dc847a205f0529d53.camel@opteya.com>
References: <1c57005277ac723ebb670a1dc847a205f0529d53.camel@opteya.com> <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <153616291029.23468.16421004714304578585.stgit@warthog.procyon.org.uk>
Subject: Re: [PATCH 05/11] UAPI: coda: Don't use internal kernel structs in UAPI
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <20769.1536168290.1@warthog.procyon.org.uk>
Date: Wed, 05 Sep 2018 18:24:50 +0100
Message-ID: <20770.1536168290@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yann Droneaud <ydroneaud@opteya.com>
Cc: dhowells@redhat.com, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Yann Droneaud <ydroneaud@opteya.com> wrote:

> Please move them back to <linux/coda_psdev.h>

Will do.

David
