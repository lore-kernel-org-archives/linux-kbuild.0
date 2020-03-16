Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731254AbgCPOJ4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:09:56 -0400
Date: Mon, 16 Mar 2020 15:07:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/2] lib: add support for ZSTD-compressed kernel
Message-ID: <20200316140726.GA4041840@kroah.com>
References: <20200316135025.7579-1-oss@malat.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316135025.7579-1-oss@malat.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Malat <oss@malat.biz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org

On Mon, Mar 16, 2020 at 02:50:24PM +0100, Petr Malat wrote:
> Add support for extracting ZSTD-compressed kernel images, as well as
> ZSTD-compressed initramfs.
> 
> Signed-off-by: Petr Malat <oss@malat.biz>

That says _what_ you did here, but not _why_ you did this, or why anyone
would even want this.

thanks,

greg k-h
