Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37862 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBQyJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jul 2019 12:54:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id bh12so683875plb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2019 09:54:08 -0700 (PDT)
Date: Tue, 2 Jul 2019 12:54:06 -0400
From: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH 5/7] kheaders: remove meaningless -R option of 'ls'
Message-ID: <20190702165406.GD98338@google.com>
References: <20190701005845.12475-1-yamada.masahiro@socionext.com>
 <20190701005845.12475-6-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701005845.12475-6-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

On Mon, Jul 01, 2019 at 09:58:43AM +0900, Masahiro Yamada wrote:
> The -R option of 'ls' is supposed to be used for directories.
> 
>        -R, --recursive
>               list subdirectories recursively
> 
> Since 'find ... -type f' only matches to regular files, we do not
> expect directories passed to the 'ls' command here.
> 
> Giving -R is harmless at least, but unneeded.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
