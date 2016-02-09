Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57342 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756066AbcBIEP2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 23:15:28 -0500
Date: Tue, 9 Feb 2016 04:15:25 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH 1/6] kbuild: record needed exported symbols for modules
Message-ID: <20160209041525.GF17997@ZenIV.linux.org.uk>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
 <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Mon, Feb 08, 2016 at 03:28:30PM -0500, Nicolas Pitre wrote:
> +ifdef CONFIG_TRIM_UNUSED_EXPSYMS
> +cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U \(.*\)/\1/p' | xargs echo

Umm...  sed -nre 's/^ +U //p', perhaps?
