Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53852 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731535AbgCPOfZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:35:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id 25so17928969wmk.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 07:35:23 -0700 (PDT)
Date: Mon, 16 Mar 2020 15:35:05 +0100
From: Petr Malat <oss@malat.biz>
Subject: Re: [PATCH 1/2] lib: add support for ZSTD-compressed kernel
Message-ID: <20200316143505.GA1449@ntb.petris.klfree.czf>
References: <20200316135025.7579-1-oss@malat.biz>
 <20200316140726.GA4041840@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316140726.GA4041840@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org

I have extended the description, thx.
  Petr

On Mon, Mar 16, 2020 at 03:07:26PM +0100, Greg KH wrote:
> On Mon, Mar 16, 2020 at 02:50:24PM +0100, Petr Malat wrote:
> > Add support for extracting ZSTD-compressed kernel images, as well as
> > ZSTD-compressed initramfs.
> > 
> > Signed-off-by: Petr Malat <oss@malat.biz>
> 
> That says _what_ you did here, but not _why_ you did this, or why anyone
> would even want this.
> 
> thanks,
> 
> greg k-h
