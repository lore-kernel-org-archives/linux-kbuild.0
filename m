Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55658 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751173AbaGKNfn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2014 09:35:43 -0400
Message-ID: <53BFE82B.9060802@suse.cz>
Date: Fri, 11 Jul 2014 15:35:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/5] kbuild: drop shared library support from Makefile.host
References: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com> <1402287394-31133-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402287394-31133-4-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

On 2014-06-09 06:16, Masahiro Yamada wrote:
> The shared library feature in Makefile.host is no longer used.
> Rip it off to keep the build infrastucture simple.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
> Changes in v2:
>   - Newly added
> 
>  scripts/Makefile.host | 43 +++----------------------------------------
>  1 file changed, 3 insertions(+), 40 deletions(-)

Hi Masahiro-san,

sorry for the late review. This change looks good, given that the usage
of shared libraries has been dropped almost ten years ago :). Just
please also remove section 4.3 of Documentation/kbuild/makefiles.txt.

Michal
