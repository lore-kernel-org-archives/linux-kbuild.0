Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:33618 "EHLO sipsolutions.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754887AbbCRSzS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 14:55:18 -0400
Message-ID: <1426704915.3001.16.camel@sipsolutions.net>
Subject: Re: [PATCH] kconfig: add missing va_end()
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 18 Mar 2015 19:55:15 +0100
In-Reply-To: <1426700894.23586.11.camel@x220>
References: <1426699007-10933-1-git-send-email-johannes@sipsolutions.net>
	 <1426700894.23586.11.camel@x220>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kbuild@vger.kernel.org

On Wed, 2015-03-18 at 18:48 +0100, Paul Bolle wrote:

> This is fixed since v4.0-rc1 with commit b6a2ab2cd473 ("kconfig: use
> va_end to match corresponding va_start"). 

Heh, sorry for the noise. I'm still on 3.19-ish on my tree.

> Did that checker find anything
> else noteworthy in scripts/kconfig?

Not that I know of.

johannes

