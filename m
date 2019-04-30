Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:48084 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbfD3MXE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 08:23:04 -0400
Date: Tue, 30 Apr 2019 06:23:00 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] dontdiff: update with Kconfig build artifacts
Message-ID: <20190430062300.7c9cf177@lwn.net>
In-Reply-To: <1556549630-17605-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556549630-17605-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org

On Mon, 29 Apr 2019 23:53:50 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Add generated *conf-cfg files.
> 
> Commit 694c49a7c01c ("kconfig: drop localization support") removed
> "gconf.glade.h" and "kxgettext".
> 
> "kconfig" and "lxdialog" should not be excluded either.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thanks.

jon
