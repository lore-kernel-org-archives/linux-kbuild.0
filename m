Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55554 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752538AbdIRNxv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2017 09:53:51 -0400
Date: Mon, 18 Sep 2017 15:54:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: do not try to include firmware in the kernel rpm
Message-ID: <20170918135401.GA18384@kroah.com>
References: <649fc773623d3f3a445cbfb8abca51c04c7919f4.1505730087.git.pabeni@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <649fc773623d3f3a445cbfb8abca51c04c7919f4.1505730087.git.pabeni@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>

On Mon, Sep 18, 2017 at 02:11:15PM +0200, Paolo Abeni wrote:
> Since the commit 5620a0d1aacd ("firmware: delete in-kernel firmware")
> the make target 'firmware_install' is no more available, but the
> current kernel rpm specfile uses it, so that binary rpm generation
> always fails.
> 
> Fix it by dropping firmware inclusion in the generated rpm, too.
> The firmware directory - now empty - is still included into the rpm.
> 
> Fixes: 5620a0d1aacd ("firmware: delete in-kernel firmware")
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  scripts/package/mkspec | 2 --
>  1 file changed, 2 deletions(-)

I think someone else sent this right before you did, but if not:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
