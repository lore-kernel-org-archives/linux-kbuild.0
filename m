Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41147 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934043Ab3DKK3F (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Apr 2013 06:29:05 -0400
Message-ID: <5166906E.9060502@suse.cz>
Date: Thu, 11 Apr 2013 12:29:02 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 24/27] kbuild: Introduce KCONFIG_AUTOCONFIGDEP variable
 for conf tool
References: <1364843930-17974-1-git-send-email-jolsa@redhat.com> <1364843930-17974-25-git-send-email-jolsa@redhat.com>
In-Reply-To: <1364843930-17974-25-git-send-email-jolsa@redhat.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, Paul Mackerras <paulus@samba.org>, Corey Ashford <cjashfor@linux.vnet.ibm.com>, Frederic Weisbecker <fweisbec@gmail.com>, Namhyung Kim <namhyung@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-kbuild@vger.kernel.org, Stephane Eranian <eranian@google.com>

On 1.4.2013 21:18, Jiri Olsa wrote:
> Introducing KCONFIG_AUTOCONFIGDEP variable for conf tool
> allowing to specify custom auto.conf.cmd file.

I suggest to just append .cmd to the auto.conf name, instead of
introducing a new environment variable.

(I haven't looked at the rest of the patches yet).

Michal
