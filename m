Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:34643 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754830AbdDQUfU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Apr 2017 16:35:20 -0400
Received: by mail-pf0-f172.google.com with SMTP id c198so70535478pfc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Apr 2017 13:35:20 -0700 (PDT)
Date: Mon, 17 Apr 2017 13:35:18 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] frv: Use OFFSET macro in DEF_*REG()
Message-ID: <20170417203518.GP28657@google.com>
References: <20170403194636.96438-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20170403194636.96438-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

El Mon, Apr 03, 2017 at 12:46:36PM -0700 Matthias Kaehlcke ha dit:

> Avoid code duplication by using OFFSET() in DEF_*REG() instead of
> replicating the macro.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Ping, any feedback on this patch?

Thanks

Matthias
