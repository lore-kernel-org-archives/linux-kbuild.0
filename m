Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727962AbfLQNmi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 08:42:38 -0500
Date: Tue, 17 Dec 2019 14:42:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] tty: vt: move conmakehash to drivers/tty/vt/ from
 scripts/
Message-ID: <20191217134236.GA3365333@kroah.com>
References: <20191217110633.8796-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217110633.8796-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jiri Slaby <jslaby@suse.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 17, 2019 at 08:06:33PM +0900, Masahiro Yamada wrote:
> scripts/conmakehash is only used for generating
> drivers/tty/vt/consolemap_deftbl.c
> 
> Move it to the related directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  drivers/tty/vt/.gitignore                 | 1 +
>  drivers/tty/vt/Makefile                   | 6 ++++--
>  {scripts => drivers/tty/vt}/conmakehash.c | 0
>  scripts/.gitignore                        | 1 -
>  scripts/Makefile                          | 3 ---
>  5 files changed, 5 insertions(+), 6 deletions(-)
>  rename {scripts => drivers/tty/vt}/conmakehash.c (100%)

I thought we wanted scripts to be in the scripts directory :)

Anyway, this is fine, I'll take it in my tree.

thanks,

greg k-h
