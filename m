Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48438 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750716Ab3CFQYK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Mar 2013 11:24:10 -0500
Message-ID: <51376DA9.3010807@suse.cz>
Date: Wed, 06 Mar 2013 17:24:09 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: make headers_install fail when path is too long
References: <51372591.1090606@6wind.com> <20130306161026.GA13449@merkur.ravnborg.org>
In-Reply-To: <20130306161026.GA13449@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Dne 6.3.2013 17:10, Sam Ravnborg napsal(a):
> On Wed, Mar 06, 2013 at 12:16:33PM +0100, Nicolas Dichtel wrote:
>> This problem has probably already been reported, but I don't find the fix 
>> in a kernel.org tree and I don't understand why.
> 
> First time I see this bug described - but I may missed it here at kbuild.
> If a patch exists then please include the patch in your mail so we can
> see it and comment on it.

Yes. If it's an obvious bug fix like this, simply send it to lkml and
linux-kbuild.

Michal

