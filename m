Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:39131 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384Ab0LOGZQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 01:25:16 -0500
Received: by iyi12 with SMTP id 12so711423iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 22:25:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291531278-7395-2-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
	<1291531278-7395-2-git-send-email-lacombar@gmail.com>
Date: Wed, 15 Dec 2010 01:25:15 -0500
Message-ID: <AANLkTi=CMvKrxAukwkwwYYfw6vrZQLWnxQCe0VApqakD@mail.gmail.com>
Subject: Re: [PATCH 2/5] kbuild/gconf: add dummy inline for bind_textdomain_codeset()
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

On Sun, Dec 5, 2010 at 1:41 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> This symbols is used by gconf.
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/lkc.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
ping ?

 - Arnaud

> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 3633d5a..16eb416 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -14,6 +14,7 @@
>  static inline const char *gettext(const char *txt) { return txt; }
>  static inline void textdomain(const char *domainname) {}
>  static inline void bindtextdomain(const char *name, const char *dir) {}
> +static inline char *bind_textdomain_codeset(const char *dn, char *c) { return c; }
>  #endif
>
>  #ifdef __cplusplus
> --
> 1.7.2.30.gc37d7.dirty
>
>
