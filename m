Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:62709 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752007AbbCRRsP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 13:48:15 -0400
Message-ID: <1426700894.23586.11.camel@x220>
Subject: Re: [PATCH] kconfig: add missing va_end()
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 18 Mar 2015 18:48:14 +0100
In-Reply-To: <1426699007-10933-1-git-send-email-johannes@sipsolutions.net>
References: <1426699007-10933-1-git-send-email-johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kbuild@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>

[Removed Yann.]

On Wed, 2015-03-18 at 18:16 +0100, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> This was pointed out by static checker analysis, but is likely
> otherwise harmless. Add it anyway to confuse the reader less.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  scripts/kconfig/confdata.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index f88d90f20228..28df18dd1147 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -59,6 +59,7 @@ static void conf_message(const char *fmt, ...)
>  	va_start(ap, fmt);
>  	if (conf_message_callback)
>  		conf_message_callback(fmt, ap);
> +	va_end(ap);
>  }
>  
>  const char *conf_get_configname(void)

This is fixed since v4.0-rc1 with commit b6a2ab2cd473 ("kconfig: use
va_end to match corresponding va_start"). Did that checker find anything
else noteworthy in scripts/kconfig?

Thanks,


Paul Bolle

