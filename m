Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54103 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752150Ab1DUUkO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Apr 2011 16:40:14 -0400
Message-ID: <4DB09629.7080008@suse.cz>
Date: Thu, 21 Apr 2011 22:40:09 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 07/11] kbuild/recordmcount: Add RECORDMCOUNT_WARN
 to warn about mcount callers
References: <20110421022825.535486725@goodmis.org> <20110421023738.714956282@goodmis.org>
In-Reply-To: <20110421023738.714956282@goodmis.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org

On 21.4.2011 04:28, Steven Rostedt wrote:
> +ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
> +  RECORDMCOUNT_FLAGS = -w
> +endif

RECORDMCOUNT_WARN is IMO unlikely to be used with some other meaning in
the environment, so I think you can drop the origin check. Nevertheless

Acked-by: Michal Marek <mmarek@suse.cz>

Michal
