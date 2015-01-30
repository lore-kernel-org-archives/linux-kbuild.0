Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53564 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759913AbbA3K72 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Jan 2015 05:59:28 -0500
Message-ID: <54CB640B.4030707@suse.cz>
Date: Fri, 30 Jan 2015 11:59:23 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v12 01/28] scripts/gdb: Add infrastructure
References: <cover.1422602696.git.jan.kiszka@siemens.com> <dac94f3b72cb0de147e679a605eec64528b8bf76.1422602696.git.jan.kiszka@siemens.com>
In-Reply-To: <dac94f3b72cb0de147e679a605eec64528b8bf76.1422602696.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Wessel <jason.wessel@windriver.com>, kgdb-bugreport@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, Ben Widawsky <ben@bwidawsk.net>, Borislav Petkov <bp@suse.de>, linux-kbuild@vger.kernel.org

On 2015-01-30 08:24, Jan Kiszka wrote:
> This provides the basic infrastructure to load kernel-specific python
> helper scripts when debugging the kernel in gdb.
> 
> The loading mechanism is based on gdb loading for <objfile>-gdb.py when
> opening <objfile>. Therefore, this places a corresponding link to the
> main helper script into the output directory that contains vmlinux.
> 
> The main scripts will pull in submodules containing Linux specific gdb
> commands and functions. To avoid polluting the source directory with
> compiled python modules, we link to them from the object directory.
> 
> Due to gdb.parse_and_eval and string redirection for gdb.execute, we
> depend on gdb >= 7.2.
> 
> This feature is enabled via CONFIG_GDB_SCRIPTS.
> 
> CC: Michal Marek <mmarek@suse.cz>
> CC: linux-kbuild@vger.kernel.org
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Makefile                      |  5 ++++-
>  lib/Kconfig.debug             | 11 +++++++++++
>  scripts/Makefile              |  1 +
>  scripts/gdb/Makefile          |  1 +
>  scripts/gdb/linux/Makefile    | 11 +++++++++++

For the kbuild stuff:
Acked-by: Michal Marek <mmarek@suse.cz>

Michal
