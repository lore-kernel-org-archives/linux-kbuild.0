Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55717 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750979AbaFJL0S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 07:26:18 -0400
Message-ID: <5396EB58.1030504@suse.cz>
Date: Tue, 10 Jun 2014 13:26:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: make KBUILD_SHELL overridable and document
 it
References: <1402396043-31532-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402396043-31532-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

On 2014-06-10 12:27, Masahiro Yamada wrote:
> It seems reasonable enough to allow users to change KBUILD_SHELL from
> environments. Also describe it in Documentation/kbuild/kbuild.txt.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Marek <mmarek@suse.cz>
> ---
> 
> Changes in v2:
>   - set KBUILD_SHELL by "?="

Um, that's not really what I meant. That the variable cannot be changed
from the environment is a good thing, in my opinion. One can override it
to test if the scripts are compatible with e.g. dash, but it's unlikely
to be used for some other reason by regular users or kernel developers.

Michal
