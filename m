Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:21339 "EHLO david.siemens.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754707Ab3AWMFK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2013 07:05:10 -0500
Message-ID: <50FFD1B8.8050002@siemens.com>
Date: Wed, 23 Jan 2013 13:04:08 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/13] scripts/gdb: Add infrastructure
References: <cover.1358787929.git.jan.kiszka@siemens.com> <1e49f090f16f3e22711a27f473e2ed604f6a249f.1358787929.git.jan.kiszka@siemens.com> <20130123114157.GB4256@pd.tnic> <50FFCD04.2030207@siemens.com> <20130123120116.GC4256@pd.tnic>
In-Reply-To: <20130123120116.GC4256@pd.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, Tom Tromey <tromey@redhat.com>, Ben Widawsky <ben@bwidawsk.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 2013-01-23 13:01, Borislav Petkov wrote:
> On Wed, Jan 23, 2013 at 12:44:04PM +0100, Jan Kiszka wrote:
>> I wonder why we should do this, remove the convenience of the
>> automatic script setup, but I'm open for arguments.
> 
> Only one: you get the symlink
> 
> vmlinux-gdb.py -> /..../scripts/gdb/vmlinux-gdb.py
> 
> created automatically when CONFIG_DEBUG_INFO is enabled and people who
> enable CONFIG_DEBUG_INFO for other reasons and don't want to use gdb to
> debug the kernel don't need it but will get it anyway.

A lot of stuff is generated in the output directories during the kernel
build, so I wonder if this one really matters.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux
