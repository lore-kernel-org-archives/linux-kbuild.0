Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:20961 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755166Ab0DNXtP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Apr 2010 19:49:15 -0400
Date: Wed, 14 Apr 2010 16:48:47 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH 6/6] gconfig: add support to show hidden options that
 have prompts
Message-Id: <20100414164847.661fe9d6.randy.dunlap@oracle.com>
In-Reply-To: <4BC53A90.9020304@cn.fujitsu.com>
References: <4BC539DD.5040003@cn.fujitsu.com>
	<4BC53A90.9020304@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Li Zefan <lizf@cn.fujitsu.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Tim Bird <tim.bird@am.sony.com>

On Wed, 14 Apr 2010 11:46:24 +0800 Li Zefan wrote:

> There's a button in gconfig to "Show all options", but I think
> normally we are not interested in those configs which have no
> prompt and thus can't be changed, so here I add a new button to
> show hidden options which have prompts.

(The new option is called "Show all prompt options".)

These patches are looking good so far in my limited testing.

However, if gconfig is going to live, it needs at least one more thing:
it should display the kconfig symbol type (tristate, boolean, etc.)
like xconfig does (explicitly) and menuconfig does (by using [x] or <x>
in the menu).

thanks,
---
~Randy
