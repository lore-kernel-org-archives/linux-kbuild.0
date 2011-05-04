Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:51147 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755618Ab1EDUXL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 16:23:11 -0400
Message-ID: <4DC1B5CF.3070803@suse.cz>
Date: Wed, 04 May 2011 22:23:43 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: make rpm-pkg and version mismatch
References: <20110503212706.GA26044@dev1756.snc6.facebook.com>
In-Reply-To: <20110503212706.GA26044@dev1756.snc6.facebook.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org

Dne 3.5.2011 23:27, Arun Sharma napsal(a):
>
> make rpm-pkg produces files that look like: kernel-2.6.39rc5-2.x86_64.rpm
> However, uname -r produces 2.6.39rc5 (-2 is missing).
>
> This differs from how some of the distributors are packaging the kernel.
> Their setup includes %{release} in uname -r.

Distributors have control over the kernel uname -r string. make rpm, on 
the other hand, needs to work with both the vanilla version strings, as 
well as any crazy suffixes the user comes up with. Hence it uses the 
uname -v version number as the rpm release, which is always defined.


>
> One way to achive that is:
>
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -170,4 +170,8 @@ else
>          fi
>   fi
>
> +# Append the RPM release
> +release=`. ./scripts/mkversion`
> +res="${res}-${release}"
> +

Please don't do that. make rpm has to work with the version string set 
by the kernel, not the other way around.

Michal
