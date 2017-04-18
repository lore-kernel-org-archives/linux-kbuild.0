Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:50186 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754768AbdDRJ76 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 05:59:58 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20170403194636.96438-1-mka@chromium.org>
References: <20170403194636.96438-1-mka@chromium.org>
Subject: Re: [PATCH] frv: Use OFFSET macro in DEF_*REG()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28526.1492509596.1@warthog.procyon.org.uk>
Date: Tue, 18 Apr 2017 10:59:56 +0100
Message-ID: <28527.1492509596@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Matthias Kaehlcke <mka@chromium.org> wrote:

> Avoid code duplication by using OFFSET() in DEF_*REG() instead of
> replicating the macro.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: David Howells <dhowells@redhat.com>
