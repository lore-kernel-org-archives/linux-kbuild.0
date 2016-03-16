Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60984 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753248AbcCPLm3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 07:42:29 -0400
Subject: Re: [PATCH 1/2] kconfig: add chomp like helper function
References: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56E946A1.2060400@suse.com>
Date: Wed, 16 Mar 2016 12:42:25 +0100
MIME-Version: 1.0
In-Reply-To: <1458125619-28093-1-git-send-email-pebolle@tiscali.nl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Josh Boyer <jwboyer@fedoraproject.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-03-16 11:53, Paul Bolle wrote:
> Add a helper function that strips trailing new lines and carriage
> returns from strings. Call it chomp, after the perl function that
> inspired it.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
>  scripts/kconfig/confdata.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 0b7dc2fd7bac..51904c423411 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -248,6 +248,28 @@ e_out:
>  	return -1;
>  }
>  
> +/*
> + * Return newly allocated copy of string "in" with all trailing new lines and
> + * carriage returns removed.
> + */
> +static char *chomp(char *in)
> +{
> +	size_t last = strlen(in);
> +	char *copy;
> +
> +	copy = malloc(last + 1);
> +	if (!copy)
> +		return NULL;
> +
> +	strcpy(copy, in);
> +	if (last)
> +		last--;
> +	while (last  && (copy[last] == '\r' || copy[last] == '\n'))
> +		copy[last--] = '\0';
> +
> +	return copy;
> +}
> +

For this particular use, it's probably easier to just write

conf_warning("unexpected data: %.*s",
	     (int)strcspn(line, "\r\n"), line);

Or do you see more use cases for the chomp function?

No matter how the string is constructed, I like the verbose warning :)

Thanks,
Michal
