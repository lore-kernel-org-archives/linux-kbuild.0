Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55856 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgCZCGA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 22:06:00 -0400
Received: by mail-pj1-f68.google.com with SMTP id mj6so1820145pjb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Mar 2020 19:05:59 -0700 (PDT)
Date: Wed, 25 Mar 2020 19:05:57 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 1/2] kconfig: remove unused variable in qconf.cc
Message-ID: <202003251905.6D43E64@keescook>
References: <20200325031433.28223-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200325031433.28223-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org

On Wed, Mar 25, 2020 at 12:14:31PM +0900, Masahiro Yamada wrote:
> If this file were compiled with -Wall, the following warning would be
> reported:
> 
> scripts/kconfig/qconf.cc:312:6: warning: unused variable ‘i’ [-Wunused-variable]
>   int i;
>       ^
> 
> The commit prepares to turn on -Wall for C++ host programs.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
>  scripts/kconfig/qconf.cc | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 82773cc35d35..50a5245d87bb 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -309,8 +309,6 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
>  	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
>  	  rootEntry(0), headerPopup(0)
>  {
> -	int i;
> -
>  	setObjectName(name);
>  	setSortingEnabled(false);
>  	setRootIsDecorated(true);
> -- 
> 2.17.1
> 

-- 
Kees Cook
