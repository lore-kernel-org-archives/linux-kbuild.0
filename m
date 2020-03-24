Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36755 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgCXTnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:43:39 -0400
Date: Tue, 24 Mar 2020 12:43:36 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 3/3] kbuild: remove AS variable
Message-ID: <20200324194336.GA15310@ubuntu-m2-xlarge-x86>
References: <20200324161539.7538-1-masahiroy@kernel.org>
 <20200324161539.7538-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324161539.7538-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com

On Wed, Mar 25, 2020 at 01:15:39AM +0900, Masahiro Yamada wrote:
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) in the kernel build.
> 
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.
> 
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
