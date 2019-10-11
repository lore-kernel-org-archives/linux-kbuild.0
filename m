Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726692AbfJKPeA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 11:34:00 -0400
Date: Fri, 11 Oct 2019 17:33:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] symbol namespaces: revert to previous __ksymtab name
 scheme
Message-ID: <20191011153357.GD1283883@kroah.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-4-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010151443.7399-4-maennich@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

On Thu, Oct 10, 2019 at 04:14:42PM +0100, Matthias Maennich wrote:
> The introduction Symbol Namespaces changed the naming schema of the
> __ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.
> 
> That caused some breakages in tools that depend on the name layout in
> either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
> would not be able to read System.map without a patch to support symbol
> namespaces. A warning reported by depmod for namespaced symbols would
> look like
> 
>   depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks
> 
> In order to address this issue, revert to the original naming scheme and
> rather read the __kstrtabns_<symbol> entries and their corresponding
> values from __ksymtab_strings to update the namespace values for
> symbols. After having read all symbols and handled them in
> handle_modversions(), the symbols are created. In a second pass, read
> the __kstrtabns_ entries and update the namespaces accordingly.
> 
> Suggested-by: Jessica Yu <jeyu@kernel.org>
> Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
> Signed-off-by: Matthias Maennich <maennich@google.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
