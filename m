Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:36648 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751309AbbDTUMl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 16:12:41 -0400
Date: Mon, 20 Apr 2015 17:12:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH 1/3] tools build: No need to make libapi for perf
 explicitly
Message-ID: <20150420201237.GN11111@kernel.org>
References: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
 <1429389280-18720-2-git-send-email-jolsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429389280-18720-2-git-send-email-jolsa@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Em Sat, Apr 18, 2015 at 10:34:38PM +0200, Jiri Olsa escreveu:
> The perf build handles its dependencies by itself.
> 
> Also renaming libapi libapikfs to libapi as it got
> changed just recently.

Thanks, applied.
