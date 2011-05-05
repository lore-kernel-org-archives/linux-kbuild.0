Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52712 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754693Ab1EEOSf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2011 10:18:35 -0400
Date: Thu, 5 May 2011 16:18:33 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [RFC 1/9] genksyms: rename parser files
Message-ID: <20110505141833.GF13293@sepie.suse.cz>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
 <1304561004-2684-2-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304561004-2684-2-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, May 04, 2011 at 10:03:16PM -0400, Arnaud Lacombe wrote:
> Rename parser's files to make them follow the same convention as `kconfig'.

This mail didn't reach the mailing list, probably for size reasons. I
suggest you create the patch with the -M option, it will be a bit harder to
apply, but people will be able to see it.


> ---
>  scripts/genksyms/genksyms.gperf          |   56 +
>  scripts/genksyms/genksyms.hash.c_shipped |  220 +++
>  scripts/genksyms/genksyms.l              |  409 +++++
>  scripts/genksyms/genksyms.tab.c_shipped  | 2353 ++++++++++++++++++++++++++
>  scripts/genksyms/genksyms.tab.h_shipped  |  139 ++
>  scripts/genksyms/genksyms.y              |  473 ++++++
>  scripts/genksyms/keywords.c_shipped      |  220 ---
>  scripts/genksyms/keywords.gperf          |   56 -
>  scripts/genksyms/lex.c_shipped           | 2709 ------------------------------
>  scripts/genksyms/lex.genksyms.c_shipped  | 2709 ++++++++++++++++++++++++++++++
>  scripts/genksyms/lex.l                   |  409 -----
>  scripts/genksyms/parse.c_shipped         | 2353 --------------------------
>  scripts/genksyms/parse.h_shipped         |  139 --
>  scripts/genksyms/parse.y                 |  473 ------

Renaming lex.l is a good idea, lex.lex.c would look silly. But I would
leave parse.y and keywords.gperf and only rename the _shipped files to
match what the new rules do. The names are local to the directory, so
there is no urgent need to change them (and the history is easier to
view if there are fewer renames).

Michal
