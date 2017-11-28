Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:51180 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751395AbdK1QEl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 11:04:41 -0500
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20171127213423.27218-3-andi@firstfloor.org>
References: <20171127213423.27218-3-andi@firstfloor.org> <20171127213423.27218-1-andi@firstfloor.org>
Subject: Re: [PATCH 02/21] afs: Fix const confusion in AFS
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11149.1511885078.1@warthog.procyon.org.uk>
Date: Tue, 28 Nov 2017 16:04:38 +0000
Message-ID: <11150.1511885078@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

Andi Kleen <andi@firstfloor.org> wrote:

> A trace point string cannot be const because the underlying special
> section is not marked const. An LTO build complains about the
> section attribute mismatch. Fix it by not marking the trace point
> string in afs const.

Do you want this to go through my tree?

David
