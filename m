Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:64667 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932257AbZKDXT4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 18:19:56 -0500
From: Frans Pop <elendil@planet.nl>
Subject: Re: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Date: Thu, 5 Nov 2009 00:19:59 +0100
References: <1257373849-25557-1-git-send-email-max@stro.at>
In-reply-To: <1257373849-25557-1-git-send-email-max@stro.at>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200911050020.00291.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, sam@ravnborg.org

maximilian attems wrote:
> userland dev likes latest incarnation of that userland API.
> make it easy to also build it on make deb-pkg invocation:
>
> dpkg-deb: building package `linux-libc-dev' in
> `../linux-libc-dev_2.6.32-rc6-4_amd64.deb'.

I would very much prefer it if this was either optional or a separate 
target. I have personally never had any need for such a package and would 
like to be able to not build it.

I agree it should be possible, just not forced.

Cheers,
FJP
