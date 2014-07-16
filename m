Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32892 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964942AbaGPP37 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 11:29:59 -0400
Message-ID: <53C69A75.4060906@suse.cz>
Date: Wed, 16 Jul 2014 17:29:57 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/5] kbuild: Clean-up and bug fixes of scripts/Makefile.host
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

On 2014-07-16 09:12, Masahiro Yamada wrote:
> Masahiro Yamada (5):
>   kbuild: fix a typo in scripts/Makefile.host
>   kbuild: fix a bug of C++ host program handling
>   kbuild: drop shared library support from Makefile.host
>   kbuild: clean up scripts/Makefile.host
>   kbuild: clean-up and bug fix of scripts/Makefile.host
> 
>  Documentation/kbuild/makefiles.txt | 39 +++++-------------------
>  scripts/Makefile.host              | 61 ++++++--------------------------------
>  2 files changed, 17 insertions(+), 83 deletions(-)

Applied to kbuild.git#kbuild, thanks!

Michal

